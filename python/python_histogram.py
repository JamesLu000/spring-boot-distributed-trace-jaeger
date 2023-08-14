from opentelemetry import metrics
from opentelemetry.sdk.metrics import MeterProvider
from opentelemetry.sdk.metrics import view
from opentelemetry.sdk.metrics.export import PeriodicExportingMetricReader, ConsoleMetricExporter
from opentelemetry.sdk.resources import SERVICE_NAME, Resource

# Service name is required for most backends,
# and although it's not necessary for console export,
# it's good to set service name anyways.
resource = Resource(attributes={
    SERVICE_NAME: "test"
})

reader = PeriodicExportingMetricReader(ConsoleMetricExporter())
# histogram_view = view.ExplicitBucketHistogramAggregation(boundaries=(0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0), record_min_max=True)
provider = MeterProvider(
    resource=resource,
    metric_readers=[reader],
    views=[view.View(
        instrument_name="*", 
        aggregation=view.ExplicitBucketHistogramAggregation(
            (0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0)
    ))],
)
# provider = MeterProvider(resource=resource, metric_readers=[reader], views=[View(instrument_name="*”, aggregation=ExplicitBucketHistogramAggregation((1,20,50,100,1000))],)
metrics.set_meter_provider(provider)
import time
import random
meter = metrics.get_meter('serving')
distribution_counter = meter.create_histogram(
    name="ctr_and_winrate_distribution", description="Metadata distribution", unit="float"
)
while True:
    ctr = random.random()
    distribution_counter.record(ctr)
    time.sleep(1)