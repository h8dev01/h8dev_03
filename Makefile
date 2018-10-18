
define EOL


endef
all:

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

anaSETno:=0

define anaTP1
$(iinfo --$(1)==)
$$(eval anaSETno:=$$(shell echo -n $$$$(($$(anaSETno)+1))))

$(if $(strip $(wildcard $(1))),,$$(info )$$(info file not found : $(1))$$(info )$$(error ))

$$(eval anaSET1:=$$(shell basename $(1)))
$$(eval anaSET2:=dst/asmSRC.$$(anaSETno).$$(anaSET1).S)
$$(eval anaSET3:=dst/asmMMM.$$(anaSETno).$$(anaSET1).S)
$$(eval anaSET4:=dst/dstCOFF.$$(anaSETno).$$(anaSET1).coff)
$$(eval anaSET5:=dst/dstBIN.$$(anaSETno).$$(anaSET1).bin)
$$(eval anaSET6:=dst/dstLST.$$(anaSETno).$$(anaSET1).lst)
$$(eval anaSET7:=dst/dstHEX.$$(anaSETno).$$(anaSET1).binhex.txt)

$(foreach aa2,1 2 3 4 5 6 7,$(eval anaList$(aa2) += $$(anaSET$(aa2))))


endef
$(foreach aa1,$(anaSET0),$(eval $(call anaTP1,$(aa1))))
$(foreach aa1,1 2 3 4 5 6 7,$(info anaList$(aa1):[$(anaList$(aa1))]))
$(info anaSETno:[$(anaSETno)])

a1 :=analyze1
a1 :

