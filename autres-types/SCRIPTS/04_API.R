###########
### API ###
###########

### Récupération des données

library(httr)
library(jsonlite)

# URL des données nous intéressant

url <- "https://data.enedis.fr/api/records/1.0/search?dataset=bilan-electrique-jour&sort=jour&rows=50"


# Récupération des données

res <- GET(url = url)

res$status_code


# Re-travail des données

json_data <- rawToChar(res$content)

list_data <- fromJSON(json_data)

names(list_data)

data_df <- list_data$records$fields


# Explorations

colnames(data_df)

head(data_df)

options(scipen=999)

summary(data_df$consommation_totale)


### Data visualisation : barplot interactif

## Version 1

library(plotly)

data_viz <- data.frame(Jour = format(as.Date(data_df$jour), "%d/%m/%Y"),
                       Conso = round(data_df$consommation_totale/1000, 0))

plot_ly(data_viz, x = ~Jour, y = ~Conso, type = "bar")


## Version 2 : personnalisée

# Axes

y_axis <- list(title = "Conso électrique")

x_axis <- list(title = " ",
               tickfont = list(size = 6),
               type = "category",
               tickangle = -45)

# Graph

plot_ly(data_viz, x = ~Jour, y = ~Conso, type = "bar",
        marker = list(color = "#26B0BF"),
        hoverinfo = "text",
        text = ~paste0(Jour, " : ", Conso, " kWh/jour")) %>%
        layout(title = "Consommation Totale par jour en kWh",
               xaxis = x_axis, yaxis = y_axis)

