ALELE_TARGETS=`{./targets}

all:VE: $ALELE_TARGETS

clean:VE:
	rm $ALELE_TARGETS

results/%.txt:	data/%.vcf.gz
	mkdir -p `dirname $target`
	zcat $prereq \
	| ./extract_data \
	| ./reduce_data \
	| ./transpose -t \
	> $target

transpose:	transpose.c
	make transpose
