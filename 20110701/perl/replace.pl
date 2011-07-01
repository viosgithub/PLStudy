
# 文字列入力サブルーチン
sub inputString{
	$_[0] = <STDIN>;
	chomp( $_[0] );
}

# コマンド引数チェック
if($ARGV[0] eq ""){
	print STDERR "please input file name.\n";
	print STDERR "usage : replace.pl <file name>";
	exit(0);
}

# 変数設定
my $inputFileName = $ARGV[0];
my $outputFileName = "";
my $targetString = "";
my $newString = "";
my $line = "";

open(IN, $inputFileName) || die "Error: $inputFileName\n";

print "please input target string : ";
&inputString( $targetString );

print "please input new string : ";
&inputString( $newString );

print "please input new file name : ";
&inputString( $outputFileName );

open(OUT, ">$outputFileName") || die "Error: $outputFileName\n"; #上書きモード

while($line = <IN>){
	$line =~ s/$targetString/$newString/g;
	print OUT $line;
}

close(IN);
close(OUT);