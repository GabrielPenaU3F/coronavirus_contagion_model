source("data_io.R")
source("contagion_model.R")
source("data_selection.R")
source("plots.R")

if (!data_is_in_workspace()) {
  data_url = "https://covid.ourworldindata.org/data/ecdc/total_cases.csv"
  total_cases_dataset = read_csv_data(data_url)
}