set_global_assignment -entity "wlan_pll" -library "lib_wlan_pll" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "wlan_pll" -library "lib_wlan_pll" -name IP_TOOL_VERSION "22.1"
set_global_assignment -entity "wlan_pll" -library "lib_wlan_pll" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_wlan_pll" -name SPD_FILE [file join $::quartus(sip_path) "wlan_pll.spd"]

set_global_assignment -library "lib_wlan_pll" -name MISC_FILE [file join $::quartus(sip_path) "wlan_pll_sim/wlan_pll.vo"]
