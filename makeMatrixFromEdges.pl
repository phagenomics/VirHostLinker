$file = $ARGV[0];

open ($FH, '<', $file) or die "Cannot open $file\n";
while ($line = <$FH>) {
	chomp ($line);
	@blast= split (/\t/, $line);
	$RNA{$blast[0]}++;
	$HIT{$blast[1]}++;
	$comb="$blast[0]"."$blast[1]";
	$counts{$comb}++;
}
close($FH);



	print "\t";
foreach $clave (sort { $HIT{$b} <=> $HIT{$a}  } keys %HIT) {
	print "$clave\t"
}
	print "\n";


foreach $key (sort { $RNA{$b} <=> $RNA{$a}  } keys %RNA) {
		print "$key\t";
	foreach $clave (sort { $HIT{$b} <=> $HIT{$a}  }keys %HIT ){	
		$comb = "$key"."$clave";
		if ($counts{$comb} > 0) {
			print "$counts{$comb}\t";
		} else {
			print "0\t";
		}
	}
		print "\n";
}
	
	
	
	
	
	
	