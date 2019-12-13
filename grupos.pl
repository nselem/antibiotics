use strict;

open (DOMINIOS,"mas_abundantes.csv");

my %dominios;
foreach my $line (<DOMINIOS>){
        chomp $line;
        my @st=split('\t',$line);
	$dominios{$st[0]}=$st[2];
#        print "1: $st[0]  -- 3 $st[2]\n";
}
close DOMINIOS;

open (FAMILIES,"CARD.FO.families");

foreach my $line (<FAMILIES>){
	chomp $line;
	my @st=split('\t',$line);
	my @st1=split(' ',$st[2]);
	my $ORTHO=$st1[0];
	$ORTHO=~s/ORTHOMCL//;
#	print "ORTHO $ORTHO\n";
	my $name="none";
	foreach my $key (keys %dominios){
#		print "key $key\n";
		if($ORTHO eq $key){
			#print "$ORTHO = $key\n";
			$name=$dominios{$key};
			}	
		}
	print "$st[0]\t$st[1]\t$name\t$st[2]\n";
}

close FAMILIES;
