# Latexmk configuration file.
#
#   WARNING: Only works with version 4.59 or higher of latexmk.
#

# Set timezone.
$ENV{'TZ'}='Asia/Shanghai';

# Use xelatex with latexmk.
$pdf_mode = 5;

# Always try to embed fonts, ignoring licensing flags, etc.
$xdvipdfmx = 'xdvipdfmx -E -o %D %O %S';
