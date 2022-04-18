%{
 #include <stdio.h>
 extern FILE *yyin;	
%}

%token START STOP WHILE FOR END DO IF SWITCH ELSE CASE CUT DEFAULT
%token DEL_SET BOOL_TYPE SET_TYPE BOOL_TYPE INT_TYPE FLOAT_TYPE STRING_TYPE CHAR_TYPE VOID_TYPE
%token TO DISPLAY READ WRITE IN CONSOLE
%token GREATER_THAN_OP LESS_THAN_EQUAL_OP GREATER_THAN_EQUAL_OP LESS_THAN_OP EQUALITY_OP NOT_EQUAL_OP  
%token MINUS PLUS DIVISION MUL MODULO POWER
%token INCREMENT DECREMENT NEWLINE
%token ASSIGNMENT_OP RETURN
%token LEFT_CURLY_BRACKET RIGHT_CURLY_BRACKET 
%token EQUALITY_OP NOT_EQUAL_OP
%token LEFT_PARANT RIGHT_PARANT	
%token COMMA DOT SEMICOLON COLON DOUBLE_COLON
%token LEFT_BRACKET RIGHT_BRACKET
%token SUBSET NOT_BELONGS BELONGS SUPSET PROPER_SUBSET UNIVERSAL_SET NOT_SUBSET NOT_PROPER_SUBSET SYMM_DIFF
%token UNION INTERSEC SETDIFF COMPLEMENT COMMENT
%token MAX MIN AVG SUM MUL CARDINALITY DOT_PRODUCT CROSS_PRODUCT ABS FIND FINDSET FLUSH VENN_SCH INSERT DELETE SIZE CHANGE
%token IDENTIFIER INTEGER FLOAT STRING CHAR BOOLEAN AND OR EMPTY_SET INTSET STRSET BOOLSET FLOATSET CHARSET
%%
program:
	START statements STOP {printf("Valid program.\n");};
statements:
	statement SEMICOLON
	|statement SEMICOLON statements;
statement: 
	assignment
	|expression
	|declaration
	|loops
	|functions
	|if_stmt
	|set_op
	|COMMENT
	|input
	|output
	|read_line
	|write
	|console_read
	|primitive_func
	|DEL_SET IDENTIFIER
	|increment
	|decrement
	|set_relations;
assignment:
	IDENTIFIER ASSIGNMENT_OP statement
	|IDENTIFIER ASSIGNMENT_OP set_type set_list
	|IDENTIFIER ASSIGNMENT_OP type_variable
	|IDENTIFIER ASSIGNMENT_OP IDENTIFIER;
expression: 
	type_variable relational type_variable
	|type_variable arithmetic type_variable
	|IDENTIFIER relational IDENTIFIER
	|IDENTIFIER arithmetic IDENTIFIER
	|IDENTIFIER relational type_variable
	|IDENTIFIER arithmetic type_variable;
declaration:
	type_identifier IDENTIFIER;
type_variable:
	INTEGER 
	|FLOAT 
	|STRING 
	|CHAR
	|BOOLEAN
	|EMPTY_SET;		 	
relational:
	GREATER_THAN_OP
	|LESS_THAN_EQUAL_OP
	|GREATER_THAN_EQUAL_OP
	|LESS_THAN_OP
	|EQUALITY_OP
	|NOT_EQUAL_OP;
arithmetic:
	MINUS 
	|PLUS
	|DIVISION 
	|MUL
	|MODULO
	|POWER;
set_type:
	INTSET 
	|STRSET
	|BOOLSET
	|FLOATSET
	|CHARSET
set_list: 
	int_set
        |string_set
        |float_set
        |char_set 
        |EMPTY_SET;
int_set: 
	LEFT_CURLY_BRACKET int_set_var RIGHT_CURLY_BRACKET;
string_set:
	LEFT_CURLY_BRACKET string_set_var RIGHT_CURLY_BRACKET;
float_set:
	LEFT_CURLY_BRACKET float_set_var RIGHT_CURLY_BRACKET;
char_set:
	LEFT_CURLY_BRACKET char_set_var RIGHT_CURLY_BRACKET;
int_set_var:
	INTEGER 
	|INTEGER COMMA int_set_var;
string_set_var:
	STRING 
	|STRING COMMA string_set_var
float_set_var:
	FLOAT 
	|FLOAT COMMA float_set_var;
char_set_var:
	CHAR 
	|CHAR COMMA char_set_var;
set_relations: 
	set_list relation_operator set_list;
relation_operator:
		SUBSET
		|NOT_BELONGS
		|BELONGS
		|SUPSET 
		|PROPER_SUBSET
		|UNIVERSAL_SET 
		|NOT_SUBSET
		|NOT_PROPER_SUBSET
		|SYMM_DIFF;
type_identifier: 
	INT_TYPE
	|FLOAT_TYPE
	|STRING_TYPE 
	|CHAR_TYPE
	|SET_TYPE
	|VOID_TYPE
	|BOOL_TYPE;
loops:
	while_loop
	|for_loop
	|do_while;
while_loop:
	WHILE LEFT_PARANT expression RIGHT_PARANT LEFT_CURLY_BRACKET statements RIGHT_CURLY_BRACKET END;
for_loop:
	FOR LEFT_PARANT assignment DOUBLE_COLON expression DOUBLE_COLON expression RIGHT_PARANT LEFT_CURLY_BRACKET statements RIGHT_CURLY_BRACKET END;
do_while:
	DO LEFT_CURLY_BRACKET statements RIGHT_CURLY_BRACKET WHILE LEFT_PARANT expression RIGHT_PARANT END;
functions:
	func_defi
	|func_call
	|func_void
