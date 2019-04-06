# Open LDAP on docker

## 環境構築
以下のイメージを使用する。

* https://github.com/osixia/docker-openldap
* https://github.com/osixia/docker-phpLDAPadmin

```
$> docker-compose up -d
```

## ログイン
ログインIDは`cn=(adminで初期値固定),dc=(ドメイン名の階層単位で列挙)`、パスワードは`LDAP_ADMIN_PASSWORD`に指定したもの。  
cnに指定する値は、ドメインの階層ごとに列挙する。例えば、ldap.example.comの場合、dc=ldap,dc=example,dc=comとなる。  
cnは管理画面上で変更可能。

## コマンドで検索
ディレクトリデータベースは階層構造のため、まずルートノードと特権ユーザを作成する必要がある。  
コンテナを起動ときにルートノードと特権ユーザが作成されるので、確認する。

```
[vagrant@dev-docker docker-ldap]$ docker exec openldap ldapsearch -x -H ldap://localhost -b dc=ldap,dc=summer-lights,dc=jp -D "cn=admin,dc=ldap,dc=summer-lights,dc=jp" -w admin
# extended LDIF
#
# LDAPv3
# base <dc=ldap,dc=summer-lights,dc=jp> with scope subtree
# filter: (objectclass=*)
# requesting: ALL
#

# ldap.summer-lights.jp
dn: dc=ldap,dc=summer-lights,dc=jp
objectClass: top
objectClass: dcObject
objectClass: organization
o: summer-lights
dc: ldap

# admin, ldap.summer-lights.jp
dn: cn=admin,dc=ldap,dc=summer-lights,dc=jp
objectClass: simpleSecurityObject
objectClass: organizationalRole
cn: admin
description: LDAP administrator
userPassword:: e1NTSEF9ZjZvWVJieGtwaFd4eTFWMmxTSllQQmdGRkJCSlJ4ZSs=

# search result
search: 2
result: 0 Success

# numResponses: 3
# numEntries: 2
```

## OU(Organization Unit)の作成
1. DN=dc=ldap,dc=summer-lights,dc=jpの`Create Object`を開く。
2. `Generic: Organisational Unit`を選択
3. 名前に`test1`にしてcommit
4. OUが作成される

## ユーザをOUに所属させる
1. ou=test1の`Create a child entry`を開く。
2. `Kolab: User Entry`を選択
3. 必要な情報を入力してcommit
    * FirstName, FamilyName, CommonName, Password, MailAddress程度でOK
4. OU配下にユーザが追加される

## LDAP設定のバックアップ
