# test
* initialize
  * ゼロベースでvagrant環境、各Dockerコンテナを作成するplaybook
  * `$> vagrant up`または`$> vagrant provision`
* backup
  * MySQLなどのデータベース、httpdなどの静的ファイルのバックアップを実行するplaybook
  * 実行する前に鍵認証設定が必要
    * `$> ssh-keygen -t rsa`
    * ファイルパスは`~/.ssh/id_rsa_vagrant_test`
    * `$> vagrant ssh-config >> ~/.ssh/config`
    * パスフレーズは適当に
    * `$> ssh-copy-id -i ~/.ssh/id_rsa_vagrant_test.pub test`でtestへ公開鍵を転送
      * Macにはコマンドがないので、githubから取ってくるとよい
      * `$> curl -L https://raw.githubusercontent.com/beautifulcode/ssh-copy-id-for-OSX/master/install.sh | sh`
  * `$> ansible-playbook -i hosts backup/backup.yml --private-key=~/.ssh/id_rsa_vagrant_test`
* provision
  * 作成中
  * Data only containerではない通常のコンテナの差し替えを行うplaybook
  * ある程度汚くなったので綺麗にしつつ構成はそのままにする場合など
* restore
  * backupで保存したバあｍックアップファイルをリストアするplaybook
  * バックアップファイルを`files/mysql.backup.tar`として配置する(これは手動)
  * `$> ansible-playbook -i hosts restore/restore.yml --private-key=~/.ssh/id_rsa_vagrant_test`
* synced_folder
  * vagrantとホスト間で共有するディレクトリ
  * バックアップファイルの転送に使用する
