
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name DoomsdayClock -dir "X:/My Documents/Digital Logic Labs/DoomsdayClock/planAhead_run_1" -part xc6slx16csg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "vga_display_clock.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {seven_alternate.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {binary_to_7LED_DEC.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../Lab5/vga_controller_640_60.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {SevenSeg_Display_Out.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {NumDrawer.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {vga_display_clock.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top vga_display_clock $srcset
add_files [list {vga_display_clock.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx16csg324-3
