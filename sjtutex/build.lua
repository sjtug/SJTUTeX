#!/usr/bin/env texlua

module             = "sjtutex"

sourcefiledir      = "source"
sourcefiles        = {"sjtutex.dtx","sjtu-vi-*.pdf"}
installfiles       = {"*.cls","*.def","*.cfg","*.pdf"}

docfiledir         = "doc"

typesetexe         = "xelatex"
typesetfiles       = {"sample-*.tex","sjtutex.dtx"}
typesetsuppfiles   = {"common-*.tex"}

bibtexexe          = "bibtex"

unpackexe          = "xetex"
unpackfiles        = {"sjtutex.dtx"}

packtdszip         = true

tdslocations = {
  "tex/latex/sjtutex/config/*.cfg",
  "tex/latex/sjtutex/fd/sjtu-*-font-*.def",
  "tex/latex/sjtutex/vi/sjtu-vi-*.pdf"
}
