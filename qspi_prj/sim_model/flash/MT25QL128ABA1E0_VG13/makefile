export  file_name = tb_qspi_flash

FILE_LIST = ./filelist.f
##TB_DIR    = 
SIMV_FILE = simv
LOG_DIR   = ./log
DEFINE    =+define+SIM 

#----Coverage----
CM_TYPE = line+cond+fsm+branch+tgl
CM_DIR  = ./coverage

#----Verdi-----
###NOVAS_HOME = /disk/Synopsys/verdi_2016.06-1/bin/verdi
DUMP_COND  = DUMP_FSDB

VCOMP = vcs -full64 -sverilog +v2k -debug_pp    \
	-o ${FILE_LIST} 			\
	-l ${LOG_DIR}/compile.log		\
	-f ${FILE_LIST}				\
	+incdir+${TB_DIR}			\


VERDI = -LDFLAGS -rdynamic -P ${NOVAS_ARGS}


.PHONY: com vcs verdi

#CM  = -cm line+cond+fsm+branch+tgl
CM  = ""
#PLI = -P /opt/Synopsys/verdi_2018.09/verdi/Verdi_O-2018.09-SP2/share/PLI/VCS/LINUXAMD64/novas.tab  /opt/Synopsys/verdi_2018.09/verdi/Verdi_O-2018.09-SP2/share/PLI/VCS/LINUXAMD64/pli.a
PLI = -P /disk/Synopsys/verdi-2018.9/verdi/Verdi_O-2018.09-SP2/share/PLI/VCS/LINUXAMD64/novas.tab  /disk/Synopsys/verdi-2018.9/verdi/Verdi_O-2018.09-SP2/share/PLI/VCS/LINUXAMD64/pli.a


#----------COMMAND-----------
com:
	vlogan -work work               		\
	       	-sverilog                       \
	       	+v2k                            \
	       	-full64                         \
	       	-l compile.log                  \
	       	${DEFINE}						\
	       	-f ${FILE_LIST}
vcs:
	vcs     -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed \
                -full64                         \
				-sverilog						\
                -lca                            \
                -timescale=1ns/100fs            \
                -l run.log                      \
                ${DEFINE}						\
			-F ${FILE_LIST}						\
				-o ./sim/simv  					\
			    $(CM)                           \
                $(PLI)                          \
                -Mupdate                        \
                -R                              \
                +lint=all                       \
                -debug_all                      \
                +vcs+initreg+random             \
                -q


###comp:	
####	${VCOMP} ${CM}  ${VERDI}

verdi:
	verdi -nologo -sv ${DEFINE} -f ${FILE_LIST}  +${DUMP_COND}

nlint:
	nLint -sv -f ${FILE_LIST} -l nLint.log -gui &

clean:
	rm -rf *.csrc ./*.daidir ${SIMV_FILE } *simv* ucli* *.vpd *.fsdb *novas* *.log
