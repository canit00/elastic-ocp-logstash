# MVP 1, CentOS Logstash Image for OCP
FROM docker.elastic.co/logstash/logstash:5.4.0
RUN rm -f /usr/share/logstash/pipeline/*
RUN rm -f /usr/share/logstash/config/*
RUN /usr/share/logstash/bin/logstash-plugin remove x-pack

# Add access to OpenShift "root group" to logstash
USER root
RUN mkdir -p /usr/share/logstash/data && chgrp -R 0 /usr/share/logstash/data && chmod -R g+rwX /usr/share/logstash/data
USER 1000

ADD config/ /usr/share/logstash/config/
ADD pipeline/ /usr/share/logstash/pipeline/
ADD ssl/ /usr/share/logstash/SSL/
