
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

INTEIRO [0-9]+
FLOAT ([0-9]+[.][0-9]+)
STRING (\"[^\"]*\")
/*Mudei para incluir números, mas continuava com erros, então coloquei quaisquer caracteres, exceto aspas"*/

%%
{INTEIRO} {return INTEIRO;}
{FLOAT}   {return FLOAT;}
{STRING}  {return STRING;}
[\[]      {return ABRE;}
[\]]      {return FECHA;}
[\{]      {return ABRE_CH;}
[\}]      {return FECHA_CH;}
[,]       {return VIRGULA;}
[:]	  {return DP;}
[\t]* ;
[\n]*;
[[:space:]]* ;

%%

int yywrap() {
  return 1;
}
