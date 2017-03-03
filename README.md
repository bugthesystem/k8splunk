
k8splunk
----------------------------------------------
> Send [kubernetes](https://github.com/kubernetes/kubernetes) logs to [splunk](https://github.com/splunk) using [fluentd](https://github.com/fluent/fluentd)

**To Deploy Daemonset:**
```sh
kubectl create -f k8splunk-ds.yaml
```

**To build Docker image:**
```sh
docker build -t ziyasal/k8splunk:{tag} .
```

**To deploy local splunk (demo purpose only):**

```sh
kubectl create -f splunk-rc.yaml -f splunk-svc.yaml
```

**Warning**  
Demo splunk installation requires to configure http event collector to receive logs ([setup link](http://docs.splunk.com/Documentation/Splunk/latest/Data/UsetheHTTPEventCollector))

**TODO**
- Update `td-agent.conf` with [official](https://github.com/kubernetes/kubernetes/blob/master/cluster/addons/fluentd-elasticsearch/fluentd-es-image/td-agent.conf) one
- Create Helm Chart
- Add documentation
