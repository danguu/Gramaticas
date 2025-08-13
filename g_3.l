%{
#include "g_3.tab.h"
%}

%%

[a|b]+  { return CADENA; }
\n      { /* ignorar */ }
.       { return yytext[0]; }

%%

int yywrap(void) { return 1; }


