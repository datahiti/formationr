#####################
### Données Excel ###
#####################

### Chargement des données

library(xlsx)

donnees <- read.xlsx("../DATA/responses.xlsx", sheetIndex = 1, header = TRUE)

is.data.frame(donnees)



### Premières explorations

dim(donnees)

colnames(donnees)

str(donnees)



### Zoom sur Poids et Taille

Poids <- donnees$Weight
Taille <- donnees$Height

summary(Poids)

summary(Taille)


# Etudiant avec Taille = 62

id_62 <- which(donnees$Height == 62)
id_62 

donnees$Weight[id_62]


## Suppression de l'étudiant avec Taille = 62

# Dans toutes les données

donnees_clean <- donnees[ -id_62,  ]

dim(donnees_clean)


# Juste dans nos vecteurs Poids et Taille

Poids <- donnees$Weight
Taille <- donnees$Height

Poids_c <- Poids[ -id_62 ]
Taille_c <- Taille[ -id_62 ]

summary(Taille_c)



### Data visualisation : 
### Nuage de points du Poids en fonction de la Taille par Genre

## Préparation des données

data_viz <- data.frame(Taille = donnees$Height,
                       Poids = donnees$Weight,
                       Genre = factor(donnees$Gender, 
                                      labels = c("Femme", "Homme")))

dim(data_viz)

head(data_viz)


id_62 <- which(donnees$Height == 62)

data_viz <- data_viz[ -id_62, ]

dim(data_viz)


## Premiers pas avec le package "ggplot2"
## Nuage de points du Poids en fonction de la Taille

library(ggplot2)

ggplot(data_viz, aes(x=Taille, y=Poids)) + geom_point()


# Suppression des valeurs manquantes

summary(data_viz)

data_viz_c <- na.omit(data_viz)

summary(data_viz_c)

dim(data_viz_c)


ggplot(data_viz_c, aes(x=Taille, y=Poids)) + geom_point()


## Personnaliser la taille et la forme des points

ggplot(data_viz_c, aes(x=Taille, y=Poids)) + 
  geom_point(size=3)

ggplot(data_viz_c, aes(x=Taille, y=Poids)) + 
  geom_point(shape=4)


## Colorer les points selon le Genre

ggplot(data_viz_c, aes(x=Taille, y=Poids, color=Genre)) + 
  geom_point()


ggplot(data_viz_c, aes(x=Taille, y=Poids, color=Genre)) + 
  geom_point() +
  scale_color_manual(values=c("#F4C791", "#01A796"))


## Personnaliser les labels

ggplot(data_viz_c, aes(x=Taille, y=Poids, color=Genre)) + 
  geom_point() +
  scale_color_manual(values=c("#F4C791", "#01A796")) +
  ggtitle("Nuage de points") +
  xlab("Taille (en cm)") +
  ylab("Poids (en kg)")


# Légende

ggplot(data_viz_c, aes(x=Taille, y=Poids, color=Genre)) + 
  geom_point() +
  scale_color_manual(values=c("#F4C791", "#01A796")) +
  ggtitle("Nuage de points") +
  xlab("Taille (en cm)") +
  ylab("Poids (en kg)") +
  labs(color="Genre :")


## Modifier la trame de fond : les thèmes

# Fonctions "toutes prêtes" :
# theme_gray / theme_bw / theme_linedraw / theme_light
# theme_minimal / theme_classic / theme_void / theme_dark
# ou à créer soi-même !

ggplot(data_viz_c, aes(x=Taille, y=Poids, color=Genre)) + 
  geom_point() +
  scale_color_manual(values=c("#F4C791", "#01A796")) +
  ggtitle("Nuage de points") +
  xlab("Taille (en cm)") +
  ylab("Poids (en kg)") +
  labs(color="Genre :") +
  theme_light()
