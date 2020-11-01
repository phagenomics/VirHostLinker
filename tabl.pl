
@files = glob('./cds/*.*');

for $i (0..$#files) {
	print "$files[$i]\t";
	$tag = substr( $files[$i],6,-12);
	#print "$tag\n";
	
	open ($FH, '<', $files[$i]) or die "Cannot open $file\n";
	while ($line = <$FH>) {
 	if ($line =~ />/ ) {
 		@data = split (/\s+/, $line);
 		print "$tag\t$data[0]\n";
 	}
}
close($FH);
	
}