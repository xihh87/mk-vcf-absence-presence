ALELE_TARGETS=`{./targets}

all:VE: $ALELE_TARGETS

clean:VE:
	rm $ALELE_TARGETS

results/%.txt:	data/%.vcf.gz
	mkdir -p `dirname $target`
	zcat $prereq \
	| ./extract_data \
	| ./reduce_data \
	> $target'.building' \
	&& mv $target'.building' $target

results/%.transposed.txt:	results/%.txt
	ROWS=`awk 'END{print NR}'`
	COLS=`awk '{print NF; exit}' $prereq`
	./transpose \
		--input "$ROWS"'x'"$COLS" \
		--transpose \
		$prereq \
	> $target'.building' \
	&& mv $target'.building' $target

transpose:	transpose.c
	make transpose
