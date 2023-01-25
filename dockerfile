FROM ubuntu
ENV TZ=Europe/Moscow

COPY ./srv/app /srv/app
RUN apt -y update && \
    apt -y install python3 libpq-dev python3-dev --no-install-recommends && \
    apt -y install python3-pip && \
    pip3 install flask && \
    pip3 install psycopg2 && \
    pip3 install configparser && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/* && \
    apt clean

CMD [ "python3", "/srv/app/web.py" ]
