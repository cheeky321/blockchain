%{
int COMMENT=0;
%}
id [a-z][a-z0-9]*
%%
#.* {printf("\n%s is a PREPROCESSOR DIRECTIVE",yytext);}
int|double|char {printf("\n %s is a KEYWORD",yytext);}
if|then|endif|for|while {printf("\n %s is a KEYWORD",yytext);}
else {printf("\n %s is a KEYWORD",yytext);}
"/*" {COMMENT=1;}
"*/" {COMMENT=0;}
{id}\( {if(!COMMENT)printf("\n\nFUNCTION\n %s",yytext);}
{id}(\[[0-9]*\])? {if(!COMMENT) printf("\n %s identifier",yytext);}
\{ {if(!COMMENT) printf("\n BLOCK BEGINS");ECHO; }
\} {if(!COMMENT)printf("\n BLOCK ends");ECHO; }
\".*\" {if(!COMMENT)printf("\n %s is a STRING",yytext);}
[+\-]?[0-9]+ {if(!COMMENT)printf("\n %s is a NUMBER",yytext);}
\( {if(!COMMENT)printf("\n ( is delim openparanthesis");}
\) {if(!COMMENT)printf("\n ) is delim closed paranthesis");}
\; {if(!COMMENT)printf("\n ; is delim semicolon");}
\= {if(!COMMENT)printf("\n %s is an ASSIGNMENT OPERATOR",yytext);}
\<|\> {printf("\n %s is relational operator",yytext);}
"+"|"-"|"*"|"/" {printf("\n %s is an operator",yytext);}
"\n" ;
%%
int main()
{
yylex ();
}
int yywrap()
{
return 1;
}
