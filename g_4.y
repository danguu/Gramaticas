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
        if (strcmp(yytext, "a") == 0 ||
            strcmp(yytext, "b") == 0 ||
            strcmp(yytext, "ab") == 0)
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

