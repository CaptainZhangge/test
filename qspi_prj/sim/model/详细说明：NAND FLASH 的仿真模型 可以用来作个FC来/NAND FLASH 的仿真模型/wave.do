onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal /nand_flash_tb/frame_buffer
add wave -noupdate -format Literal /nand_flash_tb/data_bus
add wave -noupdate -format Logic /nand_flash_tb/cle
add wave -noupdate -format Logic /nand_flash_tb/ale
add wave -noupdate -format Logic /nand_flash_tb/ren
add wave -noupdate -format Logic /nand_flash_tb/wen
add wave -noupdate -format Logic /nand_flash_tb/wpn
add wave -noupdate -format Logic /nand_flash_tb/sen
add wave -noupdate -format Logic /nand_flash_tb/ry_byn
add wave -noupdate -format Logic /nand_flash_tb/cpld_ce
add wave -noupdate -format Literal /nand_flash_tb/port_addr
add wave -noupdate -format Logic /nand_flash_tb/outce0
add wave -noupdate -format Logic /nand_flash_tb/write
add wave -noupdate -format Logic /nand_flash_tb/read
add wave -noupdate -format Logic /nand_flash_tb/reset
add wave -noupdate -format Logic /nand_flash_tb/ready
add wave -noupdate -format Literal /nand_flash_tb/source_tmp
add wave -noupdate -format Logic /nand_flash_tb/fail_flag
add wave -noupdate -format Logic /nand_flash_tb/com_latn
add wave -noupdate -format Literal /nand_flash_tb/den_model/io
add wave -noupdate -format Logic /nand_flash_tb/den_model/cle
add wave -noupdate -format Logic /nand_flash_tb/den_model/ale
add wave -noupdate -format Logic /nand_flash_tb/den_model/cen
add wave -noupdate -format Logic /nand_flash_tb/den_model/ren
add wave -noupdate -format Logic /nand_flash_tb/den_model/wen
add wave -noupdate -format Logic /nand_flash_tb/den_model/wpn
add wave -noupdate -format Logic /nand_flash_tb/den_model/sen
add wave -noupdate -format Logic /nand_flash_tb/den_model/rdybyn
add wave -noupdate -format Logic /nand_flash_tb/cpld/write_n
add wave -noupdate -format Logic /nand_flash_tb/cpld/read_n
add wave -noupdate -format Literal /nand_flash_tb/cpld/port_addr
add wave -noupdate -format Logic /nand_flash_tb/cpld/ce_n
add wave -noupdate -format Logic /nand_flash_tb/cpld/ry_byn
add wave -noupdate -format Logic /nand_flash_tb/cpld/reset
add wave -noupdate -format Logic /nand_flash_tb/cpld/com_lat_n
add wave -noupdate -format Logic /nand_flash_tb/cpld/ready
add wave -noupdate -format Logic /nand_flash_tb/cpld/cle
add wave -noupdate -format Logic /nand_flash_tb/cpld/ale
add wave -noupdate -format Logic /nand_flash_tb/cpld/se_n
add wave -noupdate -format Logic /nand_flash_tb/cpld/wp_n
add wave -noupdate -format Logic /nand_flash_tb/cpld/outce_n
add wave -noupdate -format Logic /nand_flash_tb/cpld/we_n
add wave -noupdate -format Logic /nand_flash_tb/cpld/re_n
add wave -noupdate -format Logic /nand_flash_tb/cpld/port0
add wave -noupdate -format Logic /nand_flash_tb/cpld/port1
add wave -noupdate -format Logic /nand_flash_tb/cpld/port2
add wave -noupdate -format Logic /nand_flash_tb/cpld/port3
add wave -noupdate -format Logic /nand_flash_tb/cpld/port4
add wave -noupdate -format Logic /nand_flash_tb/cpld/port5
add wave -noupdate -format Logic /nand_flash_tb/cpld/port6
add wave -noupdate -format Logic /nand_flash_tb/cpld/port7
add wave -noupdate -format Logic /nand_flash_tb/cpld/port8
add wave -noupdate -format Logic /nand_flash_tb/cpld/port9
add wave -noupdate -format Logic /nand_flash_tb/cpld/porta
add wave -noupdate -format Logic /nand_flash_tb/cpld/portb
add wave -noupdate -format Logic /nand_flash_tb/cpld/portc
add wave -noupdate -format Logic /nand_flash_tb/cpld/portd
add wave -noupdate -format Logic /nand_flash_tb/cpld/porte
add wave -noupdate -format Logic /nand_flash_tb/cpld/portf
add wave -noupdate -format Logic /nand_flash_tb/cpld/se_n_int
add wave -noupdate -format Logic /nand_flash_tb/cpld/ale_int
add wave -noupdate -format Logic /nand_flash_tb/cpld/wp_n_int
add wave -noupdate -format Logic /nand_flash_tb/cpld/outce_n_int
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {1701847219 ps}
WaveRestoreZoom {252273947 ps} {3716189298 ps}
