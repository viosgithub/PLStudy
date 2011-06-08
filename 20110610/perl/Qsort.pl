## Quick Sort Algorithm

## サブルーチン
sub quickSort{
	my ($numRef, $left, $right) = @_;
	my $index = &partition($numRef, $left, $right);
	# 省略形はかえって見づらいと思うので非省略
	if($left < $index - 1){
		&quickSort($numRef, $left, $index - 1);
	}
	if($index < $right){
		&quickSort($numRef, $index, $right);
	}
}

sub partition{
	my ($numRef, $left, $right) = @_;
	my $pivot = $numRef->[($left + $right) / 2];

	while($left <= $right){
		while($numRef->[$left] < $pivot){
			$left++;
		}
		while($numRef->[$right] > $pivot){
			$right--;
		}

		if($left > $right){
			last;
		}

		&swap($numRef, $left, $right);

		$left++;
		$right--;
	}

	return($left);
}

sub swap{
	my ($arrRef, $i, $j) = @_;
	my $tmp = 0;

	$tmp = $arrRef->[$i];
	$arrRef->[$i] = $arrRef->[$j];
	$arrRef->[$j] = $tmp;
}

## メインプログラム

@nums = (7,2,4,3,8,5,6,1,3,7,9);
$length = $#nums;	# my $length = @nums - 1;と同義

# \を入れないと文字化け
print "ソ\ート前 : [", join(",",@nums),"]\n";
&quickSort(\@nums, 0,  $length);
print "ソ\ート後 : [", join(",",@nums),"]\n";
