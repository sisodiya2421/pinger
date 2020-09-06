FROM debian:9.5-slim

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
RUN apt-get install curl

ENTRYPOINT ["/entrypoint.sh"]
