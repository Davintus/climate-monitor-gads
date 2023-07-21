## Multi-stage Dockerfile for Climate Monitor Project - GADS and SQLite Database

# Stage 1: Build the Flask App
FROM python:3.8 AS flask_app

LABEL owner="Kenechukwu Nzute"
EXPOSE 5000

# Set the working directory inside the container
WORKDIR /climate-monitor-gads

# Copy the files required for the Flask app
COPY ./ ./

# Install the dependencies for the Flask app
RUN pip install -r requirements.txt

# Stage 2: Build the SQLite Database
FROM ubuntu:latest AS sqlite_db

# Basic update and installation of SQLite
RUN apt-get update -y && apt-get install -y sqlite3 libsqlite3-dev

# Create a directory to store the database
RUN mkdir /db

# Use the /db directory as the current working directory
WORKDIR /db

# Entry point for the SQLite database (sqlite3 command)
ENTRYPOINT [ "sqlite3" ]

# Stage 3: Final Stage
# Use the python:3.8 base image for the final stage
FROM python:3.8

# Copy the built Flask app from the flask_app stage
COPY --from=flask_app /climate-monitor-gads /climate-monitor-gads

# Copy the built SQLite database from the sqlite_db stage
COPY --from=sqlite_db /db /db

# Set the working directory for the final stage
WORKDIR /climate-monitor-gads

# Expose the required port for the Flask app
EXPOSE 5000

# Start the Flask app with the command
CMD ["python", "app.py", "--host=0.0.0.0"]

