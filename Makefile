# Taken from CVS:phase3/extensions/wikidiff/Makefile and modified

all: wikiparse html2xml wiki2html

php_wikiparse.so : lex.yy.c wikiparse.tab.c parsetree.c parsetree.h

wikiparse:
	gcc -o wikiparse wikiparse.tab.c parsetree.c lex.yy.c
	
html2xml:
	g++ -o html2xml html2xml.cpp
	
wiki2html: wiki2html.tab.c
	gcc -o wiki2html wiki2html.tab.c htmltree.c lex.yy.c

lex.yy.c : wikilex.l
	flex wikilex.l

wikiparse.tab.c : wikiparse.y
	bison -d wikiparse.y
	
wiki2html.tab.c : wiki2html.y
	bison -d wiki2html.y

clean :
	rm -f php_wikiparse.so
	rm -f wikiparse.tab.c
	rm -f wikiparse.tab.h
	rm -f wikiparse_wrap.c
	rm -f lex.yy.c

