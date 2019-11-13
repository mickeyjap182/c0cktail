# practice of Node.js

# version npm version

・表示乱れ
https://ap0.lightning.force.com/lightning/r/Case/5001000000uRryQAAS/view

・データ落ち(労働基準時間（月）)
https://ap0.lightning.force.com/lightning/r/Account/00110000013XYZyAAO/view



test-API
test.h-t.co.jp


test2.
DB :test2
api:test.api
・トークン発行:環境依存

test3.h-t.co.jp
DB: test3
api:test.api

・トークン発行:環境依存

token.api.

・トークン発行:環境依存

・トークン発行:環境依存

口頭確認ありがとうございます。
そもそも自分の前提の認識が間違ってました。

`test-api.kingtime.jp` 　ではサーバごとに発行されたtokenをの切り替えをするとのこと理解しました。

ひとまず、`test@h-t.co.jp`(developブランチ) `test2.kingtime.jp`  や `test3.kingtime.jp` (masterブランチ)で発行されたトークンに応じて、`test-api.kingtime.jp` がプロキシの役割を果たしそれぞれ



curl https://test-api.kingtime.jp/v1.0/company -H 'Content-Type:application/json; charset=utf-8' -H 'Authorization: Bearer 11ecd6bd54364b659d2e12102cd90e05'

https://test-api.kingtime.jp/v1.0/company

curl -k https://test-api.kingtime.jp/v1.0/company -H 'Content-Type:application/json; charset=utf-8' -H 'Authorization: Bearer 11ecd6bd54364b659d2e12102cd90e05'

curl -k https://test-api.kingtime.jp/v1.0/tokens/11ecd6bd54364b659d2e12102cd90e05/available -H 'Content-Type:application/json; charset=utf-8' -H 'Authorization: Bearer 11ecd6bd54364b659d2e12102cd90e05'

curl -F 'token=post1_val'
