# Sentinel exporter
This is simple [Sentinel exporter](https://redis.io/topics/sentinel) for [prometheus monitoring system](https://prometheus.io/)

It really useful when your sentinel manages more than one redis-sets.

Right now it just exposes metrics:
 * Amount of slaves
 * Current status of Sentinel masters
 * Amount of sentinels

## Installing
There is not setup.py yet, so before launching you need to install some dependencies:

#### Using pip:
```bash
pip install prometheus_client
pip install redis
```
#### For Debian-like systems
```bash
apt-get install python-prometheus-client python-redis 
```
#### For Centos-like systems
```bash
yum install python-prometheus_client python-redis
```

#### Systemd 
```bash
cp ./sentinel_exporter/sentinel_exporter /usr/bin/sentinel_exporter
cp ./sentinel_exporter/systemd/sentinel_exporter.service /usr/lib/systemd/system/sentinel-exporter.service
cp ./sentinel_exporter/systemd/sentinel_exporter_opts
sudo systemctl enable sentinel-exporter
sudo systemctl start sentinel-exporter


#Just in case check if it has been launched good
sudo systemctl status sentinel-exporter
```

## Launching
```bash
python sentinel_exporter 
```

#### Avaliables argumets to pass
```
  -h, --help            show this help message and exit
  -addr ADDR            hostname to connect
  -port PORT            port to connect (default ":5000")
  -sleeptime SLEEPTIME  sleep time beetween probes
  -weblisten WEBLISTEN  Address to listen (default ":8000")
```

## Metrics
 * sentinel_status - Status of sentinel. 0 means OK
 * sentinel_slaves - Amount of connected slaves
 * sentinel_sentinels - Amount of working sentinels
 
## Output
```
# HELP sentinel_status Status of sentinel. 0 means OK
# TYPE sentinel_status gauge
sentinel_status{address="10.zzz.yyy.xxx:6381",name="cluster_name_1"} 0.0
sentinel_status{address="10.zzz.yyy.xxx:6379",name="cluster_name_2"} 0.0
sentinel_status{address="10.zzz.yyy.xxx:6382",name="cluster_name_3"} 0.0
# HELP sentinel_slaves Count of connected slaves
# TYPE sentinel_slaves gauge
sentinel_slaves{address="10.zzz.yyy.xxx:6381",name="cluster_name_1"} 0.0
sentinel_slaves{address="10.zzz.yyy.xxx:6379",name="cluster_name_2"} 0.0
sentinel_slaves{address="10.zzz.yyy.xxx:6382",name="cluster_name_3"} 0.0
# HELP sentinel_sentinels Count of working sentinels
# TYPE sentinel_sentinels gauge
sentinel_sentinels{address="10.zzz.yyy.xxx:6381",name="cluster_name_1"} 0.0
sentinel_sentinels{address="10.zzz.yyy.xxx:6379",name="cluster_name_2"} 0.0
sentinel_sentinels{address="10.zzz.yyy.xxx:6382",name="cluster_name_3"} 0.0
```

#### TODO
 * Create a docker
 * Scrape all metrics not only about slaves/sentinels/status