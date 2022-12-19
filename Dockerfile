# Base Image
FROM python:3.10-slim-buster

RUN apt-get update && apt-get install -y \
    && apt-get install gdal-bin libgdal-dev -y \
    && apt-get install python3-gdal -y \
    && apt-get install binutils libproj-dev -y

WORKDIR /app

COPY requirements.txt requirements.txt

ENV PYTHONPATH="$PYTHONPATH:/app"

RUN pip3 install -r requirements.txt

COPY . .

#ENTRYPOINT ["sh", "docker-entry-point.sh"]

# Execute on docker container while run
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]