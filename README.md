# k8s-observability-stack

# 🚀 Kubernetes Observability Stack (Monitoring + Logging)

## 📌 Overview

This project demonstrates a **production-style observability setup** in Kubernetes.

It includes:

* 📊 Metrics monitoring using Prometheus
* 📈 Visualization using Grafana
* 🪵 Centralized logging using EFK (Elasticsearch, Fluentd, Kibana)
* ⚙️ Helm-based deployment
* 🚀 Automated deployment script
* 🔄 CI/CD using GitHub Actions

---

# 🧱 Architecture

Observability Flow:

Applications → Fluentd → Elasticsearch → Kibana
Applications → Prometheus → Grafana

---

# 📂 Project Structure

```bash
k8s-observability-stack/
│
├── monitoring/
│   ├── namespace.yaml
│   ├── prometheus-values.yaml
│
├── logging/
│   ├── namespace.yaml
│   ├── elasticsearch.yaml
│   ├── kibana.yaml
│   ├── fluentd.yaml
│   ├── fluentd-config.yaml
│
├── scripts/
│   └── deploy.sh
│
├── .github/workflows/
│   └── monitoring.yml
│
└── README.md
```

---

# 🧰 Prerequisites

Install:

* Docker
* Minikube
* kubectl
* Helm

---

# 🚀 How to Run

## Step 1: Start Kubernetes

```bash
minikube start
```

---

## Step 2: Enable Metrics Server

```bash
minikube addons enable metrics-server
```

---

## Step 3: Deploy Stack

```bash
chmod +x scripts/deploy.sh
./scripts/deploy.sh
```

---

# 📊 Access Monitoring

## Grafana

```bash
kubectl port-forward svc/monitoring-grafana -n monitoring 3000:80
```

Open:

```
http://localhost:3000
```

### Login

* Username: admin
* Password:

```bash
kubectl get secret monitoring-grafana -n monitoring -o jsonpath="{.data.admin-password}" | base64 --decode
```

---

## Prometheus

```bash
kubectl port-forward svc/monitoring-kube-prometheus-prometheus -n monitoring 9090
```

---

# 🪵 Access Logging

## Kibana

```bash
kubectl port-forward svc/kibana -n logging 5601:5601
```

Open:

```
http://localhost:5601
```

---

# 🔁 Logging Flow

* Fluentd collects logs from containers
* Sends logs to Elasticsearch
* Kibana visualizes logs

---

# 📈 Monitoring Flow

* Prometheus scrapes metrics from cluster
* Grafana visualizes metrics
* Alertmanager handles alerts

---

# 🧠 Key Features

* Kubernetes observability stack
* Metrics + Logging integration
* Helm-based deployment
* Namespaced architecture
* Automated deployment script
* CI/CD ready

---

# ⚠️ Notes

* This setup is optimized for local (Minikube)
* Not production-hardened (no persistence, no security hardening)
* Elasticsearch runs in single-node mode

---

# 🚀 Future Improvements

* Add persistent volumes (EBS / PVC)
* Add alert rules (CPU, memory alerts)
* Add Grafana dashboards
* Add Loki instead of EFK (modern stack)
* Add RBAC and security policies

---

# 🏆 Outcome

This project demonstrates:

* Real-world observability practices
* Monitoring + logging integration
* SRE-level system visibility
* Practical Kubernetes operations

---

# 👩‍💻 Author

DevOps Engineer | Kubernetes | Observability | Cloud | CI/CD
