lappend auto_path "C:/lscc/diamond/3.5_x64/data/script"
package require symbol_generation

set ::bali::Para(MODNAME) eTopMultip00
set ::bali::Para(PACKAGE) {"C:/lscc/diamond/3.5_x64/cae_library/vhdl_packages/vdbs"}
set ::bali::Para(PRIMITIVEFILE) {"C:/lscc/diamond/3.5_x64/cae_library/synthesis/vhdl/machxo3l.vhd"}
set ::bali::Para(FILELIST) {"C:/lscc/Arquitectura/org/combinacional01/combin01/source/and.vhdl=work" "C:/lscc/Arquitectura/org/combinacional01/combin01/source/or.vhdl=work" "C:/lscc/Arquitectura/org/combinacional01/combin01/source/paquete_sumadorcompleto.vhdl=work" "C:/lscc/Arquitectura/org/combinacional01/combin01/source/paquete_sumadormedio.vhdl=work" "C:/lscc/Arquitectura/org/combinacional01/combin01/source/top_sumadorcompleto.vhdl=work" "C:/lscc/Arquitectura/org/combinacional01/combin01/source/top_sumadormedio.vhdl=work" "C:/lscc/Arquitectura/org/combinacional01/combin01/source/xor.vhdl=work" "C:/lscc/Arquitectura/org/combinacional01/paquete_topcombin.vhdl=work" "C:/lscc/Arquitectura/org/combinacional01/topmulticomb01.vhdl=work" }
set ::bali::Para(INCLUDEPATH) {}
puts "set parameters done"
::bali::GenerateSymbol
