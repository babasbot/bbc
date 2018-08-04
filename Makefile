bbc: 	bbc.l bbc.y
	bison -d bbc.y
	flex bbc.l
	cc -o $@ bbc.tab.c lex.yy.c -ll

clean:
	rm *.tab.[c,h] lex.yy.c bbc
