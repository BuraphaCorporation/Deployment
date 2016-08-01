import json
import os

from functools import partial
from threading import Thread
from subprocess import PIPE, Popen

FILE_EXTENTIONS = ('scss', 'sass')

def get_path_info(file):
	path      = os.path.dirname(file)
	fileinfo  = os.path.splitext(file)

	filename  = ''.join([fileinfo[0].split(os.sep)[-1], fileinfo[1]])
	extension = fileinfo[1][1:]

	return {
		'path': path,
		'name':	filename,
		'ext':  extension,
	}

def get_output_path(scss_path, css_path):
	print scss_path
	print css_path
	return os.path.normpath(''.join([scss_path, os.sep, css_path]))

def get_sass_files_using_partial(path, partial_name):
	partial_name = ''.join(partial_name[1:].split('.')[:-1])
	cmd = "grep -E '@import.*{0}' * -l".format(partial_name)
	proc = Popen(cmd, shell=True, cwd=path, stdout=PIPE, stderr=PIPE)
	out, err = proc.communicate()
	if err:
		print(err)
		return

	if not out:
		return

	files = []
	out = out.decode('utf8')
	for f in out.split():
		files.append({
			"path": path,
			"name": f,
			"ext": f.split('.')[-1]})
	return files

def get_files_to_compile(file_info):
	if file_info['name'].startswith('_'):
		return get_sass_files_using_partial(file_info['path'], file_info['name'])
	return [file_info]

def builder(path):
	try:
		settings_path = os.sep.join([path, '.sassbuilder-config'])
		with open(settings_path, 'r') as f:
			content = f.read()
		return json.loads(content)
	except:
		return None

def compile(files_info, output, options):
	compiled_files = []
	for info in files_info:	
		compiled_path = os.path.join(output,
			info['name'].replace(info['ext'], 'css'))

		cmd = 'sass --update \'{s}\':\'{o}\' --stop-on-error {r} --style {l}'

		rules = ['--trace']
		if not options['cache']:
			rules.append('--no-cache')
		if options['debug']:
			rules.append('--debug-info')
		if options['line-comments']:
			rules.append('--line-comments')
		if options['line-numbers']:
			rules.append('--line-numbers')
		rules = ' '.join(rules)

		cmd = cmd.format(s=info['name'], o=compiled_path, r=rules, l=options['style'])

		proc = Popen(cmd, shell=True, cwd=info['path'], stdout=PIPE, stderr=PIPE)
		out, err = proc.communicate()
		if out:
			compiled_files.append(info['name'])

		if err:
			print(err)
			return
	if len(compiled_files) > 0:
		msg = '{f} has been compiled.'.format(f=", ".join(compiled_files))
		print msg
