#�ϐ��E�z��ݒ�
my $display = 0;	#�m�F��ʏo�̓t���O
my $pic_number = 0;	#�}�`���@�z���1�`4
my @picures;		#�}�`�Z�b�g �v�f���� �����I�ɂ�GUI����������
my @operations;		#���߃Z�b�g �v�f����@pictures�Ɉˑ�
my @def_operations = ("�㉺���]�@", "���E���]�@", "�O�}�`����", "��}�`����", "���O���ց@", "�O���ߏ���", "�㖽�ߏ���", "���������]", "�������ց@", "�������ց@");

#���������ݒ�
print "�}�`�̌�����́@�F�@";
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
	print "���͂��s�K�؂ł��B�}�`���͍ő�4�܂ŁB\n";
	exit(0);
}

#���߂��Z�b�g
for(my $i=1; $i<=$#operations+1; $i++){
	my $input;

	for(my $j=0;$j <= $#def_operations; $j++){
		print "$j : $def_operations[$j]  ";
		if(($j+1)%5 == 0){ print "\n"; }
	}

	print "$i�Ԗڂ̖��� : ";
	$input = <STDIN>;
	chomp($input);
	if ($input =~ /^[0-9]$/){
		$operations[$i-1] = $def_operations[$input];
	}else{
		print "���͂��s�K�؂ł��B�Ή������ԍ��̂ݓ��͂��Ă��������B\n";
		exit(0);
	}
}

#�e���ߏ���
for(my $i=0; $i<=$#operations; $i++){	#�D�施�ߎ��s
	my $ope = $operations[$i];
	if($ope eq $def_operations[5]){	#�O���ߎ�����
		$operations[$i-1] = "";
	}
	elsif($ope eq $def_operations[6]){	#�����ߎ�����
		$operations[$i+1] = "";
	}
}

for(my $i=0; $i<=$#operations; $i++){	#�ʏ햽�ߎ��s
	my $ope = $operations[$i];

	if($i == $#operations){
		print "�����ׂ����߂������ꍇ��0����͂��Ă��������B\n";
	}
	if($ope eq $def_operations[0]){	#�㉺���]
		unless($i > $#pictures){
			$pictures[$i] .= "��";
		}
	}
	elsif($ope eq $def_operations[1]){	#���E���]
		unless($i > $#pictures){
			$pictures[$i] .= "��"
		}
	}
	elsif($ope eq $def_operations[2]){	#�O�}�`����
		$pictures[$i-1] = "";
	}
	elsif($ope eq $def_operations[3]){	#��}�`����
		unless($i+1 > $#pictures){
			$pictures[$i+1] = "";
		}
	}
	elsif($ope eq $def_operations[4]){	#���O����
		my $buff = $pictures[$i];
		$pictures[$i] = $pictures[$i-1];
		$pictures[$i-1] = $buff;
	}
	elsif($ope eq $def_operations[7]){	#���������]
		my @buffs = reverse(@pictures);
		@pictures = @buffs;
	}
	elsif($ope eq $def_operations[8]){	#��������(�}�`4�̂�)
		my @buffs = @pictures;
		$pictures[0] = $buffs[2];
		$pictures[1] = $buffs[3];
		$pictures[2] = $buffs[0];
		$pictures[3] = $buffs[1];
	}
	elsif($ope eq $def_operations[9]){	#��������(�}�`4�̂�))
		my @buffs = @pictures;
		$pictures[0] = $buffs[1];
		$pictures[1] = $buffs[0];
		$pictures[2] = $buffs[3];
		$pictures[3] = $buffs[2];
	}
}

#���ʕ\��
	print "\n���ߎ��s����\n";
	for(my $i=1; $i<=$#pictures+1; $i++){
		print "$i : $pictures[$i-1]\n";
	}

if($display){	
	print "\n-------�m�F�p-------\n";
	print "�}�`�ꗗ\n";
	for(my $i=0;$i <= $#pictures; $i++){
		print "$i : $pictures[$i]  ";
	}
	print "\n";
	print "���߈ꗗ\n";
	for(my $i=0;$i <= $#operations; $i++){
		print "$i : $operations[$i]  ";
		if(($i+1)%5 == 0){ print "\n"; }
	}
	print "\n";
	print "�\\�񖽗߈ꗗ\n";
	for(my $i=0;$i <= $#def_operations; $i++){
		print "$i : $def_operations[$i]  ";
		if(($i+1)%5 == 0){ print "\n"; }
	}
}