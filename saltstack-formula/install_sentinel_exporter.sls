install_sentinel_exporter:
  file.managed:
    - source: salt://{{ slspath }}/sentinel_exporter
    - name: /usr/bin/sentinel_exporter
    - mode: '0775'


install_systemd_opt_file:
  file.managed:
    - source: salt://{{ slspath }}/systemd/sentinel_exporter_opts
    - name: /etc/sysconfig/sentinel_exporter_opts


install_systemd_service:
  file.managed:
    - source: salt://{{ slspath }}/systemd/sentinel-exporter.service
    - name: /usr/lib/systemd/system/sentinel-exporter.service


launch_exporter:
  service.running:
    - name: sentinel-exporter
    - enable: True
    - require:
      - file: install_systemd_service
      - file: install_sentinel_exporter
