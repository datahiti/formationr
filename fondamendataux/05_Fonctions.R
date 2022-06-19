### Fonctions

## Exemple 1 :

# Fonction prenant en entrée un vecteur de dépenses
# et retournant un message différent selon qu'on a dépensé plus ou moins de 50 euros

test_depenses <- function(x) {
  
  texte <- ""
  
  if( sum(x) > 50 ) {
    
    texte <- "Oups, tu as été dépensier !"
    
  } else {
    
    texte <- "Tu peux encore acheter un petit quelque-chose"
    
  }
  
  return(texte)
  
}


# Application

depenses <- c(0, 10, 5, 0, 8)
sum(depenses)

test_depenses(depenses)


depenses <- c(50, 30)
sum(depenses)

test_depenses(depenses)









## Exemple 2 :

# Fonction prenant en entrée 2 vecteurs : "p" pour pourboires, "a" pour achats
# et qui calcule la somme des pourboires ("gains") et la somme des achats ("depenses")
# affiche un texte différent en fonction duquel est supérieur à l'autre
# et retourne une liste contenant ces deux sommes "gains" et "depenses"

bilan_financier <- function(p, a) { 
  
  # Calcul de la somme des gains (pourboires) : "gains"
  gains <- sum(p)
  # Calcul de la somme des dépenses (achats) : "depenses"
  depenses <- sum(a)
  
  
  if(gains > depenses) {
    
    print("Bravo, tu as été économe !")
    
  } else {
    
    print("Attention la prochaine fois...")
    
  }
  
  # Retourne une liste contenant les valeurs de "gains" et "depenses"
  
  return(list(gains = gains, depenses = depenses))
  
}


# Application

pourboires <- c(30, 5, -15, 0, 12)
achats <- c(0, 10, 5, 0, 8)

mon_bilan <- bilan_financier(pourboires, achats)
mon_bilan







## Exemple 3 :

# Passage de tous les éléments d'un vecteur de texte en minuscules
# à l'aide de la fonction "lapply" et la fonction "tolower"

mon_texte <- c("Hello World !", "James Bond", "sAlUt 12 AaA")

lapply(mon_texte, tolower)



# Application d'une fonction sélectionnant le premier élément d'un vecteur
# sur tous les éléments d'une liste

ma_liste <- list(mot1 = c("chat", 4),
                 mot2 = c("chien", 5),
                 mot3 = c("éléphant", 8))
ma_liste


select_prems <- function(x) {
  
  return(x[1])
  
}

sapply(ma_liste, select_prems)



# Calcul de l'écart-type (fonction "sd") pour chaque colonne d'une matrice

ma_matrice <- matrix(sample(1:12), byrow = TRUE, nrow = 4)

apply(ma_matrice, 2, sd)











