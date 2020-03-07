global x1 educ potexper ability
global x2 mothered fathered siblings

global y logwage

regress $y $x1
regress $y $x2


regress $y $x2, noconstant
regress $y $x1, noconstant


regress $y $x1 $x2
regress $y $x1 $x2, noconstant

*part e 



*linear relationship MR1 
ovtest

*heteroskedasticity  MR2
estat hettest

*multicolinearity MR5 
vif 

*normal distribution of errors MR6 
predict ehat, resid
kdensity ehat



*question2 
gen percq = gasexp/gasp*pop

 regress percq income gasp pnc puc ppt pd pn ps year
 
*PART B ****
regress percq puc pnc 
test [puc] == [pnc]


*PART C****
*own elasticity of demand
regress percq gasp
margins if year==2004, eyex(gasp)

*income elasticity 
regress percq income
margins if year==2004, eyex(income)

*cross price elasticity
regress percq ppt
margins if year==2004, eyex( ppt)

*PART D***

gen lpnc = log(pnc)

gen lpuc = log(puc) 

gen lppt = log(ppt) 

gen lpd = log(pd) 

gen lpn = log(pn)

gen lps = log(ps) 

gen lgasp = log(gasp)

regress lpercq lincome lgasp lpnc lpuc lppt lpd lpn lps

**PART E****
correlate pnc puc ppt pd pn ps gasp

***PART F****
gen ngasp = (gasp/1.239 ) 
gen npd = (pd/1.148)
gen npnc = (pnc/ 1.339)
 gen npd = (pd/1.148)
 gen nppt = (ppt/ 2.091)
  gen npuc = (pnc/ 1.333)
  
  regress percq income ngasp npnc npuc nppt npd npn nps year 
  
  gen nlpnc = log(npnc)
gen nlpuc = log(npuc) 
gen nlppt = log(nppt) 
gen nlpd = log(npd) 
gen nlpn = log(npn)
gen nlps = log(nps) 
gen nlgasp = log(ngasp)
regress lpercq lincome nlgasp nlpnc nlpuc nlppt nlpd nlpn nlps



*eyex is the %change, the one we use for elasticity 
*part f: go with division. the behavior won't change anyways. Do the relationships become better or worse when we smooth out the data? 


