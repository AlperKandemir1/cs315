%option
sign 			[+-]
digit 			[0-9]
integer 		[+-]?[0-9]+
float   		[+-]?[0-9]?(\.)[0-9]+
alphabetic 		[A-Za-zçşöğüı]
alphanumeric 		({alphabetic}|{digit})
extrachars 		[.!#£$%&_]
char 			\"({alphanumeric}|{extrachars}|" ")?\"
string 			\'({alphanumeric}|{extrachars}|" ")*\'
identifier		[A-Za-z]+({alphanumeric})*
start_key		START
stop_key		STOP
RETURN			RETURN
assignment_opt 		\=
left_curly_bracket 	\{
right_curly_bracket 	\}
equality_opt		\=\=
not_equal		\<\>
letf_parant 		\(
right_parant		\)
comma 			\,
dot			\.
scolon 			\;
colon			\:
double_colon		\:\:
left_bracket 		\[
right_bracket 		\]
bigger 			>
smaller 		<
bigger_equal 		>=
smaller_equal 		<=	
plus			\+
minus			\-
mul			\*
div			\/
mod 			%
pow			\*\*
in 		 	\+\+
dec			\-\-
bool 			TRUE|true|FALSE|false
while_w			while
for_w			for
end_w			end
do_w			do
if_w			if
switch_w		switch
else_w			else
case_w			case
cut_w			cut
default_w		default
set_w 			set
empty_set		\{\}
del_set_w		del_set
boolean_w		bool		
int_w			int
float_w			fl
string_w		str
number_w		num
char_w			ch
void_w			void
intset_w		intset 
strset_w		strset
boolset_w		boolset
float_set		floatset
char_set		charset
input_w			to
output_w		display
read_line		read
write_w			write
in_w			in
console_read		console
subset_s		Ω
not_belongs_s		@’
belongs_s		@
supset_s		¬
proper_subset_s		ß
not_subset_s		Ω’
universal_set_s		α
not_proper_subset_s	ß’
symm_diff_s		∆
union_s			#
intersec_s		\$
setdiff_s 		~
complement_s 		\^ 
comment			\^\^({alphanumeric}|{extrachars}|" ")*
max_pf			max
min_pf			min
avg_pf			avg
sum_pf			sum
mul_pf			mul
cardi_pf		cardinality
dot_pro_pf		dot_product
cross_pro_pf		cross_product
abs_pf			abs			
find_pf			find
findset_pf		findset
flush_pf		flush
venn_pf			venn
insert_pf		insert
del_pf			del
size_pf			size
change_pf		change
and			\&\&			
or			\|\|
new_line 		\n
%%
{start_key}		return START;
{stop_key}		return STOP;
{while_w}		return WHILE;
{for_w}			return FOR; 
{end_w}			return END; 
{do_w}			return DO; 
{RETURN}		return RETURN;
{if_w}			return IF;
{switch_w}		return SWITCH;
{else_w}		return ELSE;
{case_w}		return CASE;
{cut_w}			return CUT;
{default_w}		return DEFAULT;
{set_w} 		return SET_TYPE;
{del_set_w}		return DEL_SET;
{boolean_w}		return BOOL_TYPE;		
{int_w}			return INT_TYPE;
{float_w}		return FLOAT_TYPE;
{string_w}		return STRING_TYPE;
{char_w}		return CHAR_TYPE;
{intset_w}		return INTSET;
{strset_w}		return STRSET;
{boolset_w}		return BOOLSET;
{float_set}		return FLOATSET;
{char_set}		return CHARSET;
{void_w}		return VOID_TYPE;
{input_w}		return TO;
{output_w}		return DISPLAY;
{read_line}		return READ;
{write_w}		return WRITE;
{in_w}			return IN;
{console_read}		return CONSOLE;
{bigger} 		return GREATER_THAN_OP;
{smaller} 		return LESS_THAN_OP;
{bigger_equal} 		return GREATER_THAN_EQUAL_OP;
{smaller_equal} 	return LESS_THAN_EQUAL_OP;
{plus}			return PLUS;
{minus}			return MINUS;
{mul}			return MUL;
{div}			return DIVISION;
{mod}			return MODULO;
{pow}			return POWER;
{in} 		 	return INCREMENT;
{dec}			return DECREMENT;
{bool} 			return BOOLEAN;
{assignment_opt} 	return ASSIGNMENT_OP;
{left_curly_bracket} 	return LEFT_CURLY_BRACKET;
{right_curly_bracket} 	return RIGHT_CURLY_BRACKET;
{equality_opt}		return EQUALITY_OP;
{not_equal}		return NOT_EQUAL_OP;
{letf_parant} 		return LEFT_PARANT;
{right_parant}		return RIGHT_PARANT;
{comma} 		return COMMA;
{dot}			return DOT;
{scolon} 		return SEMICOLON;
{colon}			return COLON;
{double_colon}		return DOUBLE_COLON;
{left_bracket} 		return LEFT_BRACKET;
{right_bracket} 	return RIGHT_BRACKET;
{subset_s}		return SUBSET;
{not_belongs_s}		return NOT_BELONGS;
{belongs_s}		return BELONGS;
{supset_s}		return SUPSET;
{proper_subset_s}	return PROPER_SUBSET;
{not_subset_s}		return NOT_SUBSET;
{universal_set_s}	return UNIVERSAL_SET;
{not_proper_subset_s}	return NOT_PROPER_SUBSET;
{symm_diff_s}		return SYMM_DIFF;
{union_s}		return UNION;
{intersec_s}		return INTERSEC;
{setdiff_s}		return SETDIFF;
{complement_s}		return COMPLEMENT;
{comment}		return COMMENT;
{max_pf}		return MAX;
{min_pf}		return MIN;
{avg_pf}		return AVG;
{sum_pf}		return SUM;
{mul_pf}		return MUL;
{cardi_pf}		return CARDINALITY;
{dot_pro_pf}		return DOT_PRODUCT;
{cross_pro_pf}		return CROSS_PRODUCT;
{abs_pf}		return ABS;			
{find_pf}		return FIND;
{findset_pf}		return FINDSET;
{flush_pf}		return FLUSH;
{venn_pf}		return VENN_SCH;
{insert_pf}		return INSERT;
{del_pf}		return DELETE;
{size_pf}		return SIZE;
{change_pf}		return CHANGE;
{identifier}		return IDENTIFIER;
{integer} 		return INTEGER;
{float}   		return FLOAT;
{string}		return STRING;
{char}			return CHAR;
{and}			return AND;		
{or}			return OR;	
{empty_set}		return EMPTY_SET;
{new_line} 		{extern int lineno; lineno++;}
. 			;
%%
int yywrap() { 
return 1; }