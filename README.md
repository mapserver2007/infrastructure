# README

## 設定済み
※IPアドレスは仮
* ci (192.168.1.4)
    * CIサーバ
        * jenkins-echelonベースの自動テスト
            * rankforce
            * log4ever
        * 個別の自動テスト
            * webstream-framework
* dev (192.168.1.6)
    * 開発実行環境
        * ホストから`vagrant rsync`後に動作確認
            * php

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
