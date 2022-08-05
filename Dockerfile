FROM openjdk:8-jdk-alpine

LABEL Author=andanyang

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV TZ=Asia/Shanghai

WORKDIR /root

ENTRYPOINT /usr/bin/java -Djava.security.egd=file:/dev/./urandom ${APM_OPT} -jar app.jar

COPY target/app.jar app.jar