use Bio::SeqIO;
#use Bio::Annotation; 
#use Bio::AnnotationCollection;

my $file=$ARGV[0];

$seqio_obj = Bio::SeqIO->new(-file => "$file",  -format => "genbank" );

$seqio_obj = Bio::SeqIO->new(-file => "$file",  -format => "genbank" );
my $out= Bio::SeqIO->new(-file=> ">$file\.faa",-format=> 'Fasta');
my $seq_object = $seqio_obj->next_seq; 
#my $txt=open(FILE,">$file.txt") or die $!;
#my $anno_collection = $seq_obj->annotation;

for my $feat_object ($seq_object->get_SeqFeatures) {
    if ($feat_object->primary_tag eq "CDS") {
        if ($feat_object->has_tag('locus_tag') and $feat_object->has_tag('translation') ) {
            for my $val ($feat_object->get_tag_values('locus_tag')) {
                for my $prot ($feat_object->get_tag_values('translation')) {
#                       print ">$val\n$prot\n";
#			 my $accesion = $anno_collection->get_Annotations('accession');
                        my $organism = $feat_object->get_tag_value('organism');
                       # print FILE "$accession\t$prot\t$accession\t$organism";
                        #print  "$accession\ti";
			print "$prot\t$organism\n";

              my $seq = Bio::Seq->new(-seq => $prot, -display_id => "$val");
		$out->write_seq($seq);	


                        $cont++;
                        }
                }
        }
    }
}

close FILE;
