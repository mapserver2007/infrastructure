# dev/docker

## セットアップ
docker, docker-composeを使える環境を作成する。

```
$> vagrant up
```

## アプリケーション
### docker-elastic-lifelog
https://github.com/mapserver2007/elastic-lifelog をdockerコンテナ内で実行し、ELK環境で必要なデータを取得する。

```
$> cd /workspace/docker-elastic-lifelog
$> make
```

取得したデータは、`/workspace/docker-elk/data`に保存され、`docker-elk`に取り込まれる。

### docker-elk
ElasticSearch/LogStash/Kibana/FileBeatの環境を構築する。

```
$> sudo docker-compose up -d
```

コンテナが起動すると以下のようになる。

```
[vagrant@dev-docker docker-elk]$ sudo docker ps
CONTAINER ID        IMAGE                                                 COMMAND                  CREATED             STATUS              PORTS                                            NAMES
71edc3fcf46f        docker.elastic.co/kibana/kibana:6.3.1                 "/usr/local/bin/ki..."   18 minutes ago      Up 18 minutes       0.0.0.0:5601->5601/tcp                           kibana
ff3309d4dded        docker.elastic.co/logstash/logstash:6.3.1             "/usr/local/bin/do..."   18 minutes ago      Up 18 minutes       0.0.0.0:5044->5044/tcp, 9600/tcp                 logstash
78e110276e0f        docker.elastic.co/elasticsearch/elasticsearch:6.3.1   "/usr/local/bin/do..."   18 minutes ago      Up 18 minutes       0.0.0.0:9200->9200/tcp, 0.0.0.0:9300->9300/tcp   elasticsearch
1b6e68f16ac6        docker.elastic.co/beats/filebeat:6.3.1                "/usr/local/bin/do..."   18 minutes ago      Up 18 minutes                                                        filebeat
```
