# README

### Userテーブル
|カラム名  |データ型  |
|---|---|
|name  |string  |
|email  |string  |
|password_disied |string|

### Taskテーブル
|カラム名  |データ型  |
|---|---|
|user id(fk) |integer|
|task_name  |string  |
|task_details  |string  |
|end_period |string|
|task_status  |string  |
|priority  |string  |
|author |string|


### labelテーブル
|カラム名  |データ型  |
|---|---|
|user_id |integer |
|name |string |

### labellingテーブル
|カラム名  |データ型  |
|---|---|
|label_id(fk)|integer |
|task_id |integer |

### デプロイの手順
1. rails assets:precompile RAILS_ENV=production
1. git add -A
1. git commit -m "任意のコメント"
1. git push heroku master