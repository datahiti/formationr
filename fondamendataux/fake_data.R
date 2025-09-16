library(dplyr)
donnees <- read.csv("autres-types/DATA/responses.csv", 
                    header = TRUE, sep = ",", na.strings = "", stringsAsFactors = TRUE)
donnees2 <- donnees %>% select(Age, Height, Weight, Gender, Spiders)
donnees2 %>% summarise_if(is.numeric, funs( Moyene = mean(.,na.rm = TRUE) ))
donnees2 %>% 
  summarise(
    across(
      where(is.numeric), 
      list(
        moyenne = ~mean(.x, na.rm = TRUE),
        var = ~var(.x, na.rm = TRUE))))
donnees2 %>%
  filter(if_any(where(is.numeric), ~ . == 45))
names(donnees)[sapply(donnees,is.factor)]
summary(donnees )


library("charlatan")
set.seed(123)

nb_clients <- 10
id_client <- sample(10 * nb_clients, nb_clients )
clients <- data.frame(
  id_client, 
  ch_generate( n = nb_clients, locale = "fr_FR"),
  sexe = sample(c("Femme", "Homme"), nb_clients, replace = TRUE, prob = c(0.55, 0.45)))

nb_couleurs <- 10
id_couleur <- sample(10 * nb_couleurs, nb_couleurs )
couleurs <- data.frame(
  id_couleur,
  couleur = sample(
    unique(ch_color_name( n = nb_couleurs*nb_couleurs, locale = "en_US")), 
    nb_couleurs))

nb_choix <- 100
choix <- data.frame(
  id_client = sample(id_client, nb_choix, replace = TRUE, prob = rbinom(nb_clients,1, 0.8)), 
  id_couleur = sample(id_couleur, nb_choix, replace = TRUE, prob = rbinom(nb_couleurs,1, 0.8)), 
  date = sample(
    seq(as.Date("2010/1/1"), by = "day", length.out = 365.25 * 10),
    nb_choix, replace = TRUE))

clients %>% 
  left_join(choix) %>%
  filter(is.na(id_couleur))

clients %>% 
  anti_join(choix)

clients %>% 
  left_join(choix) %>%
  group_by(id_client, name, job, phone_number, sexe) %>%
  summarise(nb_couleurs = sum(!is.na(id_couleur))) %>%
  filter(nb_couleurs>0)

clients %>% 
  semi_join(choix)

couleurs %>% left_join(choix)
unique(choix$id_couleur)

