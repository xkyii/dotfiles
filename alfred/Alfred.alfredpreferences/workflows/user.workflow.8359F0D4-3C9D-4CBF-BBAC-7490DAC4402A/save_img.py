# coding: utf-8

"""Save image.

Usage:
  save_img.py [--pri] [--pub] [--qn] [--version]

Options:
  -h --help     Show this screen.
  -v --version  Show version.
  --pri         Save to [config.private_path]
  --pub         Save to [config.public_path]
  --qn          Upload to qiniu Server [config.url]
"""


from docopt import docopt
from clipboard import get_paste_img_file
from upload import upload_qiniu
import util
import os
import sys
import time
from datetime import date
import shutil


def _ensure_dir(f):
    d = os.path.dirname(f)
    if not os.path.exists(d):
        os.makedirs(d)


if __name__ == '__main__':
    if not os.path.exists(util.CONFIG_FILE):
        util.generate_config_file()

    config = util.read_config()
    if not config:
        util.notice('请先配置config.ini')
        util.open_with_editor(util.CONFIG_FILE)
        sys.exit(0)

    arguments = docopt(__doc__, version='0.1')

    img_file, need_format, format = get_paste_img_file()
    if not img_file:
        sys.exit(0)

    upload_name = "%s.%s" % (int(time.time() * 1000), format)
    upload_name = date.today().strftime("%Y.%m/%d.{0}".format(upload_name))

    # make it to clipboard
    upload_file = util.try_compress_png(img_file, format != 'gif')

    if arguments['--pri']:
        fpath = '%s/%s' % (config['private_path'], upload_name)
        _ensure_dir(fpath)
        with open(fpath, 'wb+') as f:
            shutil.copy(upload_file.name, f.name)
            # make it to clipboard
            os.system("echo '%s' | pbcopy" % "assets/img/%s" % upload_name)
            # os.system('osascript -e \'tell application "System Events" to keystroke "v" using command down\'')

    if arguments['--pub']:
        fpath = '%s/%s' % (config['public_path'], upload_name)
        _ensure_dir(fpath)
        with open(fpath, 'wb+') as f:
            shutil.copy(upload_file.name, f.name)
            # make it to clipboard
            os.system("echo '%s' | pbcopy" % "assets/img/%s" % upload_name)
            # os.system('osascript -e \'tell application "System Events" to keystroke "v" using command down\'')

    if arguments['--qn']:
        if upload_qiniu(upload_file.name, upload_name):
            url = '%s/%s' % (config['url'], upload_name)
            # make it to clipboard
            os.system("echo '%s' | pbcopy" % url)
            # os.system('osascript -e \'tell application "System Events" to keystroke "v" using command down\'')
        else:
            util.notice("上传图片到图床失败，请检查网络后重试")

    img_file.close()

