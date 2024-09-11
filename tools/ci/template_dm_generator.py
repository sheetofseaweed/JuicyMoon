#!/usr/bin/env python

import os
import sys

folders = ["_maps/_mod_juicy/RandomRuins", "_maps/_mod_juicy/RandomZLevels", "_maps/_mod_juicy/shuttles",
           "_maps/_mod_juicy/templates"]

generated = "_maps/_mod_juicy/templates.dm"

template_filenames = []

def find_dm(path):
    L = []
    for dirpath, dirnames, filenames in os.walk(path):
        for name in filenames:
            if name.endswith(".dmm"):
                s = os.path.join(dirpath, name)
                s = s.replace("_maps/_mod_juicy/","")
                L.append(s)
    return L

for folder in folders:
    template_filenames.extend(find_dm(folder))

with open(generated, 'w') as f:
    for template in template_filenames:
        f.write('''#include "{}"\n'''.format(template))

