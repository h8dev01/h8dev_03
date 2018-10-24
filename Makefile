
define EOL


endef

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
aaa : $(goDST)
	$(foreach aa1,$(anaSET0),$(EOL)$^ $(aa1))

h1:=show_target_option
h1:
	$(gcc) --target-help

define help_text
 $(foreach aa1,h1,$(aa1)    : $($(aa1)) $(EOL))

endef
export help_text

sh show_help :
	@echo
	@echo "$${help_text}"
