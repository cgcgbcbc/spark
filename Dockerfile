FROM williamyeh/scala:2.10.4

ADD http://d3kbcqa49mib13.cloudfront.net/spark-1.3.1-bin-hadoop2.6.tgz /

RUN tar -xzf spark-1.3.1-bin-hadoop2.6.tgz

RUN mv spark-1.3.1-bin-hadoop2.6 spark

WORKDIR /spark

ADD ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ADD ./worker.sh /worker.sh

RUN chmod +x /worker.sh

EXPOSE 7077 4040 8080 8081

RUN apt-get update

RUN apt-get install build-essential python-dev python-setuptools python-numpy python-scipy libatlas-dev libatlas3gf-base -y

RUN update-alternatives --set libblas.so.3 \
    /usr/lib/atlas-base/atlas/libblas.so.3
RUN update-alternatives --set liblapack.so.3 \
    /usr/lib/atlas-base/atlas/liblapack.so.3

RUN apt-get install python-pip -y

RUN pip install -U scikit-learn

CMD ["/entrypoint.sh"]
