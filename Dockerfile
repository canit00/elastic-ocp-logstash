# MVP 1, CentOS Logstash Image for OCP
FROM docker.elastic.co/logstash/logstash:5.4.0
RUN rm -f /usr/share/logstash/pipeline/*
RUN /usr/share/logstash/bin/logstash-plugin remove x-pack
ADD pipeline/ /usr/share/logstash/pipeline/
ADD ssl/ /usr/share/logstash/SSL/
