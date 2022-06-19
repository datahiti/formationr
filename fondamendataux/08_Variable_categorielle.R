## Variable catégorielle

# Charger ses données

donnees <- read.csv("./DATA/responses.csv", header = TRUE, sep = ",", na.strings = "")




# Premières infos sur la variable "Genre"

Genre <- donnees$Gender


tab1 <- table(Genre)
tab1


prop.table(tab1)


library(questionr)
freq(Genre, total = TRUE)



# Tableau croisé

Genre <- donnees$Gender

# Création d'une variable "Romantic" : Oui si note > 3, Non sinon
Romantic <- ifelse(is.na(donnees$Romantic), NA,
                   ifelse(donnees$Romantic > 3, "Oui", "Non")
                  )
      
                                
tab <- table(Genre, Romantic)
tab

prop.table(tab)


library(questionr)

prop(tab)
rprop(tab)
cprop(tab)




# Graphiques

# Version 1 :

Araignee <- donnees$Spiders

Araignee <- factor(Araignee, 
                   labels = c("1 - Not afraid at all", 
                              "2", "3", "4",
                              "5 - Very afraid of"))

tab2 <- table(Araignee)
barplot(tab2, main = "Phobie des araignées", 
        cex.axis = 0.7, cex.names = 0.7,
        ylim = c(0, max(tab2)+50),
        col = c("#35EF14", "#9DEF13", 
                "#EFD811", "#F06D0F", "#F00E1C"))

# Version 2 :

tab2 <- table(Araignee)
ptab2 <- round(100*prop.table(tab2), 0)

b <- barplot(ptab2, main = "Phobie des araignées", 
             col = c("#35EF14", "#9DEF13", 
                     "#EFD811", "#F06D0F", "#F00E1C"), 
             ylim = c(0, 60), 
             ylab = "Pourcentage de répondants")
text(b, ptab2 + 4, 
     paste0("n = ", tab2, "\n", "p = ", ptab2, " %"))





# Test du Khi-deux

tab

resultat <- chisq.test(tab)
resultat

resultat$p.value

# p-value < 0.05 (5%) 
# Au seuil de 5%, on rejette l’hypothèse H0 selon laquelle 
# il n'exsite pas de lien entre les deux variables, 
# ie. il existe un lien statistique entre le fait d'aimer les films romantiques et le genre.

