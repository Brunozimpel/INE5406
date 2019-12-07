onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /topo/KEY(0)
add wave -noupdate /topo/LEDG(0)
add wave -noupdate /topo/SW
add wave -noupdate /topo/HEX7
add wave -noupdate /topo/HEX6
add wave -noupdate /topo/HEX5
add wave -noupdate /topo/HEX4
add wave -noupdate /topo/HEX1
add wave -noupdate /topo/HEX0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1948 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {12250 ps} {13250 ps}
