FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y libgomp1


# Copy app code
COPY flask_app/ /app/
COPY tfidf_vectorizer.pkl /app/

# Install Python dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Download NLTK resources
RUN python -m nltk.downloader stopwords wordnet

EXPOSE 5000

CMD ["python", "app.py"]
