snippets
========

Misc short code snippets to help Java developer's get through his/her routines.

props/ -- work with Java property files
PropsPrinter.java -- prints input *.properties file w/o comments and blank lines
cmp_props.pl -- post-processes output of 'diff -uBw first.properties second.properties':
 It shows entries defined only in first.properties, only in second.properties and
 differences between entries in both of them.
 
 Typical usage is:
  $ java PropsPrinter first.properties > first.filtered
  $ java PropsPrinter second.properties > second.filtered
  $ diff -uBw *.filtered | perl -f cmp_props.pl
