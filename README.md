# coronavirus_contagion_model

SOURCE: the data we use comes from the Our World In Data website: https://ourworldindata.org/coronavirus-source-data

USAGE

1. SET UP:
Before doing anything, run all the code in the sript named "initialize.R". This sets up everything you'll need.

2. GET THE COUNTRY LIST:
To view all the availiable countries, just run the command "show_availiable_countries", which takes no parameters.

3. FIT A COUNTRY'S DATA:
Execute the command "fit_contagion_model". This function takes 1 mandatory parameter, the country name, and 3 optional parameters: "predict_until", "start" and "end". The country name must be identical to the one in the country list, so looking at it first is recommended. See the examples for more information on the optional parameters.



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

Please take into account that only the country parameter is mandatory; about the optional parameters, you can use any of them by itself, all of them or none.
