%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char *yytext;
extern FILE *yyin;

int yylex(void);
void yyerror(const char *s);
%}

%token CADENA
%start input

%%

input :
      | input S
      ;

S : CADENA {
        int len = strlen(yytext);
        int a_count = 0, b_count = 0;
        int valid = 1;
        for (int i = 0; i < len; i++) {
            if (yytext[i] == 'a') a_count++;
            else if (yytext[i] == 'b') b_count++;
            else { valid = 0; break; }
        }
        if (valid && a_count <= b_count && b_count > 0)
            printf("%s -> acepta\n", yytext);
        else
            printf("%s -> NO acepta\n", yytext);
    }
  ;

%%

void yyerror(const char *s) {
    printf("%s -> NO acepta\n", yytext);
}

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *f = fopen(argv[1], "r");
        if (!f) { perror(argv[1]); return 1; }
        yyin = f;
    }
    yyparse();
    return 0;
}

