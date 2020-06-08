
%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+  {
		yylval.integer=atoi(yytext);
		return NUMBER;
		}
[0-9]*\.[0-9]+ {
		yylval.real=(float)atof(yytext); 
		return FLOAT;
		}
find 	{return find;}
area	{return area;}
volume 	{return volume;}
of 	{return of;}
circle		{return circle;}
square	{return square;}
triangle 	{return triangle;}
rectangle 	{return rectangle;}
cube 	{return cube;}
slab 	{return slab;}
cone 	{return cone;}
sphere 	{return sphere;}		
having		{return having;}
radius		{return radius;}
length      {return length;}
width 	    {return width;} 		 	
and	{return and;}
hight	{return hight;}
[\n]	{return yytext;}
[/t]	;
%%
int yywrap(){return 1;}