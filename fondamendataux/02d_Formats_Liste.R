## Liste

date_etude <- "18/03/2017"
identifiants_repondants <- c("ID1", "ID2", "ID3")
reponses <- data.frame(Q1 = c("Homme", "Femme", "Femme"),
                       Q2 = c(54, 36, 27),
                       Q3 = c("Tout à fait d'accord", "Pas du tout d'accord", "Ne se prononce pas"))

mon_etude <- list(Date = date_etude,
                  ID = identifiants_repondants,
                  Reponses = reponses)

mon_etude

str(mon_etude)


# Afficher les identifiants des répondants

mon_etude$ID

mon_etude[[2]]


# Afficher l'identifiant du second répondant

mon_etude$ID[2]

mon_etude[[2]][2]



## Afficher les réponses à la question "Q2" et calculer la moyenne

Q2 <- mon_etude$Reponses$Q2
Q2

mean(Q2)


