#!/usr/bin/env python
# -*- coding: utf-8 -*-

### DEPENDENCY:
#     fontTools Python library
#       ==> https://github.com/fonttools/fonttools
#       ==> Install: pip install fonttools

### USAGE:
#     python fpfix.py [filepath to font]

import sys
from fontTools import ttLib

if len(sys.argv) < 2:
    sys.stderr.write("# [Nerd Fonts] [fpfix.py] ERROR: Please enter a path to the font file")
    sys.exit(1)

try:
    tt = ttLib.TTFont(sys.argv[1])
    post = tt["post"].__dict__
    post["isFixedPitch"] = 1
    tt.save(sys.argv[1])
    print("# [Nerd Fonts] [fpfix.py]: '" + sys.argv[1] + "' fixed pitch setting was changed to 1 in the post table")
except Exception as e:
    sys.stderr.write("# [Nerd Fonts] [fpfix.py] ERROR: Unable to update the font isFixedPitch setting. " + str(e))
    sys.exit(1)


