## Boucles

# Boucle "while" : 

# Tant qu'on a de l'argent dans notre portefeuille,
# on rejoue une partie (à 7,5 euros la partie).

portefeuille <- 50
prix_partie <- 7.5
nombre_parties <- 0

while( portefeuille > prix_partie ) {
  
  print("Allez, encore une petite partie !")
  
  # Le prix d'une partie est déduit de notre budget
  portefeuille <- portefeuille - prix_partie
  
  # Le nombre de parties jouées augmente de 1
  nombre_parties <- nombre_parties + 1
}


portefeuille

nombre_parties




# Boucle "for" :

mat <- matrix(letters[1:9], ncol = 3, byrow = TRUE)

# Boucle permettant d'afficher une à une les valeurs de la matrice "mat"

dim_mat <- dim(mat)

for(i in 1:dim_mat[1]) {
  
  for(j in 1:dim_mat[2]) {
      
      texte <- paste("Ligne", i, "/ Colonne", j, "Valeur :", mat[i, j], sep = " ")
      print(texte)
    
  }
  
}


