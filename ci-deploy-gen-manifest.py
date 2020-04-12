#!/usr/bin/env python3

import json
import yaml

grafana = {
	"apiVersion": "integreatly.org/v1alpha1", 
        "kind": "GrafanaDashboard", 
        "metadata": {
	  "name": "baby-room-current"
	  }, 
        "spec": {
          "name": "baby-room-current.json",
          "plugins": [{
            "name": "grafana-clock-panel",
            }],
	  "json": {}
	  }
	}

try:
  with open("grafana-dashboard.json", "r") as f:
    grafana_dashboard = json.load(f)
  grafana["spec"]["json"] = json.dumps(grafana_dashboard)
  print(yaml.safe_dump(grafana))
  with open("grafana.json", "w") as f:
    json.dump(grafana, f)
except OSError as e:
  print(e)
