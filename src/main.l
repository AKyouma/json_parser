
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

INTEIRO [0-9]+
FLOAT ([0-9]+[.][0-9]+)
STRING (\"[A-Za-z]+\")

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
[\t] ;
[\n] ;
[[:space:]] ;

%%

int yywrap() {
  return 1;
}
