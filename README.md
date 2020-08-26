# README

# アプリ名
Engineer-Road

# 概要
プログラミング学習用のSNSです。
<br />
各ユーザーがプログラミング学習で学んだ知識を記載、共有ができますので、各ユーザー間での学習内容の共有やアウトプットの練習に適しています。
<br />
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
<br />
そこで、プログラミングの学習のアウトプットが可能なアプリがあれば学習が向上すると思い、開発しました。
<br />
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
<br />
②ログイン後、トップページのグループ一覧にて希望のグループをクリックする。（希望のグループが存在しない場合、左上の「新規グループ作成」ボタンから新しくグループを作成できる）
<br />
③選択したグループに投稿された内容を閲覧できます。また、各投稿には、「いいね」もしくはコメントすることができる。
<br />
④上部の検索機能からキーワードを入力すると、該当の投稿を検索できる。
<br />
⑤トップページ右上のマイページをクリックすると、自分の投稿と「いいね」をした投稿を閲覧できる。

# 本番環境
●GitHub: https://github.com/pyonkichi-keke/engineer-road
<br />
●デプロイ先: http://54.248.147.132/
<br />
●テストアカウント: Email: aaa@gmail.com / Password: aaaaaa

# DEMO
# トップ画面
[![Image from Gyazo](https://i.gyazo.com/ceb58172740b648faff47e56844e3c24.gif)](https://gyazo.com/ceb58172740b648faff47e56844e3c24)
# 新規投稿画面
[![Image from Gyazo](https://i.gyazo.com/2ff6a3ff39759c9aa7570a93e91e589b.gif)](https://gyazo.com/2ff6a3ff39759c9aa7570a93e91e589b)
# コメント画面
[![Image from Gyazo](https://i.gyazo.com/a6f782d4a44bd7afd18c5c3b39c1d671.gif)](https://gyazo.com/a6f782d4a44bd7afd18c5c3b39c1d671)
# マイページ画面
[![Image from Gyazo](https://i.gyazo.com/31ef8e66fe1913ef0d728ed4d231d579.gif)](https://gyazo.com/31ef8e66fe1913ef0d728ed4d231d579)

# 工夫したポイント
●　検索機能を搭載した事。
<br />
●　マイページにおいて、「いいね」した投稿を検索できるようにしたこと。
<br />
上記２点を実装することによって、プログラミング学習において、自分が知りたい情報をすぐに取り出せるようになるため学習効率の向上に繋がります。
<br />
●　javascriptを使って、ユーザー登録や新規投稿の際に使用する画像のプレビューを表示して、投稿しやすくした事

# 今後実装したい機能
●　検索機能をインクリメンタルサーチにする。
<br />
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
    
  
