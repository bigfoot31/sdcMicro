The following 16 files were written by **Probhonjon Baruah** as part of Google Summer of Code 2016 under the organization **TU Wien** with the help of mentor **Matthias Templ**. 
Following is a brief description of the files created.

**1. test_addNoise.R :<br>**
	this function was created for the function addNoise. The code is divided into two parts (a) tests for dataframe (b) tests for sdcObject. The types of data used are : data without missing value, data with entire one column and row with missing values, data with only one column, data with factors. Each of the two parts is divided into 6 parts, one for each method : additive (default), correlated, correlated2, ROMM, restr, outdect. Then for each method two different values of noise was used: 150 (default) and 20.

	BUGS reported:
	* no difference between noise = 150 & 20 in correlated2 & ROMM method
	* outdect method on df shows warning that sample is too small when using 5x3 matrix must use 10x3 matrix, check covMcd method
	* warning in one entire column NAs warning, expected ??
	* correlated will not work on one column, seems reasonable
	* too many NAs does not create sdcObject
	* correlated works on sdcObject one column, but why???
	* outdect cant handle too many NAs because of covMcd function,( shows n<=p  you must be serious!)
	* sdc, without numeric, ROMM  @risk$numeric does not change, remains 1
	* sdc, with only one column with NAs @risk$numeric does not change, remains 1
	* sdc, more columns then rows, ROMM @risk$numeric does not change, remains 1
	* why should manipKeyVars change?? it is not changing


**2. test_calcRisks.R :<br>**
	this function was created for the function calcRisks. The code is written for only sdcObject. The two data types used are (a) data without missing value (b) data with missing value.

	No BUGS reported.


**3. test_dataGen.R :<br>**
	this function was created for the function dataGen. The code is written for both sdcObject and dataframe. The two data types used are (a) data without missing value (b) data with missing value.

	BUGS reported:
	* in case of data with missing data, error "the leading minor of order 1 is not positive definite" is shown
	* in dataframe method minimum data created is of length 200. So if we want low amount of data per column created we cant


**4. test_freqCalc.R :<br>**
	this function was created for the function freqCalc. The code is written for only dataframe, the code for sdcObject is left to be written. The two data types used are (a) data without missing value (b) data with missing value (c) data with one column and one row with missing values (d) data with one column with missing (e) data with more columns then rows. Each part is then divided into two parts based on whether it has weight or no weight and then again whether fast method or non-fast method was used.

	Work Left : write code for sdcObject type data
	No BUGS reported :


**5. test_generateStrata.R :<br>**
	this function was created for the function generateStrata. The code is written for only sdcObject. The two data types used are (a) data without missing value (b) data with missing value. Each part is then divided into two parts based on whether it was divided into two levels or three levels

	No BUGS reported.


