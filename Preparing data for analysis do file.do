* Preparing data for analysis.
use relate.dta

/*I selected a set of four items to measure how adolescents feel about their mothers and another set of four parallel 
items to measure how adolescents feel about their fathers*/

/* replace thenumericmissingvalues (-5,-4,-3,-2, and-1)
withvalues thatStatarecognizesas representingmissingvalues. Statarecognizesup
to27differentmissingvalues foreachvariable: .(adot), .a, .b, ..., .z. Notethat
amissingvaluewillbelargerthananynumericvalue */

mvdecode _all, mv(-5=.a\-4=.b\-3=.c\-2=.d\-1=.e)

* Creating value labels 
. varmanage
 label define often 0 "Never" 1 "Rarely" 2 "Sometimes " 3 "Usually" 4 "Always " .a "Noninterview " .b "Valid skip" .d "Don't know " .e "Refused "

 * Change the variable labels 
 label variable R3483700 "Mother criticizes child’s ideas"
 label variable R3483800 "Mother helps child with what is important to child"
 label variable R3483900 "Mother blames child for problems"
 label variable R3485200 "Father praises child for doing well"
 label variable R3485300 "Father criticizes child’s ideas"
 label variable R3485400 "Father helps child with what is important to child"
 label variable R3485500 "Father blames child for problems"
 label variable R3485500 "Mother praises child for doing well"
 
 /* We have two items for the mother and two for the father that are stated negatively, so
we should reverse code these. R3483700 refers to the mother criticizing the adolescent,
and R3485300 refers to the father criticizing the adolescent. R3483900 and R3485500
refer to the mother and father blaming the adolescent for problems. For these items, an
adolescent who reports that this always happens would mean that the adolescent had
a low rating of his or her parent. We always want a higher score to signify more of the
variable. A score of 0 for never blames the child on this pair of items should be the
highest score on these items (4), and a response of always blames the child should be
the worst response and would have the lowest score (0). */

recode R3483700 R3483900 R3485300 R3485500 (0=4) (1=3) (2=2) (3=1) (4=0),generate(momcritr momblamer dadcritr dadblamer)

* Create variable labels for the created variables that tells us what really happened after recoding the variables

label variable momcritr "Mother criticizes child’s ideas, reverses R3483700"
label variable momblamer "Mother blames child for problems, reverses R3483900"
label variable dadcritr "Father criticizes child’s ideas, reverses R3485300"
label variable dadblamer "Father blames child for problems, reverses R3485500"


* Tabulate command to see if we did the right thing.
tabulate momcritr R3483700

* Create the value labels for the new created variables
label define often_r 4 "Never" 3 "Rarely" 2 "Sometimes" 1 "Usually" 0 "Always".a "Noninterview" .b "Valid skip" .c "Invalid skip" .d "Don’t know"
 .e "Refusal"

 * Assign the often_r to the new variables 
 label values momcritr momblamer dadcritr dadblamer often_r
 
clonevar id = R0000100
clonevar sex = R3828700
clonevar age = R3828100
clonevar mompraise = R3483600
clonevar momhelp = R3483800
clonevar dadpraise = R3485200
clonevar dadhelp = R3485400






