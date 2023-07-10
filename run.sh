#!/bin/bash
#
#export OTEL_EXPORTER_JAEGER_ENDPOINT=http://localhost:14250
#export OTEL_TRACES_EXPORTER=jaeger
export OTEL_JAVAAGENT_LOGGING=application
export OTEL_LOGS_EXPORTER=otlp
export JAVA_OPTS="-javaagent:${PWD}/opentelemetry-javaagent.jar"

java $JAVA_OPTS -jar target/spring-boot-distributed-trace-jaeger-0.0.1-SNAPSHOT.jar --spring.application.name=Service-2 --server.port=8090 &
java $JAVA_OPTS -jar target/spring-boot-distributed-trace-jaeger-0.0.1-SNAPSHOT.jar --spring.application.name=Service-1 --server.port=8080 &
docker compose up -d
#docker run -v $(pwd)/otel-config.yaml:/etc/otelcol-contrib/config.yaml otel/opentelemetry-collector-contrib:0.81.0

