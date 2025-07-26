# Use a lightweight Python base image
FROM python:3.14.0rc1-slim

# Set working directory
WORKDIR /usr/src/app

# Copy requirements early to leverage cache
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose port 5000 for Flask
EXPOSE 5000

# Default command to run the app
CMD ["python", "app.py"]
