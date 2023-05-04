set_property PACKAGE_PIN G22          [get_ports ref_clk]
set_property PACKAGE_PIN H26          [get_ports rst_n]

set_property PACKAGE_PIN B26          [get_ports clk_o    ] #C8
set_property PACKAGE_PIN C23          [get_ports ce       ]
set_property PACKAGE_PIN A25          [get_ports flash_do ]
set_property PACKAGE_PIN B24          [get_ports flash_di ]

set_property IOSTANDARD LVCMOS33      [get_ports ref_clk]
set_property IOSTANDARD LVCMOS33      [get_ports rst_n]


set_property IOSTANDARD LVCMOS33      [get_ports clk_o    ]
set_property IOSTANDARD LVCMOS33      [get_ports ce       ]
set_property IOSTANDARD LVCMOS33      [get_ports flash_do ]
set_property IOSTANDARD LVCMOS33      [get_ports flash_di ]

create_clock -period 20.000 -name clk -waveform {0.000 10.000} [get_ports ref_clk]
