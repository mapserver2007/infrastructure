# docker-jenkins

## 起動

```
vagrant@dev-docker> docker-compose up -d
```

## 設定バックアップ

```
vagrant@dev-docker> docker exec -it jenkins bash
$> cd /tmp
$> ./jenkins-backup.sh $JENKINS_HOME /tmp/backup/jenkins-backup.tar.gz
```

## 設定リストア

```
-- in docker container
vagrant@dev-docker> docker exec -it jenkins bash
$> cp /tmp/backup/jenkins-backup.tar.gz /tmp
$> cd /tmp
$> tar xzf jenkins-backup.tar.gz
$> cp -r jenkins-backup/* $JENKINS_HOME
$> exit

-- in vagrant vm
vagrant@dev-docker > docker-compose restart
```

