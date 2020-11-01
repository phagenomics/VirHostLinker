$file = $ARGV[0];

open ($FH, '<', $file) or die "Cannot open $file\n";
while ($line = <$FH>) {
	chomp ($line);
    @data = split (/\s/, $line);
    $ln{$data[0]}=$data[1];
    
   
}
close($FH);


$file2 = $ARGV[1];

open ($FH, '<', $file2) or die "Cannot open $file2\n";
while ($line = <$FH>) {
	chomp ($line);

	 @data = split (/\t/, $line);
	# print "$data[4]\t$ln{$data[0]}\n";
	if( $data[3]/$ln{$data[0]} > 0.95) {
		print "$line\n";
	}
}
close($FH);
