# MVP 1, CentOS Logstash Image for OCP
FROM docker.elastic.co/logstash/logstash:5.4.0
RUN rm -f /usr/share/logstash/pipeline/*
RUN rm -f /usr/share/logstash/config/*
RUN /usr/share/logstash/bin/logstash-plugin remove x-pack
ADD config/ /usr/share/logstash/config/
ADD pipeline/ /usr/share/logstash/pipeline/
ADD ssl/ /usr/share/logstash/SSL/

# Add access to OpenShift "root group" to logstash
RUN chgrp -R 0 /usr/share/logstash && chmod -R g+rwX /usr/share/logstash
