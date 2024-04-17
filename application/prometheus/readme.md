k apply -f prometheus.yaml
k apply -f crds/monitoring.coreos.com_prometheuses.yaml



(instance:node_cpu_utilisation:rate5m{instance="192.168.59.104:9100"})


100 - ( avg(node_memory_MemAvailable_bytes{job="node-exporter", instance="192.168.59.104:9100"}) / avg(node_memory_MemTotal_bytes{job="node-exporter", instance="192.168.59.104:9100"}) * 100 )


up{job="node-exporter", instance="192.168.59.106:9100"}