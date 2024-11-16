# net-tools
Tools for diagnosing networking problems from within a Kubernetes Cluster.

</br>

# Overview

Net-Tools is a debian-based, small image designed to help you diagnose potential networking issues from within a Kubernetes cluster. It contains a variety of useful networking diagnostic tools, including:

- curl
- dnsutils
- iproute2
- iputils-ping
- netcat
- net-tools (dig, iptunnel, route, etc.)
- ping
- traceroute
- wrk

It is particularly valuable in identifying stochastic networking issues due to configuraiton issues, version mismatch, or other insidious issues that break Kubernetes networking such as `kube-proxy` or `core-dns`.

</br>

# Deploying and Usage

To quickly deploy `net-tools`, we recommend using the provided `deployment.yml` via:

```bash
kubectl apply -n <NAMESPACE> -f kubernetes/deployment.yaml
```

This configuration, while minimal, is more than enough to address most usecases.

For greater customization, we also provide a helm chart, which can be installed via:

```bash
helm install net-tools oci://registry-1.docker.io/corpheus91/net-tools --version <VERSION>
```

Once installed, shell into the pod via:

```bash
kubectl -n <NAMESPACE> exec --stdin --tty $(kubectl -n <NAMESPACE> get pods -l app=net-tools -o=name | cut -d '/' -f2)) -- /bin/bash
```

From here, use any and all of the tools to research and diagnose any networking issues or question about your Kubernetes cluster! Good luck!