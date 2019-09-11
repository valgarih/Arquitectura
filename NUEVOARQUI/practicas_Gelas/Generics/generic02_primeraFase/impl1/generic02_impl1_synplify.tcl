#-- Lattice Semiconductor Corporation Ltd.
#-- Synplify OEM project file

#device options
set_option -technology MACHXO2
set_option -part LCMXO2_7000HE
set_option -package TG144C
set_option -speed_grade -4

#compilation/mapping options
set_option -symbolic_fsm_compiler true
set_option -resource_sharing true

#use verilog 2001 standard option
set_option -vlog_std v2001

#map options
set_option -frequency auto
set_option -maxfan 1000
set_option -auto_constrain_io 0
set_option -disable_io_insertion false
set_option -retiming false; set_option -pipe true
set_option -force_gsr false
set_option -compiler_compatible 0
set_option -dup false
set_option -frequency 1
set_option -default_enum_encoding default

#simulation options


#timing analysis options



#automatic place and route (vendor) options
set_option -write_apr_constraint 1

#synplifyPro options
set_option -fix_gated_and_generated_clocks 1
set_option -update_models_cp 0
set_option -resolve_multiple_driver 0


#-- add_file options
add_file -vhdl {C:/lscc/diamond/3.7_x64/cae_library/synthesis/vhdl/machxo2.vhd}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/div00/osc00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/div00/enab00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/div00/div0.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/div00/packagediv00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/div00/topdiv00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/source/and00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/source/or00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/source/xor00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/source/not00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/source/nand00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/source/nor00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/source/nxor00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/source/shiftr00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/source/shiftl00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/shiftx00.vhd}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/source/rotr00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/source/rotl00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/source/add00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/source/sub00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/multicomb.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/source/comp2.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/source/comp00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/source/concat00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/combinacional01/and.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/combinacional01/or.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/combinacional01/xor.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/combinacional01/paquete_sumadorcompleto.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/combinacional01/paquete_sumadormedio.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/combinacional01/top_sumadorcompleto.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/combinacional01/top_sumadormedio.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/combinacional01/paquete_topcombin.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/combinacional01/topmulticomb01.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/source/uc00.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/source/packagegeneric01.vhdl}
add_file -vhdl -lib "work" {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/source/topgeneric01.vhdl}

#-- top module name
set_option -top_module topgeneric01

#-- set result format/file last
project -result_file {C:/Users/saiko/Documents/ESCOM/5 semestre/Arqui de Computadoras/Arquitectura/generic04/generic02/impl1/generic02_impl1.edi}

#-- error message log file
project -log_file {generic02_impl1.srf}

#-- set any command lines input by customer


#-- run Synplify with 'arrange HDL file'
project -run hdl_info_gen -fileorder
project -run
