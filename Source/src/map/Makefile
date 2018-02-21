
COMMON_H = $(shell ls ../common/*.h)
COMMON_AR = ../common/obj/common.a
COMMON_INCLUDE = -I../common/

MT19937AR_OBJ = ../../3rdparty/mt19937ar/mt19937ar.o
MT19937AR_H = ../../3rdparty/mt19937ar/mt19937ar.h
MT19937AR_INCLUDE = -I../../3rdparty/mt19937ar

LIBCONFIG_H = $(shell ls ../../3rdparty/libconfig/*.h)
LIBCONFIG_AR = ../../3rdparty/libconfig/obj/libconfig.a
LIBCONFIG_INCLUDE = -I../../3rdparty/libconfig

YAML_CPP_OBJ = $(shell find ../../3rdparty/yaml-cpp/ -type f -name "*.cpp" | sed -e "s/\.cpp/\.o/g" )
YAML_CPP_DIR_OBJ = $(YAML_CPP_OBJ:%=obj/%)
YAML_CPP_AR = ../../3rdparty/yaml-cpp/obj/yaml-cpp.a
YAML_CPP_H = $(shell find ../../3rdparty/yaml-cpp/ -type f -name "*.h")
YAML_CPP_INCLUDE = -I../../3rdparty/yaml-cpp/include

MAP_OBJ = $(shell ls *.cpp | sed -e "s/\.cpp/\.o/g")
#MAP_OBJ += $(shell ls *.c | sed -e "s/\.c/\.o/g")
MAP_DIR_OBJ = $(MAP_OBJ:%=obj/%)
MAP_H = $(shell ls ../map/*.hpp) \
	$(shell ls ../config/*.h) 

HAVE_MYSQL=yes
ifeq ($(HAVE_MYSQL),yes)
	SERVER_DEPENDS=map-server
else
	SERVER_DEPENDS=needs_mysql
endif
ALL_DEPENDS=server

HAVE_PCRE=yes
ifeq ($(HAVE_PCRE),yes)
	PCRE_CFLAGS=-DPCRE_SUPPORT 
else
	PCRE_CFLAGS=
endif



#####################################################################
.PHONY : all server clean help

all: $(ALL_DEPENDS)

server: $(SERVER_DEPENDS)

clean:
	@echo "	CLEAN	map"
	@rm -rf *.o obj ../../map-server

help:
	@echo "possible targets are 'server' 'all' 'clean' 'help'"
	@echo "'server' - map server"
	@echo "'all'    - builds all above targets"
	@echo "'clean'  - cleans builds and objects"
	@echo "'help'   - outputs this message"

#####################################################################

needs_mysql:
	@echo "MySQL not found or disabled by the configure script"
	@exit 1

# object directories

obj:
	@echo "	MKDIR	obj"
	@-mkdir obj

# executables

map-server: obj $(MAP_DIR_OBJ) $(COMMON_AR) $(LIBCONFIG_AR) $(YAML_CPP_AR)
	@echo "	LD	map-server"
	@g++  -L/usr/lib -o ../../map-server $(MAP_DIR_OBJ) $(COMMON_AR) $(MT19937AR_OBJ) $(LIBCONFIG_AR) $(YAML_CPP_AR) -lpcre -lpthread -lrt -lz  -ldl -lpcre -rdynamic -L/usr/lib64/mysql -lmysqlclient -lz -lcrypt -lnsl -lm -lssl -lcrypto


# map object files
#cause this one failling otherwise
obj/npc.o: npc.cpp $(MAP_H) $(COMMON_H)  $(MT19937AR_H) $(LIBCONFIG_H) $(YAML_CPP_H)
	@echo "	CXX	$< (custom rule)"
	@g++ -std=c++11  -DMAXCONN=16384 -I../common -DHAS_TLS -fno-strict-aliasing -DHAVE_SETRLIMIT -DHAVE_STRNLEN  -I/usr/include -DHAVE_MONOTONIC_CLOCK $(COMMON_INCLUDE) $(MT19937AR_INCLUDE) $(LIBCONFIG_INCLUDE) $(PCRE_CFLAGS) $(YAML_CPP_INCLUDE) -I/usr/include/mysql  -DMAXCONN=16384 -I../common -DHAS_TLS -fno-strict-aliasing -DHAVE_SETRLIMIT -DHAVE_STRNLEN  -I/usr/include -DHAVE_MONOTONIC_CLOCK -c $(OUTPUT_OPTION) $<

obj/%.o: %.c $(MAP_H) $(COMMON_H)  $(MT19937AR_H) $(LIBCONFIG_H) $(YAML_CPP_H)
	@echo "	CC	$<"
	@gcc -flto -fuse-linker-plugin -g -O2 -pipe -ffast-math -Wall -Wempty-body -Wno-switch -Wno-missing-field-initializers -Wno-maybe-uninitialized -Wno-clobbered -Wshadow $(COMMON_INCLUDE) $(MT19937AR_INCLUDE) $(LIBCONFIG_INCLUDE) $(PCRE_CFLAGS) $(YAML_CPP_INCLUDE) -I/usr/include/mysql  -DMAXCONN=16384 -I../common -DHAS_TLS -fno-strict-aliasing -DHAVE_SETRLIMIT -DHAVE_STRNLEN  -I/usr/include -DHAVE_MONOTONIC_CLOCK -c $(OUTPUT_OPTION) $<
	
obj/%.o: %.cpp $(MAP_H) $(COMMON_H)  $(MT19937AR_H) $(LIBCONFIG_H) $(YAML_CPP_H)
	@echo "	CXX	$<"
	@g++ -g -O2 -std=c++11 $(COMMON_INCLUDE) $(MT19937AR_INCLUDE) $(LIBCONFIG_INCLUDE) $(PCRE_CFLAGS) $(YAML_CPP_INCLUDE) -I/usr/include/mysql  -DMAXCONN=16384 -I../common -DHAS_TLS -fno-strict-aliasing -DHAVE_SETRLIMIT -DHAVE_STRNLEN  -I/usr/include -DHAVE_MONOTONIC_CLOCK -c $(OUTPUT_OPTION) $<

# missing object files
$(COMMON_AR):
	@$(MAKE) -C ../common server

$(MT19937AR_OBJ):
	@$(MAKE) -C ../../3rdparty/mt19937ar

$(LIBCONFIG_AR):
	@$(MAKE) -C ../../3rdparty/libconfig

$(YAML_CPP_AR):
	@$(MAKE) -C ../../3rdparty/yaml-cpp
