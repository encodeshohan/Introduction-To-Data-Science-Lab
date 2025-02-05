library(rvest)
library(dplyr)
library(tm)
library(topicmodels)
library(ggplot2)
library(tidytext)
library(LDAvis)
library(ggraph)
library(tidygraph)
library(viridis)
library(wordcloud)
library(tibble)
library(tidyr)

book_review_url <- "https://www.goodreads.com/book/show/6953508-some-we-love-some-we-hate-some-we-eat"
book_webpage <- read_html(book_review_url)

book_reviews <- book_webpage %>%
  html_elements("#ReviewsSection .Formatted") %>%
  html_text()

book_reviews_df <- data.frame(reviews = book_reviews, stringsAsFactors = FALSE)

book_corpus <- Corpus(VectorSource(book_reviews_df$reviews))

book_corpus <- tm_map(book_corpus, content_transformer(tolower))
book_corpus <- tm_map(book_corpus, removePunctuation)
book_corpus <- tm_map(book_corpus, removeNumbers)
book_corpus <- tm_map(book_corpus, removeWords, stopwords("en"))
book_corpus <- tm_map(book_corpus, stripWhitespace)

book_reviews_cleaned_df <- data.frame(updated_book_reviews = sapply(book_corpus, as.character), stringsAsFactors = FALSE)

write.csv(book_reviews_cleaned_df, "D:/Final-Data-Science-Project/Group_10_Final_Term_Project_Dataset.csv", row.names = FALSE)

book_dtm <- DocumentTermMatrix(book_corpus)
book_dtm_matrix <- as.matrix(book_dtm)
print(book_dtm_matrix[1:5, 1:5])

book_tfidf <- weightTfIdf(book_dtm)
book_tfidf_matrix <- as.matrix(book_tfidf)
head(book_tfidf_matrix[1:5, 1:5])

num_topics <- 12

book_lda_model <- LDA(book_dtm, k = num_topics, control = list(seed = 1234))

book_term_probs <- tidy(book_lda_model)

book_top_terms <- book_term_probs %>%
  group_by(topic) %>%
  arrange(desc(beta)) %>%
  slice_head(n = 10) %>%
  ungroup() %>%
  mutate(term = reorder_within(term, beta, topic))

topic_labels <- c(
  "Topic 1: Animals & Ethics",
  "Topic 2: Animal Research",
  "Topic 3: Meat & Morality",
  "Topic 4: Pet Care & Love",
  "Topic 5: Chapters & Content",
  "Topic 6: Ethical Choices",
  "Topic 7: Animal Rights",
  "Topic 8: Tortoise & Time",
  "Topic 9: Wolves & Humans",
  "Topic 10: Relationships",
  "Topic 11: Research Insights",
  "Topic 12: Life of Animals"
)

book_top_terms <- book_top_terms %>%
  mutate(topic_label = topic_labels[topic])

ggplot(book_top_terms, aes(term, beta, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic_label, scales = "free", ncol = 3) +
  coord_flip() +
  scale_x_reordered() +
  labs(title = "Word Probabilities by Topic (Book Reviews)",
       x = "Keywords/Terms",
       y = "Probability (Beta)") +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 8))

book_lda_json <- createJSON(
  phi = posterior(book_lda_model)$terms,
  theta = posterior(book_lda_model)$topics,
  vocab = colnames(book_dtm),
  doc.length = rowSums(as.matrix(book_dtm)),
  term.frequency = colSums(as.matrix(book_dtm))
)

serVis(book_lda_json)

top_terms <- book_term_probs %>%
  group_by(topic) %>%
  slice_max(beta, n = 5) %>%
  ungroup()

edges <- top_terms %>%
  mutate(from = paste0("Topic ", topic), to = term)

nodes <- data.frame(
  name = unique(c(edges$from, edges$to)),
  type = ifelse(grepl("Topic", unique(c(edges$from, edges$to))), "topic", "term")
)

tbl_graph(nodes = nodes, edges = edges) %>%
  ggraph(layout = "fr") +
  geom_edge_link(aes(color = from), show.legend = FALSE) +
  geom_node_point(aes(color = type), size = 5) +
  geom_node_text(aes(label = name), repel = TRUE) +
  theme_void()

book_term_probs %>%
  group_by(topic) %>%
  slice_max(beta, n = 5) %>%
  ungroup() %>%
  mutate(topic = paste0("Topic ", topic),
         term = reorder_within(term, beta, topic)) %>%
  ggplot(aes(x = topic, y = term, fill = beta)) +
  geom_tile() +
  scale_fill_viridis(option = "C") +
  scale_y_reordered() +
  labs(x = "Topic", y = "Term", fill = "Probability (Beta)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

par(mfrow = c(3, 4), mar = c(1, 1, 1, 1))
for (i in 1:num_topics) {
  topic_terms <- subset(book_term_probs, topic == i)
  wordcloud(
    words = topic_terms$term,
    freq = topic_terms$beta * 10,
    max.words = 20,
    colors = brewer.pal(8, "Dark2"),
    main = paste("Topic", i)
  )
}

book_doc_probs <- tidy(book_lda_model, matrix = "gamma")

book_doc_probs %>%
  group_by(topic) %>%
  summarize(avg_gamma = mean(gamma)) %>%
  ggplot(aes(x = factor(topic), y = avg_gamma)) +
  geom_col(fill = "steelblue") +
  labs(x = "Topic", y = "Average Proportion in Corpus", 
       title = "Dominance of Topics in Reviews") +
  theme_minimal()

topic_term_matrix <- book_term_probs %>%
  pivot_wider(names_from = topic, values_from = beta, values_fill = 0) %>%
  column_to_rownames("term") %>%
  as.matrix()

dist_matrix <- dist(t(topic_term_matrix), method = "euclidean")
hc <- hclust(dist_matrix, method = "ward.D2")
plot(hc, main = "Topic Clustering Dendrogram", xlab = "", sub = "")
