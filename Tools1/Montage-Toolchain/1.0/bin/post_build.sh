#!/bin/sh
#mips-elf-strip ${1}
#mips-elf-objdump -Dz ${1} >wizards_strip.s
#mips-elf-objcopy -O binary ${1} wizards.bin

AS=mips-elf-as
CC=mips-elf-gcc
LD=mips-elf-ld
AR=mips-elf-ar
OD=mips-elf-objdump
OC=mips-elf-objcopy
GS=mips-elf-gasp
NM=mips-elf-nm
RD=mips-elf-readelf
STRIP=mips-elf-strip
SIZE=mips-elf-size
LIBTOOL=mips-elf-libtool

CAT=cat
LS=ls
XARGS=xargs
RM=rm
CP=cp
ECHO=echo
SED=sed
FIND=find

MAKE=make

MKIMG=mkimg_mips
ANCHOR=anchor
LZMA=lzma
    
#LD_FILE ?= $(TOPDIR)/link_mips.ld

#CFLAGS ?= $(INC) $(MACRODEF) $(OPTIMIZE_DEFINES) $(DEBUG_DEFINES)          \
#         -G0 -EL -mips1 -Wa,-xgot -nostartfiles -nodefaultlibs -Wall          \
#     	 -Wno-pointer-sign $(MIPS16FLAG) -Werror -msoft-float				  \
#		 -ffunction-sections
#AFLAGS ?= -EL -mips1
#LDFLAGS ?= --oformat elf32-littlemips -gc-sections -T$(LD_FILE) -L$(LIBDIR)

#	@$ECHO $(LDFLAGS) -o $(OUTDIR)/wizards.elf > $(OBJDIR)/.link.tmp
#	@$FIND $(OBJDIR) -name "*.o" -type f -print |sort -d >> $(OBJDIR)/.link.tmp
#	@$ECHO -lm -lc -lgcc >> $(OBJDIR)/.link.tmp
#	@$CAT $(OBJDIR)/.link.tmp | $(XARGS) $(LD) -M > $(OUTDIR)/wizards.map
	$OD -x -D --source ${1}>wizard_full.s
#	@$(SED) 's/-.*$$//g' $(OBJDIR)/.link.tmp | $(XARGS) $(SIZE) \
#	> $(OUTDIR)/wizards.siz
#	@$(SIZE) ${1} >> wizards.siz
#	@$(ECHO) Build with optimize=$(OPTIMIZE_DEFINES) \
#	debug=$(debug) unit=$(unit) >> $(OUTDIR)/wizards.siz
#ifeq "$(debug)" "0"
#	@-$(RM) -f $(OUTDIR)/wizards.dbg
#else
#	$(CP) $(OUTDIR)/wizards.elf $(OUTDIR)/wizards.dbg
#endif
	$STRIP ${1}
	$OD -Dz ${1} > wizard_strip.s
	$OC -O binary ${1} wizards.bin
	$MKIMG wizards.bin wizards.img -i
	$CP wizards.bin wizards.tmp
	$RM -f wizards.tmp.lzma
	$LZMA -z -k wizards.tmp
	$RM -f wizards.tmp
	$MKIMG wizards.tmp.lzma wizards_gz.img -g
	$RM -f wizards.tmp.lzma
	echo "post build process completes"