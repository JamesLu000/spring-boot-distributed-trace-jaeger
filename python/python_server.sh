# export OTEL_TRACES_EXPORTER="otlp"
# export OTEL_LOGS_EXPORTER="otlp"
# export OTEL_METRICS_EXPORTER="otlp"
# export OTEL_EXPORTER_OTLP_PROTOCOL="grpc"
# # export OTEL_EXPORTER_OTLP_PROTOCOL="http/protobuf"
# # export OTEL_EXPORTER_OTLP_COMPRESSION="gzip"
# # export OTEL_EXPORTER_OTLP_TRACES_ENDPOINT="http://otel-collector-collector.opentelemetry-operator-system.svc:4317"
# export OTEL_EXPORTER_OTLP_ENDPOINT="http://otel-collector-collector.opentelemetry-operator-system.svc:4317"
# export OTEL_EXPORTER_OTLP_TRACES_INSECURE="true"
# export OTEL_RESOURCE_ATTRIBUTES="service.namespace=my-namespace"
# export OTEL_NODE_RESOURCE_DETECTORS="env,host,os"
# export OTEL_SERVICE_NAME="python-client"
# export OTEL_LOG_LEVEL="ALL"


OTEL_TRACES_EXPORTER="otlp" \
OTEL_LOGS_EXPORTER="otlp" \
OTEL_METRICS_EXPORTER=none \
OTEL_PYTHON_LOG_CORRELATION=true \
OTEL_EXPORTER_OTLP_PROTOCOL="grpc" \
OTEL_EXPORTER_OTLP_ENDPOINT="http://otel-collector-collector.opentelemetry-operator-system.svc:4317" \
OTEL_EXPORTER_OTLP_TRACES_INSECURE="true" \
OTEL_RESOURCE_ATTRIBUTES="service.namespace=my-namespace" \
OTEL_NODE_RESOURCE_DETECTORS="env,host,os" \
OTEL_SERVICE_NAME="python-server" \
OTEL_PYTHON_SERVICE_NAME="python-server"\
OTEL_LOG_LEVEL="debug" \
opentelemetry-instrument flask --app flask-server run


# opentelemetry-instrument python3 /ml_api_layer/scripts/stress_testing/ctr_model_stress_tester_grpc.py
