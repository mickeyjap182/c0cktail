# アルゴリズム種類

1.ソート
- バブルソート
2.組み合わせ探索
3.O notation
4.アルゴリズム種類

・幅優先探索、深さ優先探索
・順列の全列挙(next_permutationを使うと楽)
・2nや3n通りの全列挙(bit演算でも関数を使った列挙でも)
・木の基本的な性質(辺の数がN-1になる事とか二点間の道が必ず一つな事とか、基本的な事だけ)
・最小公倍数、最大公約数の計算(ライブラリとして持っておくと楽)
・累積和(一次元のみ)
・除算を除く四則演算のMOD計算
・ダイクストラ法を使った最短経路計算
・Union-Find木(なくても解けるけどあると簡単になる問題がかなり多い印象)
・漸化式を使った簡単なDP(確率DPとか桁DPは必須じゃないです)
・約数計算や素因数分解、エラストテネスの篩を使った素数列挙
・メモ化再帰(重複計算を避けて計算量を落とす)
 - 同じパラメータによる演算結果を保持し、再度演算が必要なときは演算せずそちらを使う。
・upper_bound,lower_boundを使った配列の二分探索
・任意の二点間の最短経路計算(ワーシャルフロイド法)
・負の経路の検出(ベルマンフォード法)
・除法のMOD計算(MOD=109+7の時だけ知っておけば十分っぽい)
・組合せや重複組合せ(前もってテーブルを作ると楽)
・確率や期待値計算(ぼくはよくわかってません)
・しゃくとり法
・二次元累積和
・最小全域木(クラスカル法でもプリム法でもよい)
・二部マッチング問題(ライブラリを持ってると便利)
・最大フロー、最小カット(同上 ライブラリだけ持ってればいいです 使う機会少なめ)
・bitDPや桁DP(知っておいて損はないって程度)
・木やDAG上での簡単なDP(メモ化して計算量を落とす問題)
・評価する関数を用意するタイプの二分探索
・トポロジカルソート(使える事もあるけど、想定解では必要ない事が多い気がする)
・セグメント木、遅延セグ木、BIT等のデータ構造(トポロジカルソートと同様 ABCでは基本必要にならない)
・半分全列挙(使えるようになって損はないけど、400点問題では多分出ないよね…)
・ダブリング
・xor演算他ビット演算の性質(ABCでも出る事はあるけど、基本的に500点以上の高難易度問題なので覚えなくていいです)
・幾何問題で使ういろいろ(覚える必要はないです 簡単なものはその都度調べればいいので…)
・橋や関節点の検出(ABCで必要になる事はほとんどないはず)
・三分探索
・その他なんか難しいやつ色々
  [ハノイの塔]と[巡回セールスマン]
https://qiita.com/yubais/items/bf9ce0a8fefdcc0b0c97

## statistics

・ディリクレ分布、
・指数分布、
・F分布、
・ガンマ分布、
・幾何分布、
・ガンベル分布、
・超幾何分布、
・ラプラス分布、
・ロジスティック分布、
・対数正規分布.