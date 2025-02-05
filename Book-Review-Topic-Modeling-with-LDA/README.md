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

## ⚙ Getting Started

### Prerequisites
Ensure you have **R** installed with the following libraries:
```r
install.packages(c("rvest", "dplyr", "tm", "topicmodels", "ggplot2",
                   "tidytext", "LDAvis", "ggraph", "tidygraph", "viridis",
                   "wordcloud", "tibble", "tidyr"))
```

### Running the Code
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/Book-Review-Topic-Modeling.git
   cd Book-Review-Topic-Modeling
   ```
2. **Run the R Script:** Open the script in **RStudio** or run directly from **R**:
   ```r
   source("book_review_topic_modeling.R")
   ```
3. **Output Files:**
   - Cleaned dataset saved as `Group_10_Final_Term_Project_Dataset.csv`
   - Visualizations and topic models will display in RStudio.

## 📊 Visualizations
- **Top Terms by Topic**: Bar plots of most probable terms per topic.
- **Word Clouds**: Visual representation of frequent words in each topic.
- **Interactive LDA Visualization**: Explore topics with **LDAvis**.
- **Topic Clustering Dendrogram**: Hierarchical clustering of topics.

## 💪 Key Results
- Successfully scraped and cleaned book reviews from Goodreads.
- Identified **12 key topics** related to ethics, animal rights, and human-animal relationships.
- Generated insightful visualizations highlighting topic dominance and interrelations.

## 🤝 Contributing
Feel free to **fork**, **open issues**, or **submit pull requests** to enhance this project!

## ⭐ Support
If you found this project helpful, give it a ⭐ and follow for more exciting projects!
