[![Build Status](https://travis-ci.org/radudd/ocp-influx-grafana.svg?branch=master)](https://travis-ci.org/radudd/ocp-influx-grafana)

## About

These Helm Charts are used to deploy Grafana with InfluxDB as source in an OpenShift cluster.
For InfluxDB, the Dockerhub image will be used since it's actively maintained. The one published in Red Hat Container Registry doesn't have any new tag in the last two years.
As for Grafana, the charts rely on the operator from Integreatly. The operator provides three Custom Resources:

* Grafana - deploys Grafana Application
* GrafanaDatasource - defines a Grafana datasource
* GrafanaDashboard - definition of a Grafana dashboard

GrafanaDatasource and GrafanaDashboard will match the Grafana App in the same namespace based on labels and selectors.

## Design

This repository contains three Helm charts:

* InfluxDB
* Grafana
* Grafana-Influx - which is the parent from the previous two and has them defined as dependencies.

## Deploy

Customize the `override.yaml` of the parent chart.

```
vim grafana-influx/override.yaml
```

Then go to the parent chart and build the dependencies

```
cd grafana-influx
helm dependencies build
```

Chart is ready to install now

```
helm install grafana-influx . --debug -f override.yaml
```