FROM python:2.7-slim
MAINTAINER Devin Herath <devdhera@gmail.com>

ENV INSTALL_PATH /dadukate
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .
RUN pip install --editable .

CMD gunicorn -b 0.0.0.0:8000 --access-logfile - "dadukate.app:create_app()"
