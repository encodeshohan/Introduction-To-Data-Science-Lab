library(rvest)
library(dplyr)
library(stringr)
library(tokenizers)
library(textstem)
library(openxlsx)



url <- "https://flixhq.to/genre/thriller"
webpage <- read_html(url)



title <- webpage %>% html_nodes(".film-name a") %>% html_text()
quality <- webpage %>% html_nodes(".film-poster-quality") %>% html_text()
rYear <- webpage %>% html_nodes(".fdi-item:nth-child(1)") %>% html_text()
duration <- webpage %>% html_nodes(".fdi-duration") %>% html_text()
type <- webpage %>% html_nodes(".fdi-type") %>% html_text()



clean_text <- function(text) {
  text <- str_replace_all(text, "[^[:alnum:][:space:]]", "")
  return(text)
}

title <- sapply(title, clean_text)
quality <- sapply(quality, clean_text)
rYear <- sapply(rYear, clean_text)
duration <- sapply(duration, clean_text)
type <- sapply(type, clean_text)



tokenize_text <- function(text) {
  return(tokenize_words(text))
}

title_tokens <- lapply(title, tokenize_text)
quality_tokens <- lapply(quality, tokenize_text)
rYear_tokens <- lapply(rYear, tokenize_text)
duration_tokens <- lapply(duration, tokenize_text)
type_tokens <- lapply(type, tokenize_text)



title <- sapply(title, lemmatize_strings)
quality <- sapply(quality, lemmatize_strings)
rYear <- sapply(rYear, lemmatize_strings)
duration <- sapply(duration, lemmatize_strings)
type <- sapply(type, lemmatize_strings)



handle_contractions <- function(text) {
  text <- str_replace_all(text, "HD", "High Quality")
  text <- str_replace_all(text, "CAM", "Camera")
  return(text)
}

title <- sapply(title, handle_contractions)
quality <- sapply(quality, handle_contractions)
quality <- sapply(quality, handle_contractions)
rYear <- sapply(rYear, handle_contractions)
duration <- sapply(duration, handle_contractions)
type <- sapply(type, handle_contractions)



data <- data.frame(Movie_Title = title, Quality = quality, Release_Year = rYear, Duration = duration, Type = type)
data
write.xlsx(data, "D:/MID-Data-Science-Project/Project-2/Project_2.xlsx")
