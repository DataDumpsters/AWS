# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY ./requirements.txt /app/

RUN pip install -r requirements.txt

COPY . /app/
# Expose port 80
EXPOSE 80

ENV FLASK_APP=crudapp.py
CMD ["gunicorn", "-b", "0.0.0.0:80", "crudapp:app"]
