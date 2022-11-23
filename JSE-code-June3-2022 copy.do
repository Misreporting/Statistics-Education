
keep male black_hispanic math_confidence0 coding_experience0 coding_confidence0 coursename hs freshman sophomore junior senior gradstudent othergrade pre_schyear_07 age17_22 software past_R_experience past_Stata_experience past_SAS_experience R_software SAS SPSS StatCrunch Stata software semester uscitizen uscitizen_missing  apstat0 hsstat0 collstat0 firstcourse0  freereducedlunch firstgen liberalarts cc flagship regional hispanic black asian white pacificislander amerindian fall2018 fall2019 spring2019 summer2019 winter2019 winter2020 past_R_experience past_Stata_experience past_SAS_experience past_html_experience past_SPSS_experience past_java_experience past_matlab_experience past_python_experience reward1 efficacy_gain28 progconf0  pre_age_q rsch_exp0  math_selfefficacy0 pre_schyear_07  software_code _mi_miss



use "/Users/jerosenbaum/Library/CloudStorage/OneDrive-DownstateMedicalCenter/projects/dierker/Code to submit to JSE/studentprepostthrough2019_2020update-USonly minimal.dta" 

**************** PRODUCE TABLE 2

tab1      math_confidence0
tab coding_confidence0
tab coding_experience0 coding_confidence0, row chi2


tab1 hs freshman sophomore junior senior gradstudent othergrade
tab coding_experience0 coding_confidence0
tab   pre_schyear_07 age17_22, col


* Association between experience and confidence
tab coding_experience0
tab coding_confidence0  coding_experience0 , col chi2
tab   coding_experience0 coding_confidence0, col chi2
tab   coding_experience0 math_confidence0, col chi2
* progconf0



tab1 pre_expcode_c*

tab past_R_experience software
tab past_Stata_experience software
tab past_SAS_experience software


* Distinctionb etween coding_confidence0 and progconf0
tab coding_confidence0  progconf0
tab1 coding_confidence0  math_confidence0

tab   SAS coding_confidence0, col chi2

	tab   software coding_confidence0, col chi2

	tab     semester coding_confidence0, col chi2

	tab     uscitizen coding_confidence0, col chi2
	tab     uscitizen_missing coding_confidence0, col chi2
	tab     firstgen coding_confidence0, col chi2
	tab     pre_schyear_07 coding_confidence0, col chi2


	
foreach x in male  age17_22 firstgen coll_math_sci course_required_gened0 course_required_major0 course_useful0{ 
	tab   `x' coding_confidence0, col chi2
}

foreach x in male age17_22 firstgen coll_math_sci course_required_gened0 course_required_major0 course_useful0{ 
	tab   `x' math_confidence0, col chi2
}

foreach x in liberalarts cc flagship regional  { 
	tab   `x' coding_confidence0, col chi2
}

foreach x in liberalarts cc flagship regional  { 
	tab   `x' math_confidence0, col chi2
}


foreach x in hs freshman sophomore junior senior gradstudent othergrade { 
	tab   `x' coding_confidence0, col chi2
}

foreach x in hs freshman sophomore junior senior gradstudent othergrade { 
	tab   `x' math_confidence0, col chi2
}


foreach x in R_software SAS SPSS StatCrunch Stata { 
	tab   `x' coding_confidence0, col chi2
}

foreach x in R_software SAS SPSS StatCrunch Stata { 
	tab   `x' math_confidence0, col chi2
}

tab1 hispanic black asian white pacificislander amerindian


foreach x in hispanic black asian white pacificislander amerindian  { 
	tab   `x' coding_confidence0, col chi2
}

foreach x in hispanic black asian white pacificislander amerindian  { 
	tab   `x' math_confidence0, col chi2
}

foreach x in apstat0 hsstat0 collstat0 firstcourse0  freereducedlunch firstgen  {
	tab   `x' coding_confidence0, col chi2
}

foreach x in apstat0 hsstat0 collstat0 firstcourse0  freereducedlunch firstgen  {
	tab   `x' math_confidence0, col chi2
}

tab   firstgen coding_confidence0, col chi2
tab   firstgen math_confidence0, col chi2

foreach x in fall2018 fall2019 spring2019 summer2019 winter2019 winter2020{
	tab   `x' coding_confidence0, col chi2
}
foreach x in fall2018 fall2019 spring2019 summer2019 winter2019 winter2020{
	tab   `x' math_confidence0, col chi2
}

foreach x in past_R_experience past_Stata_experience past_SAS_experience past_html_experience past_SPSS_experience past_java_experience past_matlab_experience past_python_experience{
	tab   `x' coding_confidence0, col chi2
}
foreach x in past_R_experience past_Stata_experience past_SAS_experience past_html_experience past_SPSS_experience past_java_experience past_matlab_experience past_python_experience{
	tab   `x' math_confidence0, col chi2
}


**************** Multiple imputation

*** Impute missing data

mi set wide
mi register imputed reward1 efficacy_gain28 progconf0  pre_age_q rsch_exp0  math_selfefficacy0 pre_schyear_07 

mi impute mvn reward1 efficacy_gain28 progconf0  pre_age_q rsch_exp0  math_selfefficacy0 pre_schyear_07  = firstgen firstcourse0 freereducedlunch liberalarts  flagship regional  freshman sophomore junior senior gradstudent  hispanic black asian white male , add(35)

mi describe
mi varying 


*** Diagnostics

