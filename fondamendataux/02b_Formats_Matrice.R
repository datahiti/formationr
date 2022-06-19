## Matrices

# Création d'une matrice

depenses_alimentation <- c(90, 65, 76, 120)
depenses_voiture <- c(0, 50, 200, 15)
depenses_factures <- c(47, 25, 49, 12)

depenses <- matrix(c(depenses_alimentation,
                     depenses_voiture,
                     depenses_factures), byrow = FALSE, ncol = 3)

colnames(depenses) <- c("Alimentation", "Voiture", "Factures")

rownames(depenses) <- c("Janvier", "Février", "Mars", "Avril")

depenses


# Moyenne mensuelle des dépenses par catégorie

colMeans(depenses)


# Dépenses mensuelles totales

rowSums(depenses)


# Somme des dépenses en mars

mars <- depenses[3, ]
mars

sum(mars)
