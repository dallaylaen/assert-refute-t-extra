test:
	./make_all.sh test

dist:
	./make_all.sh manifest test dist
	mv */Assert-Refute-*.gz .

clean:
	./make_all.sh clean
	rm -f Assert-Refute-*.tar.gz

