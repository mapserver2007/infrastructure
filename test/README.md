# test
## 準備
### ssh-keygen
* `$> ssh-keygen -t rsa`
  * ファイルパスは`~/.ssh/id_rsa_vagrant_test`

### ssh-config
* `$> vagrant ssh-config --host 192.168.0.206 >> ~/.ssh/config`
  * ホストのIPアドレスをホスト名にすることでansibleと連携させる

### vagrant側へ公開鍵転送
* `$> ssh-copy-id -i ~/.ssh/id_rsa_vagrant_test.pub test`
  * Macにはコマンドがないので、githubから取ってくる
  * `$> curl -L https://raw.githubusercontent.com/beautifulcode/ssh-copy-id-for-OSX/master/install.sh | sh`

### ansible.cfg
* `$HOME/.ansible.cfg`
  * 接続元ホストのチェックをしないようにする

```
[defaults]
host_key_checking = False
```

### hosts


## 機能
* initialize
  * ゼロベースでvagrant環境、各Dockerコンテナを作成するplaybook
  * `$> vagrant up`または`$> vagrant provision`
* backup
  * MySQLなどのデータベース、httpdなどの静的ファイルのバックアップを実行するplaybook
  * `$> ansible-playbook -i hosts backup/backup.yml --private-key=~/.ssh/id_rsa_vagrant_test`
* provision[作成中]
  * Data only containerではない通常のコンテナの差し替えを行うplaybook
  * ある程度汚くなったので綺麗にしつつ構成はそのままにする場合など
* restore
  * backupで保存したバあｍックアップファイルをリストアするplaybook
  * バックアップファイルを`files/mysql.backup.tar`として配置する(これは手動)
  * `$> ansible-playbook -i hosts restore/restore.yml --private-key=~/.ssh/id_rsa_vagrant_test`
* synced_folder
  * vagrantとホスト間で共有するディレクトリ
  * バックアップファイルの転送に使用する

## コマンド
MySQLバックアップ

```
$> vagrant ssh-config >> ~/.ssh/config
$> ssh-copy-id -i ~/.ssh/id_rsa_vagrant_test.pub test
$> ansible-playbook -i hosts backup/backup-mysql.yml --private-key=~/.ssh/id_rsa_vagrant_test
```

MySQLリストア

```
$> ansible-playbook -i hosts restore/restore-mysql.yml --private-key=~/.ssh/id_rsa_vagrant_test
```
