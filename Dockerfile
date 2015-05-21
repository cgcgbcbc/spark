FROM williamyeh/scala:2.10.4

ADD http://www.apache.org/dyn/closer.cgi/spark/spark-1.3.1/spark-1.3.1-bin-hadoop2.6.tgz /

RUN tar -xvzf spark-1.3.1-bin-hadoop2.6.tgz

RUN mv spark-1.3.1-bin-hadoop2.6 spark

WORKDIR /spark

ADD ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ADD ./worker.sh /worker.sh

RUN chmod +x /worker.sh

EXPOSE 7077 4040 8080 8081

CMD ["/entrypoint.sh"]
