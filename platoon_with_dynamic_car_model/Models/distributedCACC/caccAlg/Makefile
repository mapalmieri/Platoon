CC=gcc
CFLAGS=-I.

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)
all:
	gcc -fPIC -Wall -c fmu.c
	gcc -fPIC -Wall -c skeleton.c
	gcc -fPIC -Wall -c misraC/DomenicoV_caccAlg.c
	gcc -shared -o caccAlg.so skeleton.o fmu.o caccAlg.o -lm
	rm -rf sources
	rm -rf binaries
	mkdir sources
	mkdir  binaries
	mkdir binaries/linux64
	cp fmu.h sources
	cp FmuGUID.h sources
	cp fmu.c sources
	cp skeleton.c sources
	rm -f misraC/main.c
	cp -r misraC sources
	cp -r fmi sources
	mv caccAlg.so binaries/linux64/
	zip -r caccAlg.fmu modelDescription.xml binaries/ resources/ sources/
	rm -rf sources
	rm -rf binaries

run:
	./fmuCheck.linux64 -h 1E-01 -s 10 caccAlg.fmu
run1:
	./fmuCheck.linux64 -h 1E-02 caccAlg.fmu
run2:
	./fmuCheck.linux64 -h 1E-00 -s 20 caccAlg.fmu
run3:
	./fmuCheck.linux64 -h 5E-00 -s 100 caccAlg.fmu
runTest:
	./fmuCheck.linux64 -h 1E-00 -s 3 caccAlg.fmu

clean:
	rm -rf  caccAlg.o fmu.o skeleton.o
