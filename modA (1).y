%{
#include<stdio.h> 
#include<math.h>
extern FILE *yyin;
#define PI 3.14
#define CONST 0.5
%} 
%union{
int integer;
float real;
}
%token <integer> NUMBER <real> FLOAT
%token  find area volume of circle square rectangle triangle cube slab cone sphere having radius length width and hight
%type <real> S E A V
%%
S: find E {$$=$2;};

E: area of A	{$$=$3;}
  |volume of V	{$$=$3;}
  ;

A: circle having radius NUMBER   {$$=PI*$4*$4;printf("Area of circle having radius %d is %f\n",$4,$$);}
  |circle having radius FLOAT    {$$=PI*$4*$4;printf("Area of circle having radius %f is %f\n",$4,$$);}
  |square having length NUMBER   {$$=$4*$4;printf("Area of square having length %d is %f\n",$4,$$);}
  |square having length FLOAT    {$$=$4*$4;printf("Area of square having length %f is %f\n",$4,$$);}
  |rectangle having length NUMBER and width NUMBER   {$$=$4*$7;printf("Area of square having length %d and width %d is %f\n",$4,$7,$$);}
  |rectangle having length FLOAT and width FLOAT     {$$=$4*$7;printf("Area of square having length %f and width %f is %f\n",$4,$7,$$);}
  |triangle having length NUMBER and hight NUMBER   {$$=CONST*$4*$7;printf("Area of triangle having length %d and hight %d is %f\n",$4,$7,$$);}
  |triangle having length FLOAT and hight FLOAT     {$$=CONST*$4*$7;printf("Area of triangle having length %f and hight %f is %f\n",$4,$7,$$);}
  ;

V: cube having length NUMBER	{$$=$4*$4*$4;printf("Volume of cube having length %d is %f\n",$4,$$);}
  |cube having length FLOAT	{$$=$4*$4*$4;printf("Volume of cube having length %f is %f\n",$4,$$);}
  |slab having length NUMBER and width NUMBER and hight NUMBER	{$$=$4*$7*$10;printf("Volume of slab having length %d width %d hight %d is %f\n",$4,$7,$10,$$);}
  |slab having length FLOAT and width FLOAT and hight FLOAT	{$$=$4*$7*$10;printf("Volume of slab having length %f width %f hight %f is %f\n",$4,$7,$10,$$);} 
  |cone having radius NUMBER and hight NUMBER	{$$=(PI*$4*$4*$7)/3;printf("Volume of cone having radius %d hight %d is %f\n",$4,$7,$$);}
  |cone having radius FLOAT and hight FLOAT	{$$=(PI*$4*$4*$7)/3;printf("Volume of cone having radius %f hight %f is %f\n",$4,$7,$$);}
  |sphere having radius NUMBER	{$$=(4*PI*$4*$4*$4)/3;printf("Volume of sphere having radius %d is %f\n",$4,$$);}
  |sphere having radius FLOAT	{$$=(4*PI*$4*$4*$4)/3;printf("Volume of sphere having radius %f is %f\n",$4,$$);}
  ;

%%
void yyerror(char *s){}
int main(int argc, char *argv[]) 
{
yyin=fopen(argv[1],"r");
int i;
for(i=1;i<=7;i++){
yyparse();
}
fclose(yyin);
return 0;
}