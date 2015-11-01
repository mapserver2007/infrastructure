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
    * `git://github.com/webstream-framework/infrastructure.git`
    * `*/master`

* ビルド(シェルを実行)
```sh
# PHP5.6
sudo ansible-playbook -t php5.6 -i "localhost," ansible/setup.yml
sudo docker exec php56_webstream bash -c "cd /mnt/docker/apache/www/webstream-framework/Test/ && vendor/bin/phing -f build.xml"
sudo docker cp php56_webstream:/mnt/docker/apache/www/webstream-framework/Test/reports/phpunit.xml .
```
* JUnitテスト結果集計
    * `phpunit.xml`を指定

### rankforce
* 事前準備
   * `secret_keys/rankforce`に以下のファイルを配置
   * bitly.auth.yml
   * evernote.auth.yml
   * mongolab.test.yml
   * twitter.auth.test.yml

* ソースコード管理(Git)
    * `git://github.com/rankforce/infrastructure.git`
    * `*/master`

* ビルド(シェルを実行)
```sh
# Ruby2.2
sudo ansible-playbook -t ruby2.2 -i "localhost," ansible/setup.yml
sudo docker exec ruby22_rankforce bash -c "cd /root/rankforce/ && rspec --format RspecJunitFormatter --out rspec.xml"
sudo docker cp ruby22_rankforce:/root/rankforce/rspec.xml .
```
* JUnitテスト結果集計
    * `rspec.xml`を指定
