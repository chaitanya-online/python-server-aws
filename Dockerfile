# Use the official Python image as a base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the HTML file into the container at /app
COPY index.html /app

# Expose port 8000 to allow external access
EXPOSE 8000

# Command to run the HTTP server
CMD ["python3", "-m", "http.server"]
