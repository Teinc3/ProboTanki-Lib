import nltk
from nltk.stem.porter import PorterStemmer
import os

# Uncomment the line below if you're running NLTK for the first time.
nltk.download('punkt')

def remove_similar_words(input_file, output_file):
    stemmer = PorterStemmer()
    stems_seen = set()
    result = []

    with open(input_file, 'r') as infile:
        words = [line.strip() for line in infile if line.strip()]

    for word in words:
        stem = stemmer.stem(word.lower())
        if stem not in stems_seen:
            stems_seen.add(stem)
            result.append(word)
        else:
            # Optionally, you can print or log the removed word
            pass  # Removed word due to stemming match

    with open(output_file, 'w') as outfile:
        for word in result:
            outfile.write(word + '\n')

# Usage
data_path = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", "..", "..", "data"))
remove_similar_words(os.path.join(data_path, 'eng_news_2023_10K-words.txt'), os.path.join(data_path, 'eng_news_2023_10K-words-stemmed.txt'))