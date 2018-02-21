
YAML_CPP_OBJ =  $(shell find * -type f -name "*.cpp" | sed -e "s/\.cpp/\.o/g")
YAML_CPP_DIR_OBJ = $(YAML_CPP_OBJ:%=obj/%)
YAML_CPP_H =  $(shell find * -type f -name "*.h")
YAML_CPP_AR = obj/yaml-cpp.a

CXXFLAG =-std=c++11
INC=-Iinclude



#####################################################################
.PHONY : all clean help yaml-cpp

all: yaml-cpp

clean:
	@echo "	CLEAN	yaml-cpp"
	@rm -rf obj *.o

help:
	@echo "possible targets are 'all' 'clean' 'help'"
	@echo "'yaml-cpp' - build $(YAML_CPP_AR)
	@echo "'all'       - builds $(YAML_CPP_DIR_OBJ)"
	@echo "'clean'     - deletes $(YAML_CPP_DIR_OBJ)"
	@echo "'help'      - outputs this message"

#####################################################################

obj:
	@echo "	MKDIR	obj/src/contrib"
	@mkdir -p obj/src/contrib
	
obj/%.o: %.cpp $(YAML_CPP_H)
	@echo "	CXX	$<"
	@g++ $(CXXFLAG) -flto -fuse-linker-plugin -ffat-lto-objects -flto -fuse-linker-plugin -g -O2 -pipe -ffast-math -Wall -Wempty-body -Wno-switch -Wno-missing-field-initializers -Wno-maybe-uninitialized -Wno-clobbered -Wshadow  -DMAXCONN=16384 -I../common -DHAS_TLS -fno-strict-aliasing -DHAVE_SETRLIMIT -DHAVE_STRNLEN  -I/usr/include -DHAVE_MONOTONIC_CLOCK -g $(INC) -c $(OUTPUT_OPTION) $<

yaml-cpp: obj $(YAML_CPP_DIR_OBJ) $(YAML_CPP_AR)

$(YAML_CPP_AR): $(YAML_CPP_DIR_OBJ)
	@echo "	AR	$@"
	@/opt/rh/devtoolset-7/root/usr/bin/ar rcs obj/yaml-cpp.a $(YAML_CPP_DIR_OBJ)
