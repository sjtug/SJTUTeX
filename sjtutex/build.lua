#!/usr/bin/env texlua

module             = "sjtutex"

sourcefiledir      = "source"
sourcefiles        = {"sjtutex.dtx","sjtu-vi-*.pdf"}
installfiles       = {"*.cls","*.def","*.pdf"}

docfiledir         = "doc"

typesetexe         = "xelatex"
typesetfiles       = {"sample-*.tex","sjtutex.dtx"}
typesetsuppfiles   = {"ctxdoc.cls","common-*.tex","ref.bib"}

bibtexexe          = "bibtex"

unpackexe          = "xetex"
unpackfiles        = {"sjtutex.dtx"}

packtdszip         = true

tdslocations = {
  "tex/latex/sjtutex/fd/sjtu-*-font-*.def",
  "tex/latex/sjtutex/vi/sjtu-vi-*.pdf"
}

excludefiles       = {"*~","sample-*.tex","sample-*.pdf"}
