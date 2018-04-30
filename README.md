# sentinel_exporter
Sentinel exporter for promethous
before install do: pip install prometheus_client; pip install redis
usage: sentinel_exporter.py [-h] [-addr ADDR] [-port PORT]
                            [-sleeptime SLEEPTIME] [-weblisten WEBLISTEN]

optional arguments:
  -h, --help            show this help message and exit
  -addr ADDR            hostname to connect
  -port PORT            port to connect, (default ":5000")
  -sleeptime SLEEPTIME  sleep time beetween probes
  -weblisten WEBLISTEN  Address to listen (default ":8000")
