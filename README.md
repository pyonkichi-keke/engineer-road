# README

# アプリ名
Engineer-Road

# 概要
プログラミング学習用のSNSです。
各ユーザーがプログラミング学習で学んだ知識を記載、共有ができますので、各ユーザー間での学習内容の共有やアウトプットの練習に適しています。
また、コメント機能やいいね機能も搭載しているため、ユーザー同士でコミュニケーションも取ることができます。

# 使用技術(開発環境)
●言語：　HTML, SCSS, Ruby, Javascript
<br />
●フレームワーク：　Ruby on rails
<br />
●DB:　mysql
<br />
●サーバー: AWS

# 作成の背景
プログラミング学習において、学んだ内容を積極的にアウトプットすることで定着することを肌で感じていました。
そこで、プログラミングの学習のアウトプットが可能なアプリがあれば学習が向上すると思い、開発しました。
また、エンジニア同士で気軽にコミュニケーションを取れる場があれば、お互いに刺激をもらいモチベーションが上がると思いました。

# 実装機能
●新規投稿・編集・削除機能
<br />
●ユーザー管理機能（gem:devise）
<br />
●いいね機能
<br />
●コメント機能（非同期通信）
<br />
●検索機能

# 使い方
①新規登録またはログイン（テスト用アカウントは下記に記載）
②ログイン後、トップページのグループ一覧にて希望のグループをクリックする。（希望のグループが存在しない場合、左上の「新規グループ作成」ボタンから新しくグループを作成できる）
③選択したグループに投稿された内容を閲覧できます。また、各投稿には、「いいね」もしくはコメントすることができる。
④上部の検索機能からキーワードを入力すると、該当の投稿を検索できる。
⑤トップページ右上のマイページをクリックすると、自分の投稿と「いいね」をした投稿を閲覧できる。

# 本番環境
●GitHub:http://54.248.147.132/
●デプロイ先: http://54.248.147.132/
●テストアカウント: Email: aaa@gmail.com / Password: aaaaaa

# DEMO
トップ画面です。
<br />
<img width="1440" alt="スクリーンショット 2020-08-17 15 21 00" src="https://user-images.githubusercontent.com/66993984/90364046-aec7b680-e09e-11ea-8e05-5a59d818a5a5.png">
<br />
トップ画面から各グループをクリックすると該当のグループに投稿された記事の一覧が表示されます。
<br />
[![Image from Gyazo](https://i.gyazo.com/cf623383c6e2818e16b8e52334b2c970.gif)](https://gyazo.com/cf623383c6e2818e16b8e52334b2c970)
<br />
各記事をクリックすると詳細画面に移動し、コメントやいいねを投稿することが可能です。
<br />
[![Image from Gyazo](https://i.gyazo.com/0cc71e82087b156b1d06773ad9124ced.gif)](https://gyazo.com/0cc71e82087b156b1d06773ad9124ced)

# 工夫したポイント
●　検索機能を搭載した事。
●　マイページにおいて、「いいね」した投稿を検索できるようにしたこと。
上記２点を実装することによって、プログラミング学習において、自分が知りたい情報をすぐに取り出せるようになるため学習効率の向上に繋がります。

# 今後実装したい機能
●　検索機能をインクリメンタルサーチにする。
●　画像を投稿内の好きなところに貼れるようにする。（現在は、投稿の一番上にしか貼れないため）

# DB設計
## Usersテーブル
  |Column|Type|Options|
  |------|----|-------|
  |name|string|null: false|
  |image|string|-------|
  |email|string|null: false|
  |password|string|null: false|

## Groupsテーブル
  |Column|Type|Options|
  |------|----|-------|
  |name|string|null: false|

## Messagesテーブル
  |Column|Type|Options|
  |------|----|-------|
  |title|string|null: false, index: true|
  |content|text|null: false|
  |image|string|-------|
  |group_id|references|foreign_key: true|
  |user_id|references|foreign_key: true|

## Commentsテーブル
  |Column|Type|Options|
  |------|----|-------|
  |comment|text|null: false|
  |message_id|references|foreign_key: true|
  |user_id|references|foreign_key: true|
  
## Favoritesテーブル
  |Column|Type|Options|
  |------|----|-------|
  |message_id|references|foreign_key: true|
  |user_id|references|foreign_key: true|
    
  
