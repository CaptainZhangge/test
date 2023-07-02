debImport "-sv" "+define+SIM" "-f" "./filelist.f" "+DUMP_FSDB"
srcHBSelect "Testbench" -win $_nTrace1
srcSetScope -win $_nTrace1 "Testbench" -delim "."
srcHBSelect "Testbench" -win $_nTrace1
srcHBSelect "Testbench" -win $_nTrace1
srcSetScope -win $_nTrace1 "Testbench" -delim "."
srcHBSelect "Testbench" -win $_nTrace1
srcInvokeExtEditor -win $_nTrace1
verdiDockWidgetSetCurTab -dock widgetDock_MTB_SOURCE_TAB_1
srcCloseWindow -win $_nTrace2
srcHBSelect "Testbench" -win $_nTrace1
srcHBSelect "Testbench.DUT" -win $_nTrace1
srcSetScope -win $_nTrace1 "Testbench.DUT" -delim "."
srcHBSelect "Testbench.DUT" -win $_nTrace1
srcHBSelect "Testbench" -win $_nTrace1
srcSetScope -win $_nTrace1 "Testbench" -delim "."
srcHBSelect "Testbench" -win $_nTrace1
srcHBSelect "Testbench" -win $_nTrace1
srcSetScope -win $_nTrace1 "Testbench" -delim "."
srcHBSelect "Testbench" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 69 -pos 2 -win $_nTrace1
