# Latexmk configuration file.
$postscript_mode = $dvi_mode = 0;

# Always try to embed fonts, ignoring licensing flags, etc.
$xdvipdfmx = 'xdvipdfmx -E -o %D %O %S';

# Files to clean.
$clean_ext = 'bbl glo gls hd loa run.xml thm xdv';

# Process index.
$makeindex = 'makeindex -s gind.ist %O -o %D %S';

# Process glossary (change history).
add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
  system("makeindex -s gglo.ist -o '$_[0].gls' '$_[0].glo'");
}
