# README
開発環境、実行環境、テスト環境などのインフラ設定を行う。

## 設定済み
※IPアドレスは仮
* ci (192.168.1.4)
    * CIサーバ
        * [jenkins-echelon](https://github.com/mapserver2007/jenkins-echelon)ベースの自動テスト
            * rankforce
            * log4ever
        * 個別の自動テスト
            * webstream-framework
* dev (192.168.1.6)
    * 開発環境
        * `vagrant ssh`でログイン
        * `vagrant rsync-auto`で自動同期
        * ホストから`vagrant rsync`後に動作確認
    * php
        * PHP7.0
        * https://github.com/webstream-framework
    * ruby
        * Ruby2.2.4
        * https://github.com/rankforce
        * https://github.com/mapserver2007/log4ever

## 未設定
* web (192.168.1.2)
    * Webサーバ
        * Apache
* database (192.168.1.3)
    * データベースサーバ
        * 本番用DB
        * MySQL
* file (192.168.1.5)
    * ファイルサーバ
        * 気が向いたら作る
