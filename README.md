# README

# アプリ名
Engineer-Road

# 概要
プログラミング学習用のSNSです。
各ユーザーがプログラミング学習で学んだ知識を記載、共有ができますので、各ユーザー間での学習内容の共有やアウトプットの練習に適しています。
また、コメント機能やいいね機能も搭載しているため、ユーザー同士でコミュニケーションも取ることができます。

# 作成の背景
プログラミング学習において、学んだ内容を積極的にアウトプットすることで定着することを肌で感じていました。
そこで、プログラミングの学習のアウトプットが可能なアプリがあれば学習が向上すると思い、開発しました。
また、エンジニア同士で気軽にコミュニケーションを取れる場があれば、お互いに刺激をもらいモチベーションが上がると思いました。

# 使い方
ログイン後、各グループ（言語や技術ごとにグループを分けています）に沿った記事を投稿することができます。
書き込みたい内容に合ったグループが存在しない場合は、「新規グループ作成」ボタンから新しく作成することができます。
トップページのグループをクリックすると、記事を閲覧できます。
他のユーザーの記事をクリックすると、コメントやいいねを投稿することができます。
自分の投稿記事をクリックすると、記事の編集・削除が可能です。
トップページの上部の検索ボタンから知りたい情報のキーワードを検索すると、キーワードに沿った内容の記事が検索できます。

# DEMO
トップ画面です。
<br />
<img width="1440" alt="スクリーンショット 2020-08-17 15 21 00" src="https://user-images.githubusercontent.com/66993984/90364046-aec7b680-e09e-11ea-8e05-5a59d818a5a5.png">
<br />
トップ画面からグループをクリックすると該当のグループに投稿された記事の一覧が表示されます。
<br />
<img width="1440" alt="スクリーンショット 2020-08-17 15 20 50" src="https://user-images.githubusercontent.com/66993984/90364055-b4bd9780-e09e-11ea-82ac-84a9f32f2099.png">
<br />
各記事をクリックすると詳細画面に移動し、コメントやいいねを投稿することが可能です。
<br />
<img width="1440" alt="スクリーンショット 2020-08-17 15 20 36" src="https://user-images.githubusercontent.com/66993984/90364059-b6875b00-e09e-11ea-98d8-40990c1a95e9.png">


# 工夫したポイント
プログラミングの学習において、自分のメモ帳を見返しながら学習をしていたが、知りたい情報がどこに書いているのか探すのに時間がかかる場面が多々ありました。
そこで、自分がこのアプリの中で、学習のメモを残して、検索できたら学習効率が向上すると考えました。
そこで、railsを使って、キーワードでメモを検索できる機能を搭載しました。

# 使用技術(開発環境)
HTML, SCSS, Ruby, Ruby on rails, Javascript

# 今後実装したい機能
Javascriptを使って、より動きのあるアプリにしたい。
現在、画像を記事の一番上にしか記載することができないため、好きなところに画像を貼れるようにしたい。

# DB設計
## Usersテーブル
  |Column|Type|Options|
  |------|----|-------|
  |name|string|null: false|
  |email|string|null: false|
  |password|string|null: false|

## Groupsテーブル
  |Column|Type|Options|
  |------|----|-------|
  |name|string|null: false|

## Messagesテーブル
  |Column|Type|Options|
  |------|----|-------|
  |content|text|null: false|
  |title|string|null: false|
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
    
  