func_defi:
	type_identifier IDENTIFIER LEFT_PARANT parameters RIGHT_PARANT LEFT_CURLY_BRACKET statements RETURN return_statements RIGHT_CURLY_BRACKET
	|type_identifier IDENTIFIER LEFT_PARANT RIGHT_PARANT LEFT_CURLY_BRACKET statements RETURN return_statements RIGHT_CURLY_BRACKET;
func_call:
        |IDENTIFIER LEFT_PARANT call_parameters RIGHT_PARANT 
	|IDENTIFIER LEFT_PARANT RIGHT_PARANT 
	|IDENTIFIER LEFT_PARANT IDENTIFIER LEFT_PARANT RIGHT_PARANT RIGHT_PARANT 
	|IDENTIFIER LEFT_PARANT IDENTIFIER LEFT_PARANT call_parameters RIGHT_PARANT RIGHT_PARANT;
func_void:
	type_identifier IDENTIFIER LEFT_PARANT parameters RIGHT_PARANT LEFT_CURLY_BRACKET statements RIGHT_CURLY_BRACKET
	|type_identifier IDENTIFIER LEFT_PARANT RIGHT_PARANT LEFT_CURLY_BRACKET statements RIGHT_CURLY_BRACKET;
return_statements:
	expression SEMICOLON 
	|IDENTIFIER SEMICOLON
	|type_variable SEMICOLON;
call_parameters:
	IDENTIFIER
	|IDENTIFIER COMMA call_parameters;
parameters:
	parameter
	|parameter COMMA parameters;
parameter:
	type_identifier IDENTIFIER;
if_stmt:
	if_con
	|switch_con;
if_con:
	matched
	|unmatched;
matched:
	IF LEFT_PARANT expression RIGHT_PARANT matched ELSE matched
	|LEFT_CURLY_BRACKET statements RIGHT_CURLY_BRACKET;
unmatched:
	IF LEFT_PARANT expression RIGHT_PARANT if_con
	|IF LEFT_PARANT expression RIGHT_PARANT matched ELSE unmatched;
switch_con:
	SWITCH LEFT_PARANT IDENTIFIER RIGHT_PARANT switch_con
	|case_stm
	|case_stm switch_con;
case_stm: 
	CASE expression COLON statements CUT
	|default_case;
default_case:
	DEFAULT COLON statements CUT;
set_op: 
	IDENTIFIER set_opts IDENTIFIER;
set_opts: 
	UNION
	|INTERSEC
	|SETDIFF
	|COMPLEMENT;
input:
	TO IDENTIFIER;
output: 
	DISPLAY IDENTIFIER
	|DISPLAY type_variable;
read_line:
	READ LEFT_PARANT STRING RIGHT_PARANT;
write:
	WRITE LEFT_PARANT STRING IN STRING RIGHT_PARANT
	|WRITE LEFT_PARANT IDENTIFIER IN STRING RIGHT_PARANT;
console_read:
	CONSOLE DOT READ LEFT_PARANT STRING RIGHT_PARANT;
primitive_func:
	max_func
	|min_func
	|avg_func
	|sum_func
	|mul_func
	|cardinality_func 
	|dot_product_func
	|cross_product_func
	|abs_func
	|find_func	
	|findset_func
	|flush_func
	|venn_func
	|insert_func
	|del_func
	|size_func;
	|change_func;
max_func:
	IDENTIFIER DOT MAX LEFT_PARANT RIGHT_PARANT;
min_func:
	IDENTIFIER DOT MIN LEFT_PARANT RIGHT_PARANT;
avg_func:
	IDENTIFIER DOT AVG LEFT_PARANT RIGHT_PARANT;
sum_func:
	IDENTIFIER DOT SUM LEFT_PARANT RIGHT_PARANT;
mul_func:
	IDENTIFIER DOT MUL LEFT_PARANT RIGHT_PARANT;
cardinality_func:
	IDENTIFIER DOT CARDINALITY LEFT_PARANT RIGHT_PARANT;
dot_product_func:
	IDENTIFIER DOT DOT_PRODUCT LEFT_PARANT IDENTIFIER RIGHT_PARANT;
cross_product_func:
	IDENTIFIER DOT CROSS_PRODUCT LEFT_PARANT IDENTIFIER RIGHT_PARANT;
abs_func:
	IDENTIFIER DOT ABS LEFT_PARANT RIGHT_PARANT;
find_func:
	IDENTIFIER DOT FIND LEFT_PARANT IDENTIFIER RIGHT_PARANT;
findset_func:
	IDENTIFIER DOT FINDSET LEFT_PARANT IDENTIFIER RIGHT_PARANT;
flush_func:
	IDENTIFIER DOT FLUSH LEFT_PARANT RIGHT_PARANT;
venn_func:
	IDENTIFIER DOT VENN_SCH LEFT_PARANT IDENTIFIER RIGHT_PARANT;
insert_func:
	IDENTIFIER DOT INSERT LEFT_PARANT IDENTIFIER RIGHT_PARANT;
del_func:
	IDENTIFIER DOT DELETE LEFT_PARANT IDENTIFIER RIGHT_PARANT;
size_func:
	IDENTIFIER DOT SIZE LEFT_PARANT RIGHT_PARANT;
change_func:
	IDENTIFIER DOT CHANGE LEFT_PARANT IDENTIFIER COMMA INTEGER RIGHT_PARANT;
increment:
	IDENTIFIER INCREMENT;
decrement:
	IDENTIFIER DECREMENT;
%%
#include "lex.yy.c"
int lineno;
int main() {
 return yyparse();
}
int lineno=0;
int yyerror(const char *s) {
     printf("Syntax error on line %d!\n", lineno);
}