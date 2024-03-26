# Use the official Python image as base
FROM python:3.11
# Set the working directory in the container
WORKDIR /app

# Copy the app.py and requirements.txt from the Llama2RAG directory into the container at /app
COPY Llama2RAG/* /app/

RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# Install system dependencies for PyMuPDFReader
RUN apt-get update && apt-get install -y libmupdf-dev

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install Streamlit
RUN pip install streamlit

# Expose the port streamlit runs on
EXPOSE 8501

# Run the streamlit app when the container launches
CMD ["streamlit", "run", "--server.port", "8501", "app.py"]
