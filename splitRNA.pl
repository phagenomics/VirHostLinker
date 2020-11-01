$file = $ARGV[0];   #### LIST OF NAMES

open ($FH, '<', $file) or die "Cannot open $file\n";
while ($line = <$FH>) {
    chomp ($line);
    $good{$line}++;
}
close($FH);

####

$file1 = $ARGV[1];

$tag = $ARGV[2];
            
            $outputNOT = "$tag".".NOT.fq";
            open ($OUT, '>>', $outputNOT);
            
open ($FH, '<', $file1) or die "Cannot open $file1\n";
while ($line = <$FH>) {
	chomp ($line);
    if ($line =~ /^>(.+?)\s+/) {    ####ALways review this line, does it the <AT> does it start with HWI? etc
 			#print "$1\n";
            $name = $1;
        if (exists($good{$name})) {
        	close($OUT);
            $outputRNA = "$tag".".5YR.fq";
            open ($OUT, '>>', $outputRNA);
        } else {
        	close($OUT);
            $outputNOT = "$tag".".NOT.fq";
            open ($OUT, '>>', $outputNOT);
        }
      
    }
	   print $OUT "$line\n";
}
close($FH);

__END__







