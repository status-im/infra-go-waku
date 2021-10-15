# Description

This Ansible role deploys a [go-waku](https://github.com/status-im/go-waku) node which implements the [Waku v2](https://rfc.vac.dev/spec/10/) spec.

# Configuration

A basic config would include:
```yaml
# Logging
go_waku_log_level: 'DEBUG'

# Ports
go_waku_libp2p_port: 9000
go_waku_metrics_port: 8008
go_waku_websocket_port: 9001
go_waku_metrics_enabled: true
go_waku_websocket_enabled: true

# Protocols
go_waku_relay_enabled: true
go_waku_store_enabled: true
go_waku_filter_enabled: true
go_waku_lightpush_enabled: true
go_waku_rendezvous_enabled: true
```

# Management

The node is deployed using [Docker Compose](https://docs.docker.com/compose/):
```
 > docker-compose ps
    Name                  Command               State                                         Ports                                       
------------------------------------------------------------------------------------------------------------------------------------------
go-waku-node   /usr/bin/waku --nodekey=2f ...   Up      0.0.0.0:30303->30303/tcp, 0.0.0.0:8008->8008/tcp, 9000/tcp, 0.0.0.0:9001->9001/tcp

 > docker-compose up --force-recreate -d
Recreating go-waku-node ... done
```
