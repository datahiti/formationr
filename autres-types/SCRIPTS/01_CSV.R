###################
### Données CSV ###
###################

### Chargement des données

donnees <- read.csv("../DATA/responses.csv", header = TRUE, sep = ",")

is.data.frame(donnees)



### Premières explorations

dim(donnees)

colnames(donnees)

head(donnees)

str(donnees)

summary(donnees)




### Data visualisation : barplot du genre des étudiants

## Première version

tab <- table(donnees$Gender)
tab

barplot(tab)


## Deuxième version : suppression des "vides"

# Uniquement pour les données de "Gender"

Genre <- donnees$Gender

length(Genre)


vides <- which(Genre == "")

length(vides)


Genre <- Genre[ -vides ]

length(Genre)


tab <- table(Genre)
tab

barplot(tab)

# suppression de la catégorie "vide"

is.factor(Genre)

levels(Genre)


Genre <- droplevels(Genre, "")

levels(Genre)


tab <- table(Genre)
tab

barplot(tab)


# Dans tout le jeu de données

donnees2 <- read.csv("../DATA/responses.csv", header = TRUE, sep = ",",
                     na.strings = c(NA, ""))

Genre2 <- donnees2$Gender

levels(Genre2)


tab <- table(Genre2)
tab

barplot(tab)



## Personnalisation du graphique

tab <- table(Genre)
tab

barplot(tab)


# Changement des libellés

Genre <- factor(Genre, labels = c("Femme", "Homme"))

tab <- table(Genre)
tab

barplot(tab)


# Ajout d'un titre

titre <- "Effectif des étudiants par Genre"

barplot(tab, main = titre)


# Changer les couleurs

# Couleurs en R : 
# > valeur numérique (1, 2, 3, ...) 
# > nom de couleur ("red", "blue", ...)
# (liste des noms possibles : 
# http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf )
# > code hexadecimal ("#FFFFFF", ...) 
# > ...

couleurs <- c("#F4C791", "#01A796")

barplot(tab, main = titre, col = couleurs)


# Modifier la graduation de l'axe des ordonnées

y_limites <- c(0, max(tab)+300)
y_limites

barplot(tab, main = titre, col = couleurs, ylim = y_limites)


# Afficher les valeurs d'effectifs au-dessus des barres du graphique

b <- barplot(tab, main = titre, col = couleurs, ylim = y_limites)

text(b, tab + 50, paste0("n = ", tab))


# Exporter son graphique en PNG

png("../GRAPHS/barplot1.png")

  b <- barplot(tab, main = titre, col = couleurs, ylim = y_limites)
  
  text(b, tab + 50, paste0("n = ", tab))

dev.off()









