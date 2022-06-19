## DataFrame

# Création d'un DataFrame

prenoms <- c("Michel", "Julie", "Sam", "Pascal", "Laura")
age <- c(45, 18, 23, 31, 32)
sexe <- c("M", "F", "M", "M", "F")
note_moyenne <- c(12.5, 8, 11.9, 4.3, 18)
passage <- c(TRUE, FALSE, TRUE, FALSE, TRUE)

classe <- data.frame(prenoms, age, sexe, note_moyenne, passage)
classe

str(classe)


classe <- data.frame(prenoms, age, sexe, note_moyenne, passage, stringsAsFactors = FALSE)

str(classe)


# Afficher la liste des prénoms

classe$prenoms


# Afficher les notes des 3 premiers élèves dans les données

classe[1:3, "note_moyenne"]

classe[1:3, 4]

classe$note_moyenne[1:3]


# Calculer la moyenne d'âge de la classe

mean(classe$age)

