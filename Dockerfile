FROM anapsix/alpine-java

ENV JAVA_ARGS="-Xmx3G -Xms2G"
ENV SERVER_OP=""

RUN apk add unzip
RUN apk add wget

RUN mkdir /minecraft
RUN wget -O /tmp/TCR.zip https://cloud.hal9k.dev/s/CEk8cgkjmSocqKT/download
RUN unzip /tmp/TCR.zip -d /minecraft/

#ADD ./launch.sh /minecraft/launch.sh
RUN chmod +x /minecraft/launch.sh
RUN chmod 777 /minecraft/tcr_classic_refined_server.jar

VOLUME /minecraft
EXPOSE 25565

WORKDIR /minecraft
ENTRYPOINT ["/minecraft/launch.sh"]