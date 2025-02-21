%{
#include "value.h"
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"
#include "ts.h"
#include "ti.h"
%}

%option noyywrap

%%
[ \t]+	{}
"main" { return tMAIN; }

"if" { return tIF; }
"while" { return tWHI; }

"("	{ return tPO; }
")"	{ return tPF; }

"{" { return tAO;}
"}" { return tAF; }

";" { return tPV; }
"," { return tVIR; }
"else" { return tELSE;}

"==" { return tEGAL; }
"<" { return tINF; }
">" { return tSUP; }

"int" { return tINT; }
"const" { return tCONST; }

"="	{ return tAFFECT; }
"-"	{ return tSOU; }
"+"	{ return tADD; }
"*"	{ return tMUL; }
"/"	{ return tDIV; }

"&"     { return tESP; }

\/\/.*$ {}

"print" { return tPRINT; }

-?[0-9]+ {
        yylval.entier = atoi(yytext);
        return tENTIER;
    }

[ ]*[\t]*[,]* {}

\n	{}

[a-zA-Z]([a-zA-Z]*[0-9]*[_]*)* {
        yylval.var = strdup(yytext);
        return tNOM;
	}
