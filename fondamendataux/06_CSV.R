### Données CSV

## Charger ses données

donnees <- read.csv("./DATA/responses.csv", header = TRUE, sep = ",")

is.data.frame(donnees)


## Explorer ses données

View(donnees)

dim(donnees)

head(donnees)

colnames(donnees)

str(donnees)

summary(donnees)


## Manipuler ses données

# Exemple 1a : filtre sur les “female”
  
D <- donnees[ which(donnees$Gender == "female"), ]
dim(D)



# Exemple 1b : filtre sur les “female” âgées de “Moins de 20 ans”

D <- donnees[ which(donnees$Gender == "female" & 
                      donnees$Age < 20), ]
dim(D)