midiagplots efficacy_gain28, plottype(kdensity)  sample(all) ksmirnov  m(2)
midiagplots efficacy_gain28, plottype(kdensity)  sample(all) ksmirnov  combine

midiagplots reward1, plottype(kdensity)  sample(all) ksmirnov  m(2)

midiagplots reward1, plottype(kdensity)  sample(all) ksmirnov  combine


midiagplots progconf0,  sample(all) ksmirnov  m(2)
midiagplots pre_age_q,  sample(all) ksmirnov  m(2)

midiagplots rsch_exp0,  sample(all) ksmirnov  combine

midiagplots progconf0,  sample(all) ksmirnov  combine

midiagplots pre_age_q,  sample(all) ksmirnov  combine

midiagplots math_selfefficacy0,  sample(all) ksmirnov  combine

midiagplots pre_schyear_07,  sample(all) ksmirnov  combine

**** Do analysis. 

*** Full n=801 
mi estimate: mixed reward1  progconf0 math_selfefficacy0 black_hispanic male firstgen freereducedlunch firstcourse0 pre_age_q software_code || coursename:

estimates store Intentions

mi estimate: mixed efficacy_gain28  progconf0 math_selfefficacy0 black_hispanic male firstgen freereducedlunch firstcourse0 pre_age_q software_code || coursename:

estimates store PerceivedAchievement
coefplot D F, drop(_cons) xline(0)


*** Limited to later data

* Called Statistical intentions in paper 
mi estimate: mixed reward1  progconf0 math_selfefficacy0 black_hispanic male firstgen freereducedlunch firstcourse0 pre_age_q software_code if fall2019==1 | winter2020==1 || coursename:
estimates store StatisticalIntentions

* Called perceived achievement
mi estimate: mixed efficacy_gain28  progconf0 math_selfefficacy0 black_hispanic male firstgen freereducedlunch firstcourse0 pre_age_q software_code if fall2019==1 | winter2020==1 || coursename:
estimates store PerceivedAchievement

* cismooth

coefplot (StatisticalIntentions, label(Statistical Intentions)) (PerceivedAchievement, label(Perceived Achievement)), drop(_cons) xline(0) sort(, descending) graphregion(color(white)) bgcolor(white)  rename(progconf0="Coding confidence" math_selfefficacy0="Math confidence" black_hispanic="Minoritized" male="Male vs. non-male" firstgen="First generation" freereducedlunch = "Free/reduced lunch" firstcourse0 ="First statistics course" pre_age_q = "Age" software_code="Code vs. menu software")


**** Check residuals

mixed reward1  progconf0 math_selfefficacy0 black_hispanic male firstgen freereducedlunch firstcourse0 pre_age_q software_code if fall2019==1 | winter2020==1 || coursename:
predict fixed, xb
predict resid, residuals
twoway scatter resid fixed
qnorm resid

mixed efficacy_gain28  progconf0 math_selfefficacy0 black_hispanic male firstgen freereducedlunch firstcourse0 pre_age_q software_code if fall2019==1 | winter2020==1 || coursename:
predict fixed, xb
predict resid, residuals
twoway scatter resid fixed
qnorm resid


*** Effect size measures : statistical intentions reward1

meglm reward1  progconf0 math_selfefficacy0 black_hispanic male firstgen freereducedlunch firstcourse0 pre_age_q software_code  || coursename:

matrix ab=e(b)
matrix list ab
global Vab = ab[1,12]

meglm reward1  progconf0 math_selfefficacy0 black_hispanic male firstgen freereducedlunch firstcourse0 pre_age_q software_code || coursename:, coeflegend

constraint 1 _b[/var(_cons[coursename])= ab[1,11]

meglm reward1  math_selfefficacy0 black_hispanic male firstgen freereducedlunch firstcourse0 pre_age_q software_code  || coursename:, constraints(1)

matrix a = e(b)
matrix li a

 global Va = a[1,11]
 
 meglm reward1   || coursename:, constraints(1)

matrix null=e(b)
matrix list null

global Vnull = null[1,3]

global R2ab = ($Vnull - $Vab)/$Vnull
global R2a = ($Vnull - $Va)/$Vnull

display "Proportion explained full model = $R2ab"
display "Proportion explained reduced model = $R2a"

global f2b = ($R2ab - $R2a)/(1-$R2ab)

display "Effect size = $f2b"

*** Effect size measures : perceived achievement


meglm efficacy_gain28  progconf0 math_selfefficacy0 black_hispanic male firstgen freereducedlunch firstcourse0 pre_age_q software_code  || coursename:

matrix ab=e(b)
matrix list ab
global Vab = ab[1,12]

meglm efficacy_gain28  progconf0 math_selfefficacy0 black_hispanic male firstgen freereducedlunch firstcourse0 pre_age_q software_code || coursename:, coeflegend

constraint 1 _b[/var(_cons[coursename])= ab[1,11]

meglm efficacy_gain28  math_selfefficacy0 black_hispanic male firstgen freereducedlunch firstcourse0 pre_age_q software_code  || coursename:, constraints(1)

matrix a = e(b)
matrix li a

 global Va = a[1,11]
 
 meglm reward1   || coursename:, constraints(1)

matrix null=e(b)
matrix list null

global Vnull = null[1,3]

global R2ab = ($Vnull - $Vab)/$Vnull
global R2a = ($Vnull - $Va)/$Vnull

display "Proportion explained full model = $R2ab"
display "Proportion explained reduced model = $R2a"

global f2b = ($R2ab - $R2a)/(1-$R2ab)

display "Effect size = $f2b"


