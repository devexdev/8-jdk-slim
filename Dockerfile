FROM openjdk:8-jdk-slim

RUN apt-get update && apt-get install -y \
    wget && \
    cd /bin && \
    rm sh && \
    ln -s bash /bin/sh && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i 's/jdk.tls.disabledAlgorithms=/jdk.tls.disabledAlgorithms=SSLv2Hello, DES40_CBC, RC4_40, SSLv2, TLSv1, TLSv1.1, /g' /usr/local/openjdk-8/jre/lib/security/java.security
COPY disabled-tls.properties .
    
