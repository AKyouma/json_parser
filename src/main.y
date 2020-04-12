%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);

%}

%token ABRE_CH FECHA_CH VIRGULA ABRE FECHA DP STRING INTEIRO FLOAT

%%

ROTINA:
	OBJETO{
		printf("VALIDO\n");}

OBJETO: 
	ABRE_CH CONTEUDO FECHA_CH
	;

CONTEUDO: 
	ITEM VIRGULA CONTEUDO
	| ITEM
	;

VETOR:
	ABRE VARIOS FECHA
	| ABRE FECHA

ITEM:
	STRING DP VALOR
	;

VARIOS:
	VALOR
	| VALOR VIRGULA VARIOS
	;

VALOR:
	OBJETO
	|VETOR
	|STRING
	|INTEIRO
	|FLOAT
	;


%%

void yyerror(char *s) {
	printf("INVALIDO\n");
	exit(1);
}

int main() {
  yyparse();
    return 0;

}
