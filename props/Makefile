%.class: %.java
	javac $?

%.filtered: %.properties
	java PropsPrinter $? > $@
	
all: compile concat prepare_samples compare

compile: PropsPrinter.class

concat:
	bash ./concat_props.sh group1
	bash ./concat_props.sh group2
	
compare:
	diff -uBw group1.all.filtered group2.all.filtered | perl -f ./cmp_props.pl

prepare_samples:
	java PropsPrinter group1.all.properties > group1.all.filtered	
	java PropsPrinter group2.all.properties > group2.all.filtered	

.PHONY: clean

clean:
	rm -f *~ *.class *.filtered *all.properties
	
	