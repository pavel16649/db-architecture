# Use the official Python image as the base image
FROM python:3.9-slim-buster

# Set the working directory to /service
WORKDIR /service

# Install the required packages
RUN pip install --upgrade pip \
    && pip install --upgrade setuptools \
    && pip install psycopg2-binary


# Copy the script into the container
COPY ExplainAnalyzeService.py .

# Set the entrypoint to the script
CMD ["python", "ExplainAnalyzeService.py"]
