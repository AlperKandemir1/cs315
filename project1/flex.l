%option main
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
new_line 		\n
tab			\t
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
intersec_s		§
setdiff_s 		~
complement_s 		\^ 
comment			\^({alphanumeric}|{extrachars}|" ")*\^
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
and			\&\&			
or			\|\|
%%
{while_w}		printf("while ");
{for_w}			printf("for ");
{end_w}			printf("end ");
{do_w}			printf("do ");
{if_w}			printf("if ");
{switch_w}		printf("switch ");
{else_w}		printf("else ");
{case_w}		printf("case ");
{cut_w}			printf("cut ");
{default_w}		printf("default ");
{set_w} 		printf("set_type ");
{del_set_w}		printf("del_set ");
{boolean_w}		printf("bool_type ");		
{int_w}			printf("int_type ");
{float_w}		printf("fl_type ");
{string_w}		printf("str_type ");
{number_w}		printf("num_type ");
{char_w}		printf("ch_type ");
{input_w}		printf("to ");
{output_w}		printf("display ");
{read_line}		printf("read ");
{write_w}		printf("write ");
{in_w}			printf("in ");
{console_read}		printf("console ");
{bigger} 		printf("bigger than ");
{smaller} 		printf("less than ");
{bigger_equal} 		printf("bigger equal ");
{smaller_equal} 	printf("less equal ");
{plus}			printf("plus ");
{minus}			printf("minus ");
{mul}			printf("mul ");
{div}			printf("division ");
{mod}			printf("modulo ");
{pow}			printf("power ");
{in} 		 	printf("increment ");
{dec}			printf("decrement ");
{bool} 			printf("boolean ");
{assignment_opt} 	printf("assignment_opt ");
{left_curly_bracket} 	printf("left_curly_bracket ");
{right_curly_bracket} 	printf("right_curly_bracket ");
{equality_opt}		printf("equality_opt ");
{not_equal}		printf("not_equal ");
{letf_parant} 		printf("letf_parant ");
{right_parant}		printf("right_parant ");
{comma} 		printf("comma ");
{dot}			printf("dot ");
{scolon} 		printf("semicolon ");
{colon}			printf("colon ");
{double_colon}		printf("double_colon ");
{left_bracket} 		printf("left_bracket ");
{right_bracket} 	printf("right_bracket ");
{subset_s}		printf("subset ");
{not_belongs_s}		printf("not_belongs ");
{belongs_s}		printf("belongs ");
{supset_s}		printf("supset ");
{proper_subset_s}	printf("proper_subset ");
{not_subset_s}		printf("not_subset ");
{universal_set_s}	printf("universal_set ");
{not_proper_subset_s}	printf("not_proper_subset ");
{symm_diff_s}		printf("symm_diff ");
{union_s}		printf("union ");
{intersec_s}		printf("intersec ");
{setdiff_s}		printf("setdiff ");
{complement_s}		printf("complement ");
{comment}		printf("comment ");
{max_pf}		printf("max ");
{min_pf}		printf("min ");
{avg_pf}		printf("avg ");
{sum_pf}		printf("sum ");
{mul_pf}		printf("mul ");
{cardi_pf}		printf("cardinality ");
{dot_pro_pf}		printf("dot_product ");
{cross_pro_pf}		printf("cross_product ");
{abs_pf}		printf("abs ");			
{find_pf}		printf("find ");
{findset_pf}		printf("findset ");
{flush_pf}		printf("flush ");
{venn_pf}		printf("venn_sch ");
{insert_pf}		printf("insert ");
{del_pf}		printf("delete ");
{size_pf}		printf("size ");
{identifier}		printf("identifier ");
{digit} 		printf("digit ");
{integer} 		printf("integer ");
{float}   		printf("float ");
{string}		printf("string ");
{char}			printf("char ");
{and}			printf("AND ");		
{or}			printf("OR ");	
{empty_set}		printf("empty set ");
. 			;
