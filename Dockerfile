FROM xiezibuyongbi/openjdk-11-jre-alpine
MAINTAINER "rksgoal@gmail.com"

RUN mkdir -p /app/newrelic

WORKDIR /app

ADD ./newrelic/newrelic.jar /app/newrelic/newrelic.jar
ADD ./newrelic/newrelic.yml /app/newrelic/newrelic.yml
ADD ./target/micrometer-new-relic-0.0.1-SNAPSHOT.jar /app/app.jar

ENTRYPOINT exec java -javaagent:/app/newrelic/newrelic.jar -jar /app/app.jar
