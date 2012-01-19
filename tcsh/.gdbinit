#ASE setttings
set args $SECUR $CONFIG -p 43041
#dir $SOURCE/ASE-4.7.0

# debug AlgoCxx and GenLib
set substitute-path /mnts/buildarea4/release/AlgoCxx-4.7.0/obj/rhel-x86_64-5.2-gcc-4.3.3-debug /mnts/buildarea13/ase/rayc/src/algocxx470/obj/rhel-x86_64-5.2
set substitute-path /mnts/buildarea4/release/GenLib-4.7.0/obj/rhel-x86_64-5.2-gcc-4.3.3-gl-mt-debug-noopt /mnts/buildarea13/ase/rayc/src/genlib470/obj/rhel-x86_64-5.2

#
# python pretty printer for stl
#
python
import sys
sys.path.insert(0, '/mnts/buildarea13/ase/rayc/app/opt/gdb/printers/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end

#
# C++ related beautifiers (optional)
#

set print pretty on
set print object on
set print static-members on
set print vtbl on
set print demangle on
set demangle-style gnu-v3
set print sevenbit-strings off
