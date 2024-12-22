set init_gnd_net VSS
set init_lef_file {/opt/PDKs/digital/45nm/dig/lef/gsclib045_tech.lef /opt/PDKs/digital/45nm/dig/lef/gsclib045_macro.lef} 
set init_verilog ../netlists/genus_netlist.v
set init_mmmc_file ../MMMC_files/Default.view
set init_pwr_net VDD
init_design
floorPlan -site CoreSite -r 0.971590909091 0.7 5.0 5.0 5.0 5.0
