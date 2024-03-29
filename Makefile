#
#  Sample Makefile for C++ programs 
#  Designed for the OOP class
#  by Tsai-Yen Li (li@cs.nccu.edu.tw) 08/08/96
#

# the name of this package. 
# The library and tar file, if any, will be named after it.
PACKAGE  = ALife
# The executable program
TARGET   = ALifeTest
# The C++ source programs (.cc) [multiple files]
SOURCES  = AnsiPrint RandomNum World Creature Goat Grass
# The C++ source program for testing your implementation
TEST     = ALifeTest

O_DIR    = O_$(HOSTTYPE)
SYSDIR   = /usr/local
CLASSDIR = $(SYSDIR)/class/oop
BASEDIR  = .
INCDIR   = $(BASEDIR)/include #-I$(SYSDIR)/lib/g++-include 
LIBDIR   = -L$(BASEDIR)/lib #-L/usr/openwin/lib -L/usr/ucblib
LIBS     = $(LIBDIR) -lc -lm 

# You may not need to modify anything below

CXX      = g++
CXXFLAGS = -g -Wno-deprecated -Wall -I$(INCDIR) #-D__STDC__ 
TARG     = $(TARGET)_$(HOSTTYPE)
LIB      = lib$(PACKAGE)_$(HOSTTYPE).a

SRCS     = ${SOURCES:%=%.cc}
OBJS     = ${SRCS:%.cc=$(O_DIR)/%.o}
HEADERS  = ${SRCS:%.cc=%.h} 
TESTSRC  = ${TEST:%=%.cc}
TESTOBJ  = ${TESTSRC:%.cc=$(O_DIR)/%.o}
#MAKEDEP  = $(CLASSDIR)/bin/makedepend
MAKEDEP  = makedepend

$(TARG) : $(O_DIR) $(OBJS) $(TESTOBJ)
	$(CXX) -o $@ $(CXXFLAGS) $(OBJS) $(TESTOBJ) $(LIBS) 

$(O_DIR) :
	mkdir $@

lib : $(O_DIR) $(LIB)
	@echo $@ Built

$(LIB) : $(OBJS)
	rm -f $(LIB)
	ar cr $@ $(OBJS)
	ranlib $@

$(O_DIR)/%.o: %.cc
	$(CXX) $(CXXFLAGS) -c -o $@ $<

clean: 
	rm -f $(OBJS) $(TESTOBJ) $(TARG) core* *~ Makefile.bak 
	rmdir $(O_DIR)

tags: 
	etags $(SRCS) $(HEADERS)

ztar:
	/usr/local/bin/tar zcvf $(PACKAGE).tgz Makefile $(SRCS) $(HEADERS) $(TESTSRC) 

ci:
	ci -l Makefile $(SRCS) $(HEADERS) $(TESTSRC) 

depend : 
	$(MAKEDEP) -p$(O_DIR)/ -I$(INCDIR) $(SRCS) $(TESTSRC)

# DO NOT DELETE THIS LINE -- make depend depends on it.

O_sun4/AnsiPrint.o: /usr/include/stdlib.h /usr/include/iso/stdlib_iso.h
O_sun4/AnsiPrint.o: /usr/include/sys/feature_tests.h
O_sun4/AnsiPrint.o: /usr/include/sys/isa_defs.h AnsiPrint.h
O_sun4/RandomNum.o: /usr/include/stdlib.h /usr/include/iso/stdlib_iso.h
O_sun4/RandomNum.o: /usr/include/sys/feature_tests.h
O_sun4/RandomNum.o: /usr/include/sys/isa_defs.h RandomNum.h
O_sun4/World.o: /usr/include/assert.h RandomNum.h World.h Creature.h Goat.h
O_sun4/World.o: Grass.h
O_sun4/Creature.o: RandomNum.h Creature.h World.h
O_sun4/Goat.o: /usr/include/stdlib.h /usr/include/iso/stdlib_iso.h
O_sun4/Goat.o: /usr/include/sys/feature_tests.h /usr/include/sys/isa_defs.h
O_sun4/Goat.o: World.h RandomNum.h Creature.h Goat.h Grass.h
O_sun4/Grass.o: /usr/include/stdlib.h /usr/include/iso/stdlib_iso.h
O_sun4/Grass.o: /usr/include/sys/feature_tests.h /usr/include/sys/isa_defs.h
O_sun4/Grass.o: World.h RandomNum.h Creature.h Grass.h
O_sun4/ALifeTest.o: /usr/include/stdio.h /usr/include/iso/stdio_iso.h
O_sun4/ALifeTest.o: /usr/include/sys/feature_tests.h
O_sun4/ALifeTest.o: /usr/include/sys/isa_defs.h /usr/include/sys/va_list.h
O_sun4/ALifeTest.o: /usr/include/stdio_tag.h /usr/include/stdio_impl.h
O_sun4/ALifeTest.o: /usr/include/stdlib.h /usr/include/iso/stdlib_iso.h
O_sun4/ALifeTest.o: /usr/include/assert.h AnsiPrint.h World.h RandomNum.h
O_sun4/ALifeTest.o: Creature.h
