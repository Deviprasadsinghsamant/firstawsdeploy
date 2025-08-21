# Use the official Python image as a base
FROM python:3.10-slim

# Set environment variables to improve Python behavior
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements if you have any, otherwise skip
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY . /app/

# Expose port 8000 (FastAPI default)
EXPOSE 8000

# Command to run the app using uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
