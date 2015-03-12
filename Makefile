# -*- Makefile -*-
SRC      = src
FILENAME = parse
OUTPUT   = native

#########################
## Tools configuration ##
#########################

OCAMLBUILD = ocamlbuild -use-ocamlfind

#########
# Rules #
#########

all:
	reset
	$(OCAMLBUILD) $(SRC)/$(FILENAME).ml $(SRC)/$(FILENAME).$(OUTPUT)

clean:
	rm -r _build/
	rm parse.$(OUTPUT)
