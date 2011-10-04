#変数・配列設定
my $display = 0;	#確認画面出力フラグ
my $pic_number = 0;	#図形個数　想定は1～4
my @picures;		#図形セット 要素数可変 将来的にはGUI化したいね
my @operations;		#命令セット 要素数は@picturesに依存
my @def_operations = ("上下反転　", "左右反転　", "前図形消去", "後図形消去", "直前入替　", "前命令消去", "後命令消去", "総順序反転", "部分入替　", "複合入替　");

#初期条件設定
print "図形の個数を入力　：　";
$pic_number = <STDIN>;

chomp ($pic_number);
if ($pic_number =~ /^[1-4]$/){
	for($i=0; $i<$pic_number; $i++){
		$pictures[$i] = $i+1;
	}
	for($i=0; $i<=$pic_number; $i++){
		$operations[$i] = "op$i";
	}
}else{
	print "入力が不適切です。図形数は最大4個まで。\n";
	exit(0);
}

#命令をセット
for(my $i=1; $i<=$#operations+1; $i++){
	my $input;

	for(my $j=0;$j <= $#def_operations; $j++){
		print "$j : $def_operations[$j]  ";
		if(($j+1)%5 == 0){ print "\n"; }
	}

	print "$i番目の命令 : ";
	$input = <STDIN>;
	chomp($input);
	if ($input =~ /^[0-9]$/){
		$operations[$i-1] = $def_operations[$input];
	}else{
		print "入力が不適切です。対応した番号のみ入力してください。\n";
		exit(0);
	}
}

#各命令処理
for(my $i=0; $i<=$#operations; $i++){	#優先命令実行
	my $ope = $operations[$i];
	if($ope eq $def_operations[5]){	#前命令取り消し
		$operations[$i-1] = "";
	}
	elsif($ope eq $def_operations[6]){	#次命令取り消し
		$operations[$i+1] = "";
	}
}

for(my $i=0; $i<=$#operations; $i++){	#通常命令実行
	my $ope = $operations[$i];

	if($i == $#operations){
		print "入れるべき命令が無い場合は0を入力してください。\n";
	}
	if($ope eq $def_operations[0]){	#上下反転
		unless($i > $#pictures){
			$pictures[$i] .= "↑";
		}
	}
	elsif($ope eq $def_operations[1]){	#左右反転
		unless($i > $#pictures){
			$pictures[$i] .= "⇔"
		}
	}
	elsif($ope eq $def_operations[2]){	#前図形消去
		$pictures[$i-1] = "";
	}
	elsif($ope eq $def_operations[3]){	#後図形消去
		unless($i+1 > $#pictures){
			$pictures[$i+1] = "";
		}
	}
	elsif($ope eq $def_operations[4]){	#直前入替
		my $buff = $pictures[$i];
		$pictures[$i] = $pictures[$i-1];
		$pictures[$i-1] = $buff;
	}
	elsif($ope eq $def_operations[7]){	#総順序反転
		my @buffs = reverse(@pictures);
		@pictures = @buffs;
	}
	elsif($ope eq $def_operations[8]){	#部分入替(図形4つのみ)
		my @buffs = @pictures;
		$pictures[0] = $buffs[2];
		$pictures[1] = $buffs[3];
		$pictures[2] = $buffs[0];
		$pictures[3] = $buffs[1];
	}
	elsif($ope eq $def_operations[9]){	#複合入替(図形4つのみ))
		my @buffs = @pictures;
		$pictures[0] = $buffs[1];
		$pictures[1] = $buffs[0];
		$pictures[2] = $buffs[3];
		$pictures[3] = $buffs[2];
	}
}

#結果表示
	print "\n命令実行結果\n";
	for(my $i=1; $i<=$#pictures+1; $i++){
		print "$i : $pictures[$i-1]\n";
	}

if($display){	
	print "\n-------確認用-------\n";
	print "図形一覧\n";
	for(my $i=0;$i <= $#pictures; $i++){
		print "$i : $pictures[$i]  ";
	}
	print "\n";
	print "命令一覧\n";
	for(my $i=0;$i <= $#operations; $i++){
		print "$i : $operations[$i]  ";
		if(($i+1)%5 == 0){ print "\n"; }
	}
	print "\n";
	print "予\約命令一覧\n";
	for(my $i=0;$i <= $#def_operations; $i++){
		print "$i : $def_operations[$i]  ";
		if(($i+1)%5 == 0){ print "\n"; }
	}
}