bbc: 	bbc.l bbc.y
	bison -d bbc.y
	flex bbc.l
	cc -o $@ bbc.tab.c lex.yy.c -ll

install: bbc
	ln -s ${CURDIR}/bbc /usr/local/bin/bbc

clean:
	rm *.tab.[c,h] lex.yy.c bbc
