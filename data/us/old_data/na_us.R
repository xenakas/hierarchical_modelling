install.packages("fredr")

library(fredr)
fredr_set_key("b3d40809f9fb9e2b87dbbde0f2b0558d")


states = c('Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
           'Colorado', 'Connecticut', 'Delaware', 'District of Columbia',
           'Far West', 'Florida', 'Georgia', 'Great Lakes', 'Hawaii', 'Idaho',
           'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana',
           'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Mideast',
           'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska',
           'Nevada', 'New England', 'New Hampshire', 'New Jersey',
           'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio',
           'Oklahoma', 'Oregon', 'Pennsylvania', 'Plains', 'Rhode Island',
           'Rocky Mountain', 'South Carolina', 'South Dakota', 'Southeast',
           'Southwest', 'Tennessee', 'Texas',  'Utah',
           'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin',
           'Wyoming')

industries = c ('Accommodation and food services',
                'Administrative and waste management services',
                'Agriculture, forestry, fishing, and hunting',
                'All industry total', 'Arts, entertainment, and recreation',
                'Construction', 'Educational services', 'Finance and insurance',
                'Government', 'Health care and social assistance', 'Information',
                'Management of companies and enterprises', 'Manufacturing',
                'Mining', 'Other services, except government',
                'Private industries',
                'Professional, scientific, and technical services',
                'Real estate and rental and leasing', 'Retail trade',
                'Transportation and warehousing', 'Utilities', 'Wholesale trade')



dict = c()

for (state in states){
  
  data = fredr_series_search_text(search_text = paste("Real Gross Domestic Product by Industry", state ) , filter_variable = "frequency", filter_value = "Quarterly") 
  
  data = subset(data, units == "Millions of Chained 2009 Dollars")
  
  dict = rbind(dict, data.frame(data$id, data$title)  )
  
}



id_list = as.character(dict$data.id)

# gdp_us = c()
# 
# for (id in id_list){
#   gdp_us = rbind(gdp_us, fredr(series_id = id )  )
#   }


library(purrr)

gdp_us = map_dfr(id_list, fredr) 


a1 = fredr(  series_id = "IARQGSP"  )

write.csv(dict, file = "dictionary.csv")

write.csv(gdp_us, file = "naus_unlabelled.csv")

