debImport "-sv" "+define+SIM" "-f" "sim_filelist.f" "+DUMP_FSDB"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/zhangg/GIT_ALL/test/qspi_prj/sim/tb_qspi_flash.fsdb}
srcHBSelect "tb_qspi_flash" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_qspi_flash" -delim "."
srcHBSelect "tb_qspi_flash" -win $_nTrace1
srcHBSelect "tb_qspi_flash.flash_rdid_inst" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_qspi_flash.flash_rdid_inst" -delim "."
srcHBSelect "tb_qspi_flash.flash_rdid_inst" -win $_nTrace1
srcHBSelect "tb_qspi_flash.m25p16_inst" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_qspi_flash.m25p16_inst" -delim "."
srcHBSelect "tb_qspi_flash.m25p16_inst" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {83 83 1 26 1 1}
wvAddSignal -win $_nWave2 "/tb_qspi_flash/m25p16_inst/S" \
           "/tb_qspi_flash/m25p16_inst/C_" \
           "/tb_qspi_flash/m25p16_inst/HOLD_DQ3" \
           "/tb_qspi_flash/m25p16_inst/DQ0" "/tb_qspi_flash/m25p16_inst/DQ1" \
           "/tb_qspi_flash/m25p16_inst/Vcc\[31:0\]" \
           "/tb_qspi_flash/m25p16_inst/Vpp_W_DQ2"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1/m25p16_inst" 0)}
wvAddSubGroup -win $_nWave2 -holdpost {m25p16_inst}
wvAddSignal -win $_nWave2 "/tb_qspi_flash/m25p16_inst/S" \
           "/tb_qspi_flash/m25p16_inst/C_" \
           "/tb_qspi_flash/m25p16_inst/HOLD_DQ3" \
           "/tb_qspi_flash/m25p16_inst/DQ0" "/tb_qspi_flash/m25p16_inst/DQ1" \
           "/tb_qspi_flash/m25p16_inst/Vcc\[31:0\]" \
           "/tb_qspi_flash/m25p16_inst/Vpp_W_DQ2"
wvSetPosition -win $_nWave2 {("G1/m25p16_inst" 0)}
wvSetPosition -win $_nWave2 {("G1/m25p16_inst" 7)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 75005474.148062 93452513.358010
wvZoom -win $_nWave2 81417660.709760 84959833.652329
wvSelectGroup -win $_nWave2 {G1/m25p16_inst}
wvSetCursor -win $_nWave2 82048655.080086 -snap {("G1" 4)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {93 109 1 1 1 83}
