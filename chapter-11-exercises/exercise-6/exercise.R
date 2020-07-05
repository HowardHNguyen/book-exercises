# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?


# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?

#identify the airline carrier that has the highest # of delayed flights
has_most_delays <- flights %>% #start withthe flights
  group_by(carrier) %>%     #group by airline carrier
  filter(dep_delay > 0) %>% #find only the delays
  summarize(num_delay = n()) %>%  #count the observations
  filter(num_delay == max(num_delay)) %>% #find the most delayed
  select(carrier) #select the airline

has_most_delays

most_delay_name <- has_most_delays %>% #start with previous result
  left_join(airlines, by = "carrier") %>% # join on airline ID
  select(name) #select airlin name
print(most_delay_name$name) #access the value of the tibble
