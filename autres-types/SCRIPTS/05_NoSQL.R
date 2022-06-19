#######################
### NoSQL - MongoDB ###
#######################

### Récupération et stockage des données

library(mongolite)

col_people <- mongo(collection="personnages", verbose=FALSE)

col_people$count()


library(jsonlite)

obj <- fromJSON("http://swapi.co/api/people/")

col_people$insert(obj$results)

col_people$count()




### Manipulation sur les données

## Recherche

col_people$find(query='{"gender":"male"}')

col_people$find(query='{"gender":"male"}', fields='{"name":1}')

col_people$find(query='{"gender":"male"}', fields='{"_id":0, "name":1}')


## Tri

col_people$find(fields='{"_id":0, "name":1}', sort='{"name":1}')


## Valeurs uniques

col_people$distinct(key="gender")
 
col_people$find(query='{"gender": {"$nin":["male","female"]} }', 
                fields='{"name":1, "gender":1}')

col_people$distinct(key="hair_color", query='{"gender":"female"}')



### Data Visualisation : tableau de données pour le web

## Données

data_viz <- col_people$find(fields='{"_id":0, "name":1, "gender":1, "height":1,"eye_color":1 }')


## Version 1

library(DT)

datatable(data_viz)


## Version 2 : personnalisations

# Noms de colonnes

datatable(data_viz,
          colnames = c("Nom", "Taille", "Couleur des yeux", "Genre"))


# Pagination

datatable(data_viz,
          colnames = c("Nom", "Taille", "Couleur des yeux", "Genre"),
          option = list(pageLength = 5,
                        lengthMenu = list(c(2, 5, -1), c("2", "5", "Tout"))
                        )
          )

# Langue

datatable(data_viz,
          colnames = c("Nom", "Taille", "Couleur des yeux", "Genre"),
          option = list(pageLength = 5,
                        lengthMenu = list(c(2, 5, -1), c("2", "5", "Tout")),
                        language = list(url = '//cdn.datatables.net/plug-ins/1.10.11/i18n/French.json')
                        )
          )



