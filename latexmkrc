$pdf_mode = 5;
$dvi_mode = 0;
$postscript_mode = 0;
$cleanup_mode = 1;
$xelatex = 'xelatex --shell-escape %O %S';
$makeindex = 'makeindex %O -s l3doc.ist %B.idx && makeindex %O -s gglo.ist -o %B.gls %B.glo ';
