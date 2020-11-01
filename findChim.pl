$file = $ARGV[0];

open ($FH, '<', $file) or die "Cannot open $file\n";
while ($line = <$FH>) {
	chomp ($line);
	chomp ($line);
	print "$line";
	%ct=();
  	@data = split (/\t/, $line);
  	$over =0;
	for $i ($data[18]..$data[19]){
			$ct{$i}++;
		}
	for $i ($data[32]..$data[33]){
			$ct{$i}++;
	}
	foreach $key (keys %ct) {
		if ($ct{$key}==2) {
			$over++;
		}
	}
	print "\t$over\n";
}
close($FH);
__END__
for $j (0..1700) {
	print "$j\t$ct{$j}\n";
}