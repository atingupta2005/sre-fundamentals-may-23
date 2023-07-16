# Prometheus

## Setup
### vmubuntu-prometheus
 - prometheus server running on Ubuntu
 - URL: http://vmubuntu-prometheus.eastus.cloudapp.azure.com:9090/graph

### vmubuntu-prometheus-client1
 - prometheus client running on Ubuntu
 - URL: http://vmubuntu-prometheus-client1.eastus.cloudapp.azure.com:9100/
 
### vmwin-prometheus
 - prometheus server running on Windows
 - URL: http://vmwin-prometheus.eastus.cloudapp.azure.com:9090

### vmwin-prometheus-client1
 - prometheus client running on Windows
 - URL: http://vmwin-prometheus-client1.eastus.cloudapp.azure.com:9182/

## Installing Prometheus
### Refer: https://prometheus.io/download/

## To install for Windows open powershell and run below commands
### Connect to vmwin-prometheus
```bash
cd c:\
Invoke-WebRequest -Uri https://github.com/prometheus/prometheus/releases/download/v2.45.0/prometheus-2.45.0.windows-amd64.zip -OutFile c:\prometheus-2.45.0.windows-amd64.zip
Expand-Archive prometheus-2.45.0.windows-amd64.zip -DestinationPath C:\
cd prometheus-2.45.0.windows-amd64
ls
./prometheus.exe
```

## To install for Ubuntu run below commands
### Connect to vmubuntu-prometheus
```bash
sudo apt update
sudo apt install wget zip unzip tree -y
cd
wget https://github.com/prometheus/prometheus/releases/download/v2.45.0/prometheus-2.45.0.linux-amd64.tar.gz
tar -xzvf prometheus-2.45.0.linux-amd64.tar.gz
cd prometheus-2.45.0.linux-amd64
cat prometheus.yml
nohup ./prometheus &
curl localhost:9090
```

## Exporter for Linux
### Connect to vmubuntu-prometheus-client1
```bash
sudo apt update
sudo apt install wget zip unzip tree -y
cd
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.0/node_exporter-1.6.0.linux-amd64.tar.gz
tar -xzvf node_exporter-1.6.0.linux-amd64.tar.gz
cd node_exporter-1.6.0.linux-amd64
nohup ./node_exporter &
sudo apt install stress netstress -y
stress --cpu 8 --io 4 --vm 4 --vm-bytes 4096M --timeout 7200s

```

## Exporter for Windows
### Connect to vmwin-prometheus-client1
```powershell
Invoke-WebRequest -Uri https://github.com/prometheus-community/windows_exporter/releases/download/v0.22.0/windows_exporter-0.22.0-amd64.msi -OutFile c:\windows_exporter-0.22.0-amd64.msi
Start-Process C:\windows_exporter-0.22.0-amd64.msi
curl http://localhost:9182/metrics
```

## Binding Ubuntu Prometheus server to the WMI exporter
### Connect to vmubuntu-prometheus
```bash
cat <<EOT >> ~/prometheus-2.45.0.linux-amd64/prometheus.yml

  - job_name: "vmwin-prometheus-client1"

    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.

    static_configs:
      - targets: ["vmwin-prometheus-client1.eastus.cloudapp.azure.com:9182"]
EOT
```

## Binding Ubuntu Prometheus Server to the Ubuntu Exporter
### Connect to vmubuntu-prometheus
```bash
cat <<EOT >> ~/prometheus-2.45.0.linux-amd64/prometheus.yml

  - job_name: "vmubuntu-prometheus-client1"

    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.

    static_configs:
      - targets: ["vmubuntu-prometheus-client1.eastus.cloudapp.azure.com:9100"]
EOT
```

## Open below URL on Browser:
 - http://vmubuntu-prometheus.eastus.cloudapp.azure.com:9090/graph

## Binding Windows Prometheus server to the WMI exporter
### Connect to vmwin-prometheus
#### Open C:\prometheus-2.45.0.windows-amd64\prometheus.yml in notepad
```yml prometheus.yml
  - job_name: "vmwin-prometheus-client1"

    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.

    static_configs:
      - targets: ["vmwin-prometheus-client1.eastus.cloudapp.azure.com:9182"]
```

## Binding Windows Prometheus Server to the Ubuntu Exporter
### Connect to vmwin-prometheus
#### Open C:\prometheus-2.45.0.windows-amd64\prometheus.yml in notepad
```yml prometheus.yml
  - job_name: "vmubuntu-prometheus-client1"

    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.

    static_configs:
      - targets: ["vmubuntu-prometheus-client1.eastus.cloudapp.azure.com:9100"]
```

### Note: *Restart the Prometheus server*

#### Refer to the powershell terminal in which Prometheus service is running
#### Terminate service by pressing CTRL+C
#### Run service
```
./prometheus.exe
```

## Open below URL on browser:
- http://vmwin-prometheus.eastus.cloudapp.azure.com:9090

## Queries
### Count targets per job:
```
count by (job) (up)
```

### Amount of Memory Available in MB:
```
node_memory_MemAvailable_bytes/1024/1024
```

### Average Memory Available for Last 5 Minutes:
```
avg_over_time(node_memory_MemAvailable_bytes[5m])/1024/1024
```

### Memory Usage in Percent:
```
100 * (1 - ((avg_over_time(node_memory_MemFree_bytes[10m]) + avg_over_time(node_memory_Cached_bytes[10m]) + avg_over_time(node_memory_Buffers_bytes[10m])) / avg_over_time(node_memory_MemTotal_bytes[10m])))
```

### CPU Utilization by Node:
```
100 - (avg by (instance) (irate(node_cpu_seconds_total{mode="idle"}[10m]) * 100) * on(instance) group_left(nodename) (node_uname_info))
```

### Memory Available by Node:
```
node_memory_MemAvailable_bytes * on(instance) group_left(nodename) (node_uname_info)/1024/1024
```

### Load Average per Instance:
```
sum(node_load5{}) by (instance) / count(node_cpu_seconds_total{mode="user"}) by (instance) * 100
```

### Disk Available by Node:
```
node_filesystem_free_bytes{mountpoint="/"} * on(instance) group_left(nodename) (node_uname_info)/1024/1024
```

### Disk IO per Node: Outbound:
```
sum(rate(node_disk_read_bytes_total[1m])) by (device, instance) * on(instance) group_left(nodename) (node_uname_info)
```

### Network IO per Node:
```
sum(rate(node_network_receive_bytes_total[1m])) by (device, instance) * on(instance) group_left(nodename) (node_uname_info)
```

```
sum(rate(node_network_transmit_bytes_total[1m])) by (device, instance) * on(instance) group_left(nodename) (node_uname_info)
```

### Client Library:
#### https://github.com/prometheus/client_python
```
sudo apt install python3-pip
pip install prometheus-client
```

## Pushing Metrics
### Refer: prometheus-client.py
```
python3 pythonClient/prometheus-client.py
```

```yml prometheus.yml
  - job_name: "vmubuntu-prometheus-client1-python"

    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.

    static_configs:
      - targets: ["vmubuntu-prometheus-client1.eastus.cloudapp.azure.com:8000"]
```

## Service Discovery
```yml prometheus.yml
  - job_name: "file sd"
    file_sd_configs:
      - files:
        - file_sd/*.yml
```

```yml file_sd/files.yml
- targets:
  - localhost:9100
  labels:
    team: "Team Alpha"
```

## Setting up Alerts
```yml rules.yml
groups:
- name: AllInstances
  rules:
  - alert: InstanceDown
    # Condition for alerting
    expr: up == 0
    for: 1m
    # Annotation - additional informational labels to store more information
    annotations:
      title: 'Instance {{ $labels.instance }} down'
      description: '{{ $labels.instance }} of job {{ $labels.job }} has been down for more than 1 minute.'
    # Labels - additional labels to be attached to the alert
    labels:
      severity: 'critical'
```

```yml prometheus.yml
rule_files:
  - "rules.yml"
```

#### Sample alert rules
- https://samber.github.io/awesome-prometheus-alerts/rules.html

### Note: Restart the Prometheus server

### Stress utility for windows
- https://download.sysinternals.com/files/CPUSTRES.zip

### Open below URL to check the alarm status
- http://vmwin-prometheus.eastus.cloudapp.azure.com:9090/alerts

## Prometheus Storage
- Prometheus includes a local on-disk time series database, but also optionally integrates with remote storage systems.
### Local storage
- Prometheus's local time series database stores data in a custom, highly efficient format on local storage.

### On-disk layout
```
./data
├── 01BKGV7JBM69T2G1BGBGM6KB12
│   └── meta.json
├── 01BKGTZQ1SYQJTR4PB43C8PD98
│   ├── chunks
│   │   └── 000001
│   ├── tombstones
│   ├── index
│   └── meta.json
├── 01BKGTZQ1HHWHV8FBJXW1Y3W0K
│   └── meta.json
├── 01BKGV7JC0RY8A6MACW02A2PJD
│   ├── chunks
│   │   └── 000001
│   ├── tombstones
│   ├── index
│   └── meta.json
├── chunks_head
│   └── 000001
└── wal
    ├── 000000002
    └── checkpoint.00000001
        └── 00000000
```

