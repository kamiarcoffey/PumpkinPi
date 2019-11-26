FROM python:3.7-stretch
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
COPY . /pumpkinPi
WORKDIR /pumpkinPi
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["pumpkinPi.py"]