**6. test_globalRecode.R :<br>**
	this function was created for the function globalRecode. The code is divided into two parts : (a) dataframe (b) sdcObject. Each has continuous and categorical data. Each part has been divided into 4 separate parts : equidistant, logEqui, equalAmount, none. Also each method has been divided into 3 parts corresponding to the three different types of breaks: only 1, more than 1 breaks, cutoff style breaks. Along with the breaks the code is again divided into 3 parts with labels: present, not present, invalid number of labels.

	BUGS reported:
	*	line no. = 76 in globalRecode.R
	  	logEqui <- function(x, b = breaks) {
	    b1 <- log(x)
	    b1 <- seq(min(b1), max(b1), length.out = b + 1)
	    b1 <- round(exp(b1))
	    b1

		the way you cut the data into various intervals, you take the smallest number as open bracket. e.g if the data is 1,2,2,4,9 then the intervals may be (1,4], (4,9]. As a result 1 will be excluded and shown as NA in the final results.

		This is true for method "logEqui", "equalAmount" and is only found in case of categorical values or in continuous values (when the smallest number is a integer). 
		All the incomplete tests are because of the above issue.

	* breaks = 1 in method equidistant shows invalid number of breaks
	* sdc method not detecting manipNumVars (numeric data)


**7. test_groupvars.R :<br>**
	this function was created for the function groupVars. The code is written for only sdcObject. The two data types used are (a) data without missing value (b) data with missing value.

	No BUGS reported.


**8. test_indivRisk.R :<br>**
	this function was created for the function indivRisk. The code is written for only freqCalc, code for sdcObject is yet to be written. The two data types used are (a) data without missing value (b) data with missing value. The code is divided based on whether method is approx / exact and again based on whether qual is default / different.

	BUGS reported :
	* diff qual score does not make diff in population, maybe because my example is not good for population


**9. test_localSuppression.R :<br>**
	this function was created for the function localSuppression. The code is written for both dataframe and sdcObject. The two data types used are (a) data without missing value (b) data with missing value. Each data types are divided into two parts based on k-anonymity (2 or 3), then each individual part is divided based on importance (NULL/c(3,1,2)/c(1,2,3)) and again based on combs (NULL / c(3:2) / c(1:2))

	No BUGS reported.


**10. test_modRisks.R :<br>**
	this function was created for the function modRisks. The code is written for both dataframe and sdcObject. The two data types used are (a) data without missing value (b) data with missing value. Each data types are divided into five parts default, CE, PML, weightedLLM, IPF. Then each individual part is divided based on whether the data is weighted or not and again based on bounds (yes / no)

	BUGS reported:
	* IPF is not working in my case, however it seems to work with the example given in the tutorial PDF.
	* warning messages in case missing values in all methods. Is it ok?
	* method CE in case of missing values shows error.
	* no difference when bound value is changed in case of missing values


**11. test_pram.R :<br>**
	this function was created for the function pram. The code is written for both dataframe and sdcObject. The three data types used are (a) data without missing value (b) data with missing value (c) data with more columns then rows with missing values. Each data types are divided into two parts based on whether one or many stratavariables were used. Then each individual part is divided based on whether one or many variables were used. Then each section is divided based on pd values (default / different) and alpha (default / different)

	No BUGS reported.


**12. test_shuffle.R :<br>**
	this function was created for the function shuffle. The code is written only for dataframe. The only data types used is (a) data without missing value. Each data types are divided into three parts based on method = ds, mvn, mlm. Then each part is divided whether there is weight or no weight. Then each part is again divided by covmethod = spearman, pearson, mcd then again divided by regmethod = lm, MM and then again by gadp = TRUE/FALSE.
	
	To write : all test for data type (b) data with missing value (c)  data with one column with missing value (d)  data with more columns than rows with missing value. And also for sdcObject.

	BUGS reported : 
	* no colnames returned for parameters : mvn, without, spearman, MM
	* no colnames returned for parameters : mvn, without, pearson, MM
	* what happens to sdcMicro Object when gadp = TRUE/FALSE
	* no difference between lm and MM method for sdcMicro Object, method = ds
	* in case of weighted, the error appears everywhere #variable lengths differ (found for '(weights)')


**13. test_suda2.R :<br>**
	this function was created for the function suda. The code is written for both dataframe and sdcObject. The four data types used are (a) data without missing value (b) data with missing value (c) data with one column with missing (d) data with more columns then rows with missing values. Each data types are divided into two parts based on whether default or different value of DisFraction is used.

	No BUGS reported.


**14. test_topBotCoding.R :<br>**
	this function was created for the function suda. The code is written for both dataframe and sdcObject. The two data types used are (a) data without missing value (b) data with missing value. Each data types are divided into two parts based on whether values were substituted using the option top or bottom

	No BUGS reported.


**15. test_varToFactor.R :<br>**
	this function was created for the function varToFactor. The code is written for only sdcObject. The two data types used are (a) data without missing value (b) data with missing value.

	No BUGS reported.


**16. test_varToNumeric.R :<br>**
	this function was created for the function varToNumeric. The code is written for only sdcObject. The two data types used are (a) data without missing value (b) data with missing value.

	BUGS reported:
	* Not mentioned in the description / tutorial PDF.