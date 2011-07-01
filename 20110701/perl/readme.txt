Perlによる文字列置換

[l3-6]
指定変数に標準入力から文字列代入するサブルーチン。
chomp()で改行削除。

[l22,33]
open(IN, $inputFileName) || die "Error: $inputFileName\n";
こう書くとファイルオープンに失敗した場合に
エラーメッセージ出してくれる。
if(!open(IN, $inputFileName)){...
と同じカンジ。

