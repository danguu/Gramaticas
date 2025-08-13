%{
#include "g_1.tab.h"
%}

%%

[01]+   { return CADENA; }
\n      { /* ignorar saltos */ }
.       { return yytext[0]; }

%%

int yywrap(void) { return 1; }

