FROM python:3.9-slim

WORKDIR /djangoapp

COPY requirements.txt .

RUN apt-get update && apt-get install -y python3-dev default-libmysqlclient-dev build-essential pkg-config

RUN pip install --no-cache-dir -r requirements.txt

RUN pip install mysqlclient

COPY . . 

CMD ["python","manage.py","migrate"]

CMD ["python","manage.py","runserver","0.0.0.0:8000"]
