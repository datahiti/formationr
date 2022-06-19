## Variable numérique

# Charger ses données

donnees <- read.csv("./DATA/responses.csv", header = TRUE, sep = ",", na.strings = "")




# Premières infos sur la variable "Age"

Age <- donnees$Age

summary(Age)

is.numeric(Age)

is.factor(Age)

table(Age)







# Boxplot

Age <- donnees$Age

boxplot(Age, horizontal = TRUE,
        main = "Boxplot de l'âge des répondants")


Genre <- donnees$Gender

boxplot(Age ~ Genre, horizontal = TRUE,
        main = "Boxplot de l'âge des répondants \npar genre",
        col = c("pink1", "skyblue1"))


png("mon_graph.png", width = 480, height = 480, units = "px")

  boxplot(Age ~ Genre)

dev.off()










# Calcul de corrélation : coefficient de corrélation linéaire R (Bravais-Pearson)

Poids <- donnees$Weight
Taille <- donnees$Height

cor(Poids, Taille, method = "pearson") # défaut, sinon : "kendall" ou "spearman"

summary(Poids)
summary(Taille)

cor(Poids, Taille, method = "pearson", use = "complete.obs")


# Test de corrélation

correl <- cor.test(Poids, Taille, method = "pearson", use = "complete.obs")
correl

names(correl)

correl$p.value

# p-value < 0.05 (5%) 
# Au seuil de 5%, on rejette l’hypothèse H0 selon laquelle 
# la corrélation entre les deux variables est nulle, 
# ie. la corrélation entre le poids et la taille est significative.


