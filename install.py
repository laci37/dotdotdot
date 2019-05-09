#!/usr/bin/python3
import os
import shutil
import yaml

dotfiledir = os.path.dirname(os.path.realpath(__file__))
with open(os.path.join(dotfiledir, 'install.yml')) as inf:
    conf = yaml.load(inf)
backupdir = conf.get('backupdir') or os.path.join(dotfiledir, 'backup')
if not os.path.exists(backupdir):
    os.mkdir(backupdir)

for file_from, file_to in conf['link'].items():
    file_to = file_to.replace("~", os.environ['HOME'])
    if os.path.exists(file_to):
        fn = file_to.replace('/', '-')
        shutil.move(file_to, os.path.join(backupdir, fn))
    if not os.path.exists(os.path.dirname(file_to)):
        os.makedirs(os.path.dirname(file_to))
    os.symlink(os.path.join(dotfiledir, file_from), file_to)

