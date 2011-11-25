#ASE setttings
set args $SECUR $CONFIG -p 43041
set substitute-path /mnts/buildarea4/release/AlgoCxx-4.7.0 /mnts/buildarea13/ase/rayc/src/AlgoCxx-4_7_0
#dir $SOURCE/ASE-4.7.0

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
