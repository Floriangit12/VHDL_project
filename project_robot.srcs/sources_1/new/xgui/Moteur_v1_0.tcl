# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "Dmax_size" -parent ${Page_0}
  ipgui::add_param $IPINST -name "Vmax_size" -parent ${Page_0}
  ipgui::add_param $IPINST -name "divider_freq" -parent ${Page_0}


}

proc update_PARAM_VALUE.Dmax_size { PARAM_VALUE.Dmax_size } {
	# Procedure called to update Dmax_size when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Dmax_size { PARAM_VALUE.Dmax_size } {
	# Procedure called to validate Dmax_size
	return true
}

proc update_PARAM_VALUE.Vmax_size { PARAM_VALUE.Vmax_size } {
	# Procedure called to update Vmax_size when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Vmax_size { PARAM_VALUE.Vmax_size } {
	# Procedure called to validate Vmax_size
	return true
}

proc update_PARAM_VALUE.divider_freq { PARAM_VALUE.divider_freq } {
	# Procedure called to update divider_freq when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.divider_freq { PARAM_VALUE.divider_freq } {
	# Procedure called to validate divider_freq
	return true
}


proc update_MODELPARAM_VALUE.Vmax_size { MODELPARAM_VALUE.Vmax_size PARAM_VALUE.Vmax_size } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Vmax_size}] ${MODELPARAM_VALUE.Vmax_size}
}

proc update_MODELPARAM_VALUE.Dmax_size { MODELPARAM_VALUE.Dmax_size PARAM_VALUE.Dmax_size } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Dmax_size}] ${MODELPARAM_VALUE.Dmax_size}
}

proc update_MODELPARAM_VALUE.divider_freq { MODELPARAM_VALUE.divider_freq PARAM_VALUE.divider_freq } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.divider_freq}] ${MODELPARAM_VALUE.divider_freq}
}

