## Conditions

# Création de 2 vecteurs comprenant les valeurs 
# pour chaque jour de la semaine (du lundi au vendredi)
# de pourboires gagnés ou achats faits

pourboires <- c(30, 5, -15, 0, 12)
  
achats <- c(0, 10, 5, 0, 8)
  
jours <- c("lundi", "mardi", "mercredi", "jeudi", "vendredi")

names(pourboires) <- jours
names(achats) <- jours

pourboires
achats


# Exemple 1

# Récupération des données de "lundi" dans une liste

lundi <- list(pourboires = pourboires[1],
              achats = achats[1])
lundi


# Condition "if" 

if( lundi$pourboires > 20 ) { # Si le pourboire obtenu lundi est supérieur à 20
  
  print("Quelle bonne journée !")
  
}


# Condition "if...else"

if( lundi$pourboires > 20 ) { 
  
  print("Quelle bonne journée !")
  
} else {
  
  print("On fera mieux demain...")
  
}


# Condition "if...else if...else"

if( lundi$pourboires > 20 ) { 
  
  print("Quelle bonne journée !")
  
} else if( lundi$achats < 10 ) {
  
  print("Au moins j'ai résisté à la tentation")
  
} else {
  
  print("On fera mieux demain...")
  
}


# Condition "if...else if...else" : sur le "mardi"

mardi <- list(pourboires = pourboires[2],
              achats = achats[2])
mardi


if( mardi$pourboires > 20 ) { 
  
  print("Quelle bonne journée !")
  
} else if( mardi$achats < 10 ) {
  
  print("Au moins j'ai résisté à la tentation")
  
} else {
  
  print("On fera mieux demain...")
  
}

