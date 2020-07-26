# covid19_contagion_model

SOURCE: the data we use comes from the Our World In Data website: https://ourworldindata.org/coronavirus-source-data

USAGE

1. SET UP:
Before doing anything, run all the code in the sript named "initialize.R". This sets up everything you'll need.

2. VIEW THE COUNTRY LIST:
To view all the availiable countries, just run the command "show_availiable_countries", which takes no parameters.

3. VIEW THE DATA OF A COUNTRY:
To view the current dataset of a country, run the commmand "show_data_from_country" with the country name as parameter.

4. FIT A COUNTRY'S DATA:
Execute the command "fit_contagion_model". This function takes 1 mandatory parameter, the country name, and 4 optional parameters: "predict_until", "start","end","dataset" and "save". The country name must be identical to the one in the country list, so looking at it first is recommended. Please take into account that only the country parameter is mandatory; about the optional parameters, you can use any of them by itself, all of them or none. The default dataset used for the fitting is the detected cases dataset. See the examples 3-5 and 14 for more information on the optional parameters. 

5. ANALYZE THE MODEL PARAMETERS VARIATON OVER THE DATASET
Execute the command "analyze_model_parameters_over_time". This function takes 1 mandatory parameter, the country name. Optional parameters are "start_from", "by", "end", "dataset" and "save". This function performs the model fit using different subsets of the data, each of them begginning in day 1 and ending in specified times. The "start_from" parameter, which is 30 by default, means "the ending day of the first subset to be evaluated". For some datasets, like the United States one, the fit may not converge on the default mode, so you can customize it into starting later by modifying that parameter. The "by" argument, which is 1 by default, specifies how often are subsets evaluated; the 1 default value means that every possible subset will be fitted. For higher values, the shown curves are interpolated. The dataset parameter works exactly as explained in (4). The last parameter, called "save", allows you to save the parameter estimation to a data frame in your workspace or a CSV file. See the examples 8-13 for more information on the optional parameters.

6. VIEW THE MEAN TIME BETWEEN INFECTIONS GRAPH AND ITS MINIMUM
Execute the command "calculate_mtbi". This function takes 1 mandatory parameter, the country name. The optional parameters are the same as in (5), plus an additional one to define the y-axis units (the default unit is 'day'). See the examples 8-13 and 15 for more information on the optional parameters.

MISCELLANEOUS

a) CHANGING DATA SOURCE URL
If you have another data source, different than the Our World In Data website, you can retrieve data from it. However, you have to be sure that the data format is identical as the one we used. The command to select another data source is
>change_data_source_url('http://your_url')

b) RESET THE DATA SOURCE TO DEFAULT
You can get back to the default data source everytime you want. Just execute
>reset_data_source_to_default()



USE EXAMPLES:

Example 1. You want to fit the whole dataset from Italy. After initializing, you just run this:
>fit_contagion_model("Italy")

Example 2. You want to fit the whole dataset from Antigua and Barbuda, but you aren't sure how to write it. Then, you execute
>show_availiable_countries()

and take a look at the list. It is shown as "Antigua.and.Barbuda", so the command you need is
>fit_contagion_model("Antigua.and.Barbuda")

Example 3. You want to fit the whole dataset from Italy, but also to see the model prediction until Day 150. Then, you need to execute:
>fit_contagion_model("Italy", predict_until=150)

Example 4. Your Italy fittings doesn't seem to behave well. You take a look at the dataset and you see that there were no cases until Day 31, so you want to begin your estimation there. You need to execute the command
>fit_contagion_model("Italy", start=31)

Example 5. You want to study the model's prediction power by comparing it to the real data. In order to do that, you need to estimate with just a subset of the dataset, for example, from Day 31 up to Day 65. The command you need is
>fit_contagion_model("Italy", start=31, end=65)

Example 6. You want to observe the dataset of Argentina. You need to execute
>show_data_from_country("Argentina")

Example 7. You want to study the variation of the parameters over time in the Spain dataset. You need to execute
>analyze_model_parameters_over_time("Spain")

Example 8. You want to study the variation of the parameters over time in the Spain dataset, but only until the 60th day. You need to execute
>analyze_model_parameters_over_time("Spain", end=60)

Example 9. You want to study the variation of the parameters over time in the Spain dataset, beginning the analysis the 45th day. You need to execute
>analyze_model_parameters_over_time("Spain", start_from=45)

Example 10. You want to study the variation of the parameters over time in the Spain dataset, beginning the analysis the 45th day, but your computer is slow and the calculations take too long. This can be solved by evaluating only certain datasets instead of every possible one, and then interpolating the samples. You choose to fit the datasets every 5 days; the command you need is 
>analyze_model_parameters_over_time("Spain", start_from=45, by=5)

Example 11. You want to see the mean time between infections of the brazilian dataset, beginning the analysis on day 40 up to day 80. The command you need is
>calculate_mtbi("Brazil", start_from=40, end=80)

Example 12. You want to calculate the mean time between infections of the brazilian dataset, taking samples every 2 days, and save it as a data frame on the workspace. You need to execute the command
>calculate_mtbi("Brazil", by=2, save='workspace')

Example 13. You want to calculate the mean time between infections of the brazilian dataset and save it into a CSV file. You need to execute the command
>calculate_mtbi("Brazil", save='csv')

You'll find the file on your R workspace, named "mtbi_brazil.csv".

Example 14. You want to fit the model to the argentinian dataset, but not to the curve of detected cases but to the curve of deaths. The command you need is
>fit_contagion_model("Argentina", dataset="total_deaths")

Example 15. You want to see the MTBI of the argentinian dataset, shown in minutes and seconds. You want the following commands:
>calculate_mtbi("Argentina", plot_unit='min')
>calculate_mtbi("Argentina", plot_unit='seg')