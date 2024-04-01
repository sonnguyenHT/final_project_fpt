export GF_DASH_URL="https://grafana.thaison.cloud/d/ec8cc212-3b4b-4838-bb2f-9895b514cd70/node-exporter?orgId=1&refresh=30s&from=now-24h&to=now"
export GF_USER=admin
export GF_PASSWORD=prom-operator
export OUTPUT_PDF=output.pdf

node /home/son/Documents/fpt/iap491/k8s_cluster/export_pdf/grafana_pdf.js $GF_DASH_URL $GF_USER:$GF_PASSWORD $OUTPUT_PDF