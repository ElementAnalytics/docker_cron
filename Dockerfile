FROM ubuntu:latest
MAINTAINER brian@elementanalytics.com

# Create the log file to be able to run tail
RUN touch /var/log/cron.log
 
RUN apt-get update && apt-get install -y \
  cron \
  && rm -rf /var/lib/apt/lists/*  

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

# Run the command on container startup
CMD ["/bin/bash", "-c", "cron && tail -f /var/log/cron.log"]
