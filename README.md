# Barraza-Pena-Moreno contagion stochastic model applied to COVID-19


## MODEL REFERENCE 

Out model's main article:

[A non-homogeneous Markov early epidemic growth dynamics model. Application to the SARS-CoV-2 pandemic](https://doi.org/10.1016/j.chaos.2020.110297)

## SOURCE
The data we use comes from the Our World In Data website: 

[Our World In Data - Coronavirus Source Data](https://ourworldindata.org/coronavirus-source-data)

# SETUP

To start using the program, just clone or download everything from this repo. Then, before doing anything else, run the file "initialize.R". This will set up everything you need with our default configuration.

# AVAILIABLE FEATURES

The program currently has three main features.

- Fit the model to some selected dataset, therefore obtaining the model parameters and the mean value curve.
- Evaluate the evolution of the model parameters over time and display their respective curves.
- Calculate the mean time between failures and show its curve.

Additionally, we provide some useful minor functions.

## FIT DATASET

This function allows to chose the data from a specific country to fit the contagion model. The command has only 1 mandatory parameter, the country name. When executed, it displays the computed parameter values, the goodness of fit metrics and the model's mean value function estimated from the dataset.

> `fit_contagion_model("country_name")`

### Optional arguments

Several non-mandatory arguments are supported:

- *start*: slices the dataset keeping only the entries after the given value, and sets it as Day 1. Must be measured in days. By default it is 1.
- *end*: slices the dataset keeping only the entries before the given value, and sets it as the dataset end. Must be measured in days. By default it is the last entry of the dataset.
- *predict_until*: allows to perform the prediction up to some future day using the model. It is counted from the *start* value and must be lower than the remaining dataset segment.
- *dataset*: allows to choose between the total cases and total deaths dataset. By default it is set for total cases.
- *save*: allows to save the contents of the estimation in either the R workspace or a CSV file. By default the estimation is not saved.

### Examples

1.  You want to fit the whole dataset from Italy. After initializing, you just run this:  

	`fit_contagion_model("Italy")`

2.  You want to fit the whole dataset from Italy, but also see the model's prediction up to Day 150. You need to execute:  

	`fit_contagion_model("Italy", predict_until=150)`

3.  Your Italy fittings doesn't seem to behave well. You take a look at the dataset and you see that there were no cases until Day 31, so you want to begin your estimation there. You need to execute the command: 

	`fit_contagion_model("Italy", start=31)`

4.  You want to to estimate with just a subset of the dataset, for example, from Day 31 up to Day 65. The command you need is: 

	`fit_contagion_model("Italy", start=31, end=65)`

5.  You want to fit the deaths dataset. You need to execute:

	`fit_contagion_model("Italy", dataset="total_deaths")`

6. You need to keep the estimation results to load them on a different program. In order to do that, you need to save the estimation into a file. To do that, type:

	`fit_contagion_model("Italy", save='csv')`  

	You will find the file in the same directory where your R workspace is located, named `fit_total_cases_italy.csv`.  
**Note:** to just save the data as a workspace variable, set the *save* parameter as 'workspace'.

## OBSERVE PARAMETER VARIATION OVER TIME

This function provides the possibility of watching how the model's parameters evolve within different segments of the dataset. To achieve this, the program performs several fits of different subsets of the data, each subset starting at Day 1 and lasting up to different days, a behavior that can be controlled by the optional arguments. It requires only the country name as mandatory parameter. When executed, the curves of the model parameters versus time will be displayed.

> `analyze_model_parameters_over_time("country_name")`

### Optional arguments

Several non-mandatory arguments are supported:

- *start*: same as in the FIT DATASET section.
- *end*: same as in the FIT DATASET section.
- *start_from*: used to specify the end of the first subset fitted. By default it is Day 30, counted from the specified *start*.
- *by*: controls the steps between sucesive fits. By default it is 1.
- *dataset*: same as in the FIT DATASET section.
- *save*: same as in the FIT DATASET section.

### Examples

1. You want to study the variation of the parameters over time in the Spain dataset. You need to execute:
	
	`analyze_model_parameters_over_time("Spain")`

2. You want to study the variation of the parameters over time in the Spain dataset, beginning the analysis at Day 45. You need to execute:

	`analyze_model_parameters_over_time("Spain", start_from=45)`

3. You want to study the variation of the parameters over time in the Spain dataset, beginning the analysis at Day 150 and without taking into consideration the segment between Day 1 and Day 90. You need to execute:

	`analyze_model_parameters_over_time("Spain", start=90, start_from=150)`

4. You want to study the variation of the parameters over time in the Spain dataset, beginning the analysis the 45th day, but your computer is slow and the calculations take too long. This can be solved by evaluating only certain datasets instead of every possible one, and then interpolating the samples. You choose to fit the datasets every 5 days; the command you need is:

	`analyze_model_parameters_over_time("Spain", start_from=45, by=5)`
 
## CALCULATE MEAN TIME BETWEEN INFECTIONS

The calculation of the MTBI is the main innovation introduced by our model. We propose not only to calculate it at a fixed time instant but to study its variation over time too, the same way we did with the model parameters. So, we provide a function that is capable of doing that. It works exactly the same way as the parameter evolution analysis, performing several fits over subsets of the data. The only mandatory parameter it takes is, again, the country name. The output are the MTBI curve over time, the currently minimum achieved value and a flag indicating if a local mínimum has been reached.

> `calculate_mtbi("country_name")`

### Optional arguments

- *start*: same as in the FIT DATASET section.
- *end*: same as in the FIT DATASET section.
- *start_from*: same as in the OBSERVE PARAMETER VARIATION OVER TIME section.
- *by*: same as in the OBSERVE PARAMETER VARIATION OVER TIME section.
- *dataset*: same as in the FIT DATASET section.
- *save*: same as in the FIT DATASET section.
- *plot_unit*: controls the units in which the MTBI is displayed. Can be set to days, minutes or seconds. By default is days.

### Examples

1. You want to see the mean time between infections of the brazilian dataset, beginning the analysis on day 40 up to day 80. The command you need is:

	`calculate_mtbi("Brazil", start_from=40, end=80)`

2. You want to calculate the mean time between infections of the brazilian dataset, taking samples every 2 days, and save it as a data frame on the workspace. You need to execute the command:

	`calculate_mtbi("Brazil", by=2, save='workspace')`

**Note:** if you want to observe an 'instant' MTBI instead of the curve, just save the MTBI estimation into your workspace or a CSV file and look for it.

3. You want to see the MTBI of the United States dataset, shown in minutes and seconds. You want the following commands:

	`calculate_mtbi("United.States", plot_unit='min')`
	`calculate_mtbi("United.States", plot_unit='sec')`

## ADDITIONAL FEATURES

### VIEW THE COUNTRY LIST

To view all the availiable countries (and, of course, the names by which you may call them), just run the command
> `show_availiable_countries()`  

which takes no parameters.

### VIEW THE DATA OF A SINGLE COUNTRY

To view the current dataset of a country, run the command 
>`show_data_from_country("country_name)`

### CHANGING THE DATA SOURCE URL

If you have another data source, different than the Our World In Data website, you can retrieve data from it. However, you have to be sure that the data format is identical as the one we used. The command to select your data url is:
>`change_data_source_url('http://your_url')`

In addition, we provide a function to reset the source to the default Our World In Data dataset.
>`reset_data_source_to_default()`

# CREDITS

- [Dr. Néstor Barraza](https://www.researchgate.net/profile/Nestor_Barraza) (leader of the research team and original autor of the model)  
- [Eng. Gabriel Pena](https://www.researchgate.net/profile/Gabriel_Pena4) (researcher and developer of this software)  
- [Dr. Verónica Moreno](https://www.researchgate.net/profile/Veronica_Moreno17) (researcher and the mathematics expert of the team)  
- [UNTREF Universidad Nacional de Tres de Febrero](https://untref.edu.ar/) (sponsor) 


