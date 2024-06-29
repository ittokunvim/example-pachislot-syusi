# Example Pachislot Syusi

ここは、`Ruby On Rails`で作成されたパチスロの収支を記録するサイトを作成するアプリケーションです。

## 始める前に

まずは始める前に以下のアプリケーションをインストールしておく必要があります。

- [Docker](https://www.docker.com/)

## 始める

まずは`Docker`を用いてビルドを行います。

```bash
make build
```

次にサーバーを立ち上げます。

```bash
make up
```

次にデータベースのセットアップを行います。

```bash
make setup_db
```

これで準備は整いました！最後に[localhost:3000](http://localhost:3000)にアクセスしてみましょう。

## その他

以下のリストはアプリ開発に便利なコマンドを用意しています。うまく使いこなしましょう！

```bash
# webコンテナにアクセスする
make web_init
# dbコンテナにアクセスする
make db_init
# データベースの中身を空にする
make db_reset
# テストを実行
make web_test
```
