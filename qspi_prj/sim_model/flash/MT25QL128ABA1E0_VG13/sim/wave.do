onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Testbench/DUT/Vcc
add wave -noupdate /Testbench/DUT/S
add wave -noupdate /Testbench/DUT/C
add wave -noupdate /Testbench/DUT/HOLD_DQ3
add wave -noupdate /Testbench/DUT/Vpp_W_DQ2
add wave -noupdate /Testbench/DUT/DQ1
add wave -noupdate /Testbench/DUT/DQ0
add wave -noupdate /Testbench/DUT/Debug/x5
add wave -noupdate /Testbench/DUT/Debug/x6
add wave -noupdate /Testbench/DUT/Debug/x7
add wave -noupdate /Testbench/tasks/double_command
add wave -noupdate /Testbench/DUT/CUIDECEFI_multiSectorErase/eraseSectorsInRange/nSectors
add wave -noupdate /Testbench/DUT/CUIDECEFI_multiSectorErase/eraseSectorsInRange/start_address
add wave -noupdate -radix hexadecimal /Testbench/DUT/CUIDECEFI_multiSectorErase/checkSectorLocksInRange/nSectors
add wave -noupdate -radix hexadecimal /Testbench/DUT/CUIDECEFI_multiSectorErase/checkSectorLocksInRange/start_address
add wave -noupdate -radix hexadecimal -childformat {{{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[0]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[1]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[2]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[3]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[4]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[5]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[6]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[7]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[8]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[9]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[10]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[11]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[12]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[13]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[14]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[15]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16]} -radix hexadecimal -childformat {{{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][32]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][31]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][30]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][29]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][28]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][27]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][26]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][25]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][24]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][23]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][22]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][21]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][20]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][19]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][18]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][17]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][16]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][15]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][14]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][13]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][12]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][11]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][10]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][9]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][8]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][7]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][6]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][5]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][4]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][3]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][2]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][1]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][0]} -radix hexadecimal}}} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[17]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[18]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[19]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[20]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[21]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[22]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[23]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[24]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[25]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[26]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[27]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[28]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[29]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[30]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[31]} -radix hexadecimal}} -subitemconfig {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[0]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[1]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[2]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[3]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[4]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[5]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[6]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[7]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[8]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[9]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[10]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[11]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[12]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[13]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[14]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[15]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16]} {-height 16 -radix hexadecimal -childformat {{{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][32]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][31]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][30]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][29]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][28]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][27]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][26]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][25]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][24]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][23]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][22]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][21]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][20]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][19]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][18]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][17]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][16]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][15]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][14]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][13]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][12]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][11]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][10]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][9]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][8]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][7]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][6]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][5]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][4]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][3]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][2]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][1]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][0]} -radix hexadecimal}}} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][32]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][31]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][30]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][29]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][28]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][27]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][26]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][25]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][24]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][23]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][22]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][21]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][20]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][19]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][18]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][17]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][16]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][15]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][14]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][13]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][12]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][11]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][10]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][9]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][8]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][7]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][6]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][5]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][4]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][3]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][2]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][1]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[16][0]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[17]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[18]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[19]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[20]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[21]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[22]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[23]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[24]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[25]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[26]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[27]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[28]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[29]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[30]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[31]} {-height 16 -radix hexadecimal}} /Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable
add wave -noupdate -radix hexadecimal {/Testbench/DUT/CUIDECEFI_multiSectorErase/ssEraseable[5]}
add wave -noupdate /Testbench/tasks/clock_active
add wave -noupdate -radix ascii /Testbench/DUT/cmdRecName
add wave -noupdate -radix hexadecimal /Testbench/DUT/ck_count
add wave -noupdate -radix ascii /Testbench/DUT/protocol
add wave -noupdate -radix ascii /Testbench/DUT/prog/oldOperation
add wave -noupdate -radix ascii /Testbench/DUT/prog/operation
add wave -noupdate -radix hexadecimal /Testbench/DUT/addrLatch
add wave -noupdate /Testbench/DUT/cmdLatched
add wave -noupdate /Testbench/DUT/addrLatched
add wave -noupdate /Testbench/DUT/dataLatched
add wave -noupdate /Testbench/DUT/dummyLatched
add wave -noupdate /Testbench/DUT/startCUIdec
add wave -noupdate /Testbench/DUT/codeRecognized
add wave -noupdate /Testbench/DUT/CUIDECEFI_multiSectorErase/efiSeqRecognized
add wave -noupdate /Testbench/DUT/addrDim
add wave -noupdate /Testbench/DUT/addrDimLatch
add wave -noupdate /Testbench/DUT/addrDimLatch4
add wave -noupdate /Testbench/DUT/prog/noError
add wave -noupdate /Testbench/DUT/prog/noError2
add wave -noupdate -radix hexadecimal /Testbench/DUT/cmd
add wave -noupdate /Testbench/DUT/iAddr
add wave -noupdate -radix hexadecimal /Testbench/DUT/dataOut
add wave -noupdate /Testbench/tasks/read/i
add wave -noupdate /Testbench/tasks/read/j
add wave -noupdate /Testbench/tasks/read/n
add wave -noupdate -radix hexadecimal /Testbench/tasks/read/temp_read_byte
add wave -noupdate -radix hexadecimal /Testbench/tasks/checkData/data
add wave -noupdate -radix hexadecimal /Testbench/tasks/checkData/exp
add wave -noupdate /Testbench/DUT/lock/enable_lockReg_read
add wave -noupdate /Testbench/DUT/lock4kb/enable_lockReg_read
add wave -noupdate /Testbench/DUT/prog/delay
add wave -noupdate -radix hexadecimal /Testbench/DUT/f/sec/A
add wave -noupdate -radix hexadecimal /Testbench/DUT/f/sec/sec
add wave -noupdate /Testbench/DUT/CUIDECEFI_multiSectorErase/y
add wave -noupdate /Testbench/DUT/logicOn
add wave -noupdate /Testbench/DUT/CUIDECEFI_multiSectorErase/cmdAllowed
add wave -noupdate -radix hexadecimal /Testbench/DUT/CUIDECEFI_multiSectorErase/cmd
add wave -noupdate -radix ascii /Testbench/DUT/latchingMode
add wave -noupdate -radix hexadecimal /Testbench/DUT/CUIDECEFI_multiSectorErase/attr
add wave -noupdate /Testbench/DUT/CUIDECEFI_multiSectorErase/iCmd2
add wave -noupdate /Testbench/DUT/CUIDECEFI_multiSectorErase/iStartAddr
add wave -noupdate /Testbench/DUT/CUIDECEFI_multiSectorErase/iStopAddr
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal /Testbench/DUT/CUIDECEFI_multiSectorErase/start_address
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal /Testbench/DUT/CUIDECEFI_multiSectorErase/stop_address
add wave -noupdate /Testbench/DUT/busy
add wave -noupdate -radix unsigned /Testbench/DUT/CUIDECEFI_multiSectorErase/sector_start
add wave -noupdate -radix unsigned /Testbench/DUT/CUIDECEFI_multiSectorErase/sector_stop
add wave -noupdate -radix unsigned /Testbench/DUT/CUIDECEFI_multiSectorErase/ssCount_start
add wave -noupdate -radix unsigned /Testbench/DUT/CUIDECEFI_multiSectorErase/ssCount_stop
add wave -noupdate -color Yellow -itemcolor Yellow -radix unsigned /Testbench/DUT/CUIDECEFI_multiSectorErase/sCount_total
add wave -noupdate -color Yellow -itemcolor Yellow -radix unsigned /Testbench/DUT/CUIDECEFI_multiSectorErase/ssCount_total
add wave -noupdate -radix unsigned /Testbench/DUT/CUIDECEFI_multiSectorErase/sector_temp
add wave -noupdate /Testbench/DUT/CUIDECEFI_multiSectorErase/ssCount_total_temp
add wave -noupdate -radix ascii /Testbench/DUT/protocol
add wave -noupdate /Testbench/DUT/busy
add wave -noupdate -radix hexadecimal /Testbench/DUT/CUIDECEFI_multiSectorErase/sector_start_addr
add wave -noupdate -radix hexadecimal /Testbench/DUT/CUIDECEFI_multiSectorErase/subsector_start_addr
add wave -noupdate -radix hexadecimal /Testbench/DUT/CUIDECEFI_multiSectorErase/sector_stop_addr
add wave -noupdate -radix hexadecimal /Testbench/DUT/CUIDECEFI_multiSectorErase/subsector_stop_addr
add wave -noupdate -radix hexadecimal -childformat {{{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[31]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[30]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[29]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[28]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[27]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[26]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[25]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[24]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[23]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[22]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[21]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[20]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[19]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[18]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[17]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[16]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[15]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[14]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[13]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[12]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[11]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[10]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[9]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[8]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[7]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[6]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[5]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[4]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[3]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[2]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[1]} -radix hexadecimal} {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[0]} -radix hexadecimal}} -subitemconfig {{/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[31]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[30]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[29]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[28]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[27]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[26]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[25]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[24]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[23]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[22]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[21]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[20]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[19]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[18]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[17]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[16]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[15]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[14]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[13]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[12]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[11]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[10]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[9]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[8]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[7]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[6]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[5]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[4]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[3]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[2]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[1]} {-height 16 -radix hexadecimal} {/Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr[0]} {-height 16 -radix hexadecimal}} /Testbench/DUT/CUIDECEFI_multiSectorErase/destAddr
add wave -noupdate /Testbench/DUT/CUIDECEFI_multiSectorErase/mse_delay
add wave -noupdate /Testbench/DUT/CUIDECEFI_multiSectorErase/efiError
add wave -noupdate /Testbench/DUT/CUIDECEFI_multiSectorErase/efiErrorCheck
add wave -noupdate /Testbench/DUT/CUIDECEFI_multiSectorErase/efiNoError
add wave -noupdate /Testbench/DUT/CUIDECEFI_multiSectorErase/efiSeqRecognized
add wave -noupdate -radix ascii /Testbench/DUT/CUIDECEFI_multiSectorErase/cmdName
add wave -noupdate /Testbench/DUT/CUIDECEFI_multiSectorErase/myTemp
add wave -noupdate /Testbench/DUT/Debug/x0
add wave -noupdate /Testbench/DUT/Debug/x1
add wave -noupdate /Testbench/DUT/Debug/x2
add wave -noupdate /Testbench/DUT/Debug/x3
add wave -noupdate /Testbench/DUT/Debug/x4
add wave -noupdate /Testbench/DUT/Debug/x8
add wave -noupdate -radix unsigned /Testbench/DUT/CUIDECEFI_multiSectorErase/ss_start_4Kb_address
add wave -noupdate -radix unsigned /Testbench/DUT/CUIDECEFI_multiSectorErase/ss_stop_4Kb_address
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11361509429 ps} 0} {{Cursor 2} {2266402619756000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 480
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 3
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {11360762151 ps} {11361949062 ps}
