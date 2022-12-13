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
