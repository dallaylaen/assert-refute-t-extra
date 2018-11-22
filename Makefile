RUNME_PL=perl Runme.PL -m $(MAKE) --verbose

dist:
	$(RUNME_PL) dist

test:
	$(RUNME_PL) test

clean:
	$(RUNME_PL) clean

help:
	$(RUNME_PL) help
