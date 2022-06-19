## Vecteurs et comparaisons

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


# Pour chaque jour : a-t-on plus gagné que dépensé ?

pourboires > achats


# Totaux de la semaine

total_pourboires_semaine <- sum(pourboires)
total_pourboires_semaine

total_achats_semaine <- sum(achats)
total_achats_semaine

total_gain_semaine <- total_pourboires_semaine - total_achats_semaine
total_gain_semaine


# Quels jours a-t-on eu un pourboire ?

pourboires_positifs <- pourboires > 0

pourboires[pourboires_positifs]

names(pourboires)[pourboires_positifs]


# Nombre de jours sans achat ?

pas_d_achat <- which(achats == 0)
pas_d_achat

nb_jours_sans_achat <- length(pas_d_achat)
nb_jours_sans_achat


