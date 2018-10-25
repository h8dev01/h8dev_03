
define EOL


endef

TOOL_PREFIX =   /home/bootH/bin/h8300-elf-
start_up_files_SRCdir:=../h8dev_02

LDSCRIPT    =   h8300hnelf.x
CRT0        =   h8300hCrt0.S

start_up_files_DSTdir:=./startUP
start_up_files_Name:=$(LDSCRIPT) $(CRT0)


gcc         =   $(TOOL_PREFIX)gcc
as          =   $(TOOL_PREFIX)as
ld          =   $(TOOL_PREFIX)ld
objdump     =   $(TOOL_PREFIX)objdump
objcopy     =   $(TOOL_PREFIX)objcopy

cPara01:= -O3 -mh -g -mrelax -mint32 -DH8_3664 -nostdlib \
	-T $(start_up_files_DSTdir)/$(LDSCRIPT)  \
	$(start_up_files_DSTdir)/$(CRT0)  

all: show_help 

## modify the following file to set the analyze file set.
include Makefile.env
$(if $(strip $(anaSET0)),,$(info )$(info why anaSET0 empty ?)$(info )$(error 183811))

all:



h help :

c clean:


# git remote add origin https://github.com/h8dev01/h8dev_03.git

m:
	vim Makefile

gs :
	git status
gc :
	git commit -a
gd:
	git diff
up gu:
	git push -u origin master

#anaSETno:=0
#
#define anaTP3
#
#
#endef
#
#define anaTP2
#$(eeval anaSETlast:=$$(shell echo -n $$$$(($$(1)-1))))
#$(eeval anaList$(1) += $(anaSET$(1)))
#$(eeval anaList$(1) += $(anaSETlast))
#endef
#
#define anaTP1
#$(iinfo --$(1)==)
#$(eeval anaSETno:=$$(shell echo -n $$(($$$$(anaSETno)+1))))
#
#$$(eval anaSETno:=$$$$(shell echo -n  $$$$((2+1)) ))
#
#$(if $(strip $(wildcard $(1))),,$$(info )$$(info file not found : $(1))$$(info )$$(error ))
#
#$(eval anaSET1:=$$(shell basename $(1)))
#$(eval anaSET2:=dst/asmSRC.$(anaSETno).$$(anaSET1).S)
#$(eval anaSET3:=dst/asmMMM.$(anaSETno).$$(anaSET1).S)
#$(eval anaSET4:=dst/dstCOF.$(anaSETno).$$(anaSET1).coff)
#$(eval anaSET5:=dst/dstBIN.$(anaSETno).$$(anaSET1).bin)
#$(eval anaSET6:=dst/dstLST.$(anaSETno).$$(anaSET1).lst)
#$(eval anaSET7:=dst/dstHEX.$(anaSETno).$$(anaSET1).binhex.txt)
#
#$(foreach aa2,1 2 3 4 5 6 7, $(eval $(call anaTP2,$(aa2))))
#
#
#endef
#
#$(foreach aa1,$(anaSET0),$(eval $(call anaTP1,$(aa1))))
#
#$(foreach aa1,1 2 3 4 5 6 7,$(info anaList$(aa1):[$(anaList$(aa1))]))
#
#$(info anaSETno:[$(anaSETno)])
#
#a1 :=analyze1
#a1 :
#

goDST:=goDST/analyze_h8prog01.go.run
goDSTdir:=$(shell dirname $(goDST))
goSRC:=goSRC/analyze_h8prog01.src.go

$(goDST) : $(goSRC) 
	@echo
	[ -d $(goDSTdir) ] || mkdir $(goDSTdir)
	touch $@
	@echo
ggg : $(goDST)
	$(foreach aa1,$(anaSET0),$(EOL)$^ $(aa1))

h1:=show_target_option
h1:
	echo ; $(gcc) --target-help  | sed -e '/^$$/,$$ d'

h2:=show_obj_format
h2:
	echo ; $(objdump) -i

t1_List:=t1s t1b1 t1b2 vt1
$(t1_List) : m8hSRC/test01.c

t1s:=gcc_build_asm
t1s:
	echo; mkdir -p out__$@ ; $(gcc) $^ -S -o \
		out__$@/$@_$(shell basename $<).s

t1b1:=gcc_build_bin_without_para
t1b1:
	echo; mkdir -p out__$@ ; $(gcc)               $^    \
		-o out__$@/$@_$(shell basename $<).exe
	$(objcopy) -O binary \
		out__$@/$@_$(shell basename $<).exe \
		out__$@/$@_$(shell basename $<).bin
	cat \
		out__$@/$@_$(shell basename $<).bin \
		|hexdump -C -v > \
		out__$@/$@_$(shell basename $<).bin.hex.txt 

vt1:=vim_the_src_file
vt1:
	@echo 
	vim $<
	@echo 


t1b2:=gcc_build_bin_with_para01
t1b2:
	echo; mkdir -p out__$@ ; $(gcc) $(cPara01)    $^    \
		-o out__$@/$@_$(shell basename $<).exe
	$(objcopy) -O binary \
		out__$@/$@_$(shell basename $<).exe \
		out__$@/$@_$(shell basename $<).bin
	cat \
		out__$@/$@_$(shell basename $<).bin \
		|hexdump -C -v > \
		out__$@/$@_$(shell basename $<).bin.hex.txt 

help_List:=h1 h2 $(t1_List)
define help_text
 $(foreach aa1,$(help_List),$(aa1)    : $($(aa1)) $(EOL))

endef
export help_text

sh show_help :
	@echo
	@echo "$${help_text}"

define copy_start_up_file
$(start_up_files_DSTdir)/$1 : $(start_up_files_SRCdir)/$1
	[ -d $(start_up_files_DSTdir) ] || mkdir $(start_up_files_DSTdir)
	cat $$^ > $$@
$(iinfo $(start_up_files_DSTdir)/$1 :$(start_up_files_SRCdir)/$1 )

endef
$(foreach aa1,$(start_up_files_Name),$(if $(wildcard $(start_up_files_SRCdir)/$(aa1)),$(eval $(call copy_start_up_file,$(aa1))),\
	$(info )$(info "file $(start_up_files_SRCdir)/$(aa1) don NOT exist.")$(error )))

start_up_files_OBJs:=$(foreach aa1,$(start_up_files_Name),$(start_up_files_DSTdir)/$(aa1))
stu : $(start_up_files_OBJs)
	@echo
	@ls -l $^
	@echo

