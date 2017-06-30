# k8splunk

> Send [kubernetes](https://github.com/kubernetes/kubernetes) logs to [splunk](https://github.com/splunk) using [fluentd](https://github.com/fluent/fluentd)


## Before start
**Update `[td-agent.conf](https://github.com/ziyasal/k8splunk/blob/master/td-agent.conf#L287)`**

```sh
<match **>
  # Other settings omitted for brevity
  server your-splunk-endpoint-here
  token your-splunk-hec-token
</match>
```

** Create `config-map`** for `td-agent.conf`

```sh
./create-config-map.sh
```

## Deploy Manually

### build Docker image

```sh
docker build -t ziyasal/k8splunk:{tag} .
```

### Deploy Daemonset

```sh
kubectl create -f k8splunk-ds.yaml
```

### To deploy local splunk (demo purpose only)

```sh
kubectl create -f splunk-rc.yaml -f splunk-svc.yaml
```

## Deploy via `Helm`
:warning: Required changes in `[values.yaml](https://github.com/ziyasal/k8splunk/blob/master/helm-chart/k8splunk/values.yaml#L5)` file;

```yaml
image:
  repository: your-repository
  
# and

pull:
  secretName : your-secret-name
```

### Package

```sh
helm package k8splunk
```

### Install chart

```sh
helm install k8splunk-{your version}.tgz
```

**:warning:** Demo splunk installation requires to configure http event collector to receive logs ([setup link](http://docs.splunk.com/Documentation/Splunk/latest/Data/UsetheHTTPEventCollector))

## TODO

- [x] Create Helm Chart
- [x]  Add documentation
