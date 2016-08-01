#!/usr/bin/env python

import sys
import os
import re
import subprocess as sub
from threading import Thread

import SassBuilder

FILE_EXTENTIONS = ('scss', 'sass')

def runProcess(exe):
    p = sub.Popen(exe, stdout=sub.PIPE, stderr=sub.PIPE)
    output, errors = p.communicate()
    return output

head = runProcess(['git', 'symbolic-ref', 'HEAD']).strip()

root_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
scss_dir = os.path.join(root_dir, "sass")

for file in os.listdir(scss_dir):
    if re.match(r".*\.(scss|sass)$", file):
        info = SassBuilder.get_path_info(os.path.join(scss_dir, file))
        settings = SassBuilder.builder(info['path'])
        if info['ext'] in FILE_EXTENTIONS and settings:
            files_to_compile = SassBuilder.get_files_to_compile(info)
            if files_to_compile is not None:
                #print files_to_compile
                t = Thread(target=SassBuilder.compile, args=(files_to_compile, settings['output_path'], settings['options']))
	        t.start()

#print "Sass - Complete"
