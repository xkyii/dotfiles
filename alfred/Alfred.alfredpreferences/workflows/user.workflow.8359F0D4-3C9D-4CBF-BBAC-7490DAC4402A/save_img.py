# coding: utf-8

"""Save image.

Usage:
  save_img.py [--save] [--upload] [--version]

Options:
  -h --help     Show this screen.
  -v --version  Show version.
  -s --save     Save as local file.
  -u --upload   Upload to Qiniu server.
"""


from docopt import docopt
from clipboard import get_paste_img_file
from upload import upload_qiniu
import util
import os
import subprocess
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

    # make it to clipboard
    upload_file = util.try_compress_png(img_file, format != 'gif')

    if arguments['--save']:
        fname = date.today().strftime("{0}/%Y%m%d/{1}".format(config['local'], upload_name))
        _ensure_dir(fname)
        with open(fname, 'wb+') as f:
            shutil.copy(upload_file.name, f.name)

    if arguments['--upload']:
        if upload_qiniu(upload_file.name, upload_name):
            url = '%s/%s' % (config['url'], config['prefix'])
            if need_format:
                size_str = subprocess.check_output('sips -g pixelWidth %s | tail -n1 | cut -d" " -f4' % img_file.name, shell=True)
                size = int(size_str.strip()) / 2
                markdown_url = '<img src="%s/%s" width="%d"/>' % (url, upload_name, size)
            else:
                markdown_url = '%s/%s' % (url, upload_name)

            # make it to clipboard
            os.system("echo '%s' | pbcopy" % markdown_url)
            os.system('osascript -e \'tell application "System Events" to keystroke "v" using command down\'')
        else:
            util.notice("上传图片到图床失败，请检查网络后重试")
