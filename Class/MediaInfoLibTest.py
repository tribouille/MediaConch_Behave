#  Copyright (c) MediaArea.net SARL. All Rights Reserved.
#
#  Use of this source code is governed by a GPLv3+/MPLv2+ license that can
#  be found in the License.html file in the root of the source tree.
#

import subprocess

class MediaInfoLibTest:
    def __init__(self, path):
        self.__path = path
        self.out = None
        self.options = {}

    def add_option(self, field, value=None):
        self.options[field] = value

    def analyze_file(self, filename):
        args = []
        args.append(self.__path)
        for key in self.options.keys():
            if (self.options[key]):
                args.append("--%s=%s" % (key, self.options[key]))
            else:
                args.append("--%s" % key)

        args.append(filename)
        process = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=None)
        self.out = process.communicate()
        if process.returncode != 0:
            assert False

    def grep_information(self, value):
        pos = self.out[0].find(value)
        if pos == -1:
            return False
        endLine = self.out[0].find("\n", pos)
        substr = self.out[0][int(pos): int(endLine)]
        if substr.find("18446744073709551615"): #-1, to be handle correctly
            return False
        return True

    def finish(self):
        self.options = {}
        self.out = None
