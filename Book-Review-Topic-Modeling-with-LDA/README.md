# 📖 Book Review Topic Modeling with LDA

## ✨ Overview
This project focuses on performing **Topic Modeling** on book reviews from *Goodreads* for the book "Some We Love, Some We Hate, Some We Eat". Using **Latent Dirichlet Allocation (LDA)**, we analyze the themes and dominant topics within the reviews. The project includes web scraping, data preprocessing, topic extraction, and various visualizations.

## 📂 Content
- **Web Scraping**: Extracting reviews from Goodreads.
- **Data Cleaning & Preprocessing**: Text transformation, removal of punctuation, stopwords, and whitespace.
- **Document-Term Matrix (DTM)**: Creating and transforming DTM using **TF-IDF**.
- **Topic Modeling with LDA**: Extracting 12 topics from the dataset.
- **Visualization**: Plotting topics, word clouds, and interactive visualizations using **LDAvis** and **ggraph**.
- **Hierarchical Clustering**: Clustering topics to identify relationships.

## 🛠️ Technologies Used
- **R Language**
- **Libraries**:
  - `rvest` for web scraping
  - `dplyr`, `tidyr`, `tibble` for data manipulation
  - `tm`, `tidytext` for text mining
  - `topicmodels` for LDA modeling
  - `ggplot2`, `ggraph`, `viridis`, `wordcloud` for visualization
  - `LDAvis` for interactive topic visualization

## 📊 Visualizations
- **Top Terms by Topic**: Bar plots of most probable terms per topic.
- **Word Clouds**: Visual representation of frequent words in each topic.
- **Interactive LDA Visualization**: Explore topics with **LDAvis**.
- **Topic Clustering Dendrogram**: Hierarchical clustering of topics.

## 🔮 Future Scope
- **Sentiment Analysis**: Integrate sentiment analysis to gauge reviewers' emotional tone.
- **Model Comparison**: Experiment with alternative topic modeling techniques like **NMF** or **BERTopic**.
- **Larger Dataset**: Apply the methodology to a larger set of book reviews for broader insights.
- **Real-Time Scraping**: Automate data scraping to update reviews in real-time.
- **Dashboard Integration**: Build interactive dashboards for dynamic exploration of topics and trends.
