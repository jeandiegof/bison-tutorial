calc: calc.y calc.l asd.c
	bison -d calc.y
	flex -o calc.lex.c calc.l
	gcc -fsanitize=address -g -Werror -o calc asd.c calc.lex.c calc.tab.c -lfl -lm 

asd: asd.h asd.c asd_main.c
	gcc -fsanitize=address -g -Werror -o asd asd.c asd_main.c

clean:
	rm -rf calc asd
