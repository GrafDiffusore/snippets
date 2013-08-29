snippets
========

Misc short code snippets to help Java developer's get through his/her routines.

<ul>
<li> <b>props/</b> -- code for working with Java property files which allows to see diffs in properties files easily:</li>

 <ul>
 <li>PropsPrinter.java -- prints input *.properties file w/o comments and blank lines</li>
 <li>cmp _props.pl -- post-processes output of 'diff -uBw first.properties second.properties':
      It shows entries defined only in first.properties, only in second.properties and
      differences between entries in both of them.</li>
 </ul>

 Typical usage for comparing just two files is:
 <pre>
  $ java PropsPrinter first.properties > first.filtered
  $ java PropsPrinter second.properties > second.filtered
  $ diff -uBw *.filtered | perl -f cmp_props.pl
 </pre>

 Typical usage for comparing two groups of properties files is:
 <pre>
  $ bash ./concat_props.sh group1	
  $ bash ./concat_props.sh group2
  $ java PropsPrinter first.properties > first.filtered
  $ java PropsPrinter second.properties > second.filtered
  $ diff -uBw *.filtered | perl -f cmp_props.pl
 </pre>

 Additionally, you can use above to compare **all** properties between two directories:
 <pre>
  $ cd ~/dir1
  $ bash ./concat_props.sh
  $ cd ~/dir2	
  $ bash ./concat_props.sh
  $ cd ~/
  $ cp ~/dir1/all.properties dir1.all.properties && cp ~/dir2/all.properties dir2.all.properties
  # the rest as above
 </pre>
 
 Doing
 <pre>
  $ cd ./props && make
 </pre>
 is helpful as well.
</ul>

