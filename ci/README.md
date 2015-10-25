# README
## setup

### ssh-keygen
```sh
$> ssh-keygen -t rsa
```
* ファイルパスは`~/.ssh/id_rsa_vagrant_infrastructure_ci`

### vagrant側へ公開鍵転送
```sh
$> ssh-copy-id -i ~/.ssh/id_rsa_vagrant_infrastructure_ci.pub 192.168.0.207
```
  * Macにはコマンドがないので、githubから取ってくる

```sh
$> curl -L https://raw.githubusercontent.com/beautifulcode/ssh-copy-id-for-OSX/master/install.sh | sh
```

### ansible.cfg
* `$HOME/.ansible.cfg`

```vim
[defaults]
host_key_checking = False
```
  * 接続元ホストのチェックをしないようにする

### vagrant
```sh
$> vagrant up
$> vagrant provision
```

### ssh login
```sh
$> vagrant ssh-config --host 192.168.0.207 >> ~/.ssh/config
$> ssh 192.168.0.207
```

## jenkins job settings

### webstream-framework
* ソースコード管理(Git)

`git://github.com/webstream-framework/infrastructure.git`
`*/master`

* ビルド(シェルを実行)
```sh
sudo ansible-playbook -i "localhost," ansible/setup.yml
sudo docker exec webstream bash -c "cd /mnt/docker/apache/www/webstream-framework/Test/ && vendor/bin/phing -f build.xml"
sudo docker cp webstream:/mnt/docker/apache/www/webstream-framework/Test/reports/phpunit.xml .
```

* JUnitテスト結果集計

`phpunit.xml`を指定
