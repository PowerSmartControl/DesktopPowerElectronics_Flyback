
call xelab xil_defaultlib.apatb_digital_compensator_top -prj digital_compensator.prj --lib "ieee_proposed=./ieee_proposed" -s digital_compensator 
call xsim --noieeewarnings digital_compensator -tclbatch digital_compensator.tcl

