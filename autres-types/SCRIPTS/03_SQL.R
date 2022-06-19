###################
### Données SQL ###
###################

### Chargement des données

library(odbc)
library(dplyr)
library(tidyr)

db_infos <- read.table("../acces/database_config.txt", sep = ":", 
                       header = FALSE, stringsAsFactors = FALSE)

Driver <- db_infos %>% filter(V1 == "Driver") %>% select(V2) %>% as.character()
Database <- db_infos %>% filter(V1 == "Database") %>% select(V2) %>% as.character()
Server <- db_infos %>% filter(V1 == "Server") %>% select(V2) %>% as.character()
UID <- db_infos %>% filter(V1 == "UID") %>% select(V2) %>% as.character()
PWD <- db_infos %>% filter(V1 == "PWD") %>% select(V2) %>% as.character()
Port <- db_infos %>% filter(V1 == "Port") %>% select(V2) %>% as.numeric()

Driver


cn <- odbc::dbConnect(odbc::odbc(),
                 Driver = Driver,
                 Server = Server,
                 Database = Database,
                 UID = UID,
                 PWD = PWD,
                 Port = Port)

data_texte <- dbGetQuery(cn, "SELECT * FROM Table1")

# Données : avis TripAdvisor sur la Tour Eiffel
# Source : https://www.kaggle.com/PromptCloudHQ/tripadvisor-reviews-for-the-eiffel-tower

dim(data_texte)

colnames(data_texte)



#### Data visualisation : nuage de mots / wordcloud

### Pré-travail sur les données de type texte

# Vecteur de données

review <- data_texte$Review.Text

length(review)

review[1]


# Passage de tout le texte en minuscules

library(tm)

review_corpus <- Corpus(VectorSource(review))

review_corpus <- tm_map(review_corpus, tolower)


# Suppression de la ponctuation

review_corpus <- tm_map(review_corpus, removePunctuation)


# Suppression des mots "basiques" de la langue 

review_corpus <- tm_map(review_corpus, removeWords, stopwords("en"))

stopwords("en")

stopwords("fr")


# Suppression des espaces

review_corpus <- tm_map(review_corpus, stripWhitespace)


### Calcul des effectifs et classement des mots les plus utilisés

dtm <- TermDocumentMatrix(review_corpus)
m <- as.matrix(dtm)
v <- sort(rowSums(m), decreasing = TRUE)
d <- data.frame(word = names(v),freq = v)

head(d, 20) 

barplot(d[1:20,]$freq, las = 2, names.arg = d[1:20,]$word,
        col ="lightblue", main ="Mots les plus fréquents",
        ylab = "Fréquences")


### Data visualisation : nuage de mots / wordcloud

library(wordcloud)

# Version 1

wordcloud(review_corpus, max.words = 20)


# Version 2 : paramètres

wordcloud(review_corpus, max.words = 20, min.freq = 15, random.order = FALSE,
          rot.per = 0)

set.seed(1)

wordcloud(review_corpus, max.words = 20, rot.per = 0)


# Version 3 : palette de couleurs

set.seed(1)

wordcloud(review_corpus, max.words = 20, rot.per = 0,
          color = brewer.pal(9, "Blues")[5:9])


# Palette "RColorBrewer" : http://www.r-graph-gallery.com/38-rcolorbrewers-palettes/

library(RColorBrewer)

par(mar=c(3,4,2,2))

display.brewer.all()

