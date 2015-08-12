# Copyright (c) MediaArea.net SARL. All Rights Reserved.
#
# Use of this source code is governed by a GPLv3+/MPLv2+ license that can
# be found in the License.html file in the root of the source tree.
#

import os.path
import platform
import sys
import shutil

# Current directory
featureDir = os.path.abspath(os.path.dirname(__file__))
modulesDir = os.path.join(featureDir, "../modules")
classDir = os.path.join(featureDir, "../Class")

# Dependancies directory
#  ZenLib
zenLibDir = os.path.join(modulesDir, "ZenLib")
zenLibPath = ""
if platform.system() == "Linux":
    zenLibPath = os.path.join(zenLibDir, "Project/GNU/Library/libzen.la")
else:
    raise "OS not managed for the moment"

#  MediaInfoLib
mediaInfoLibDir = os.path.join(modulesDir, "MediaInfoLib")
mediaInfoLibPath = ""
if platform.system() == "Linux":
    mediaInfoLibPath = os.path.join(mediaInfoLibDir, "Project/GNU/Library/libmediaInfo.la")
else:
    raise "OS not managed for the moment"


# MediInfo
mediaInfoDir = os.path.join(modulesDir, "MediaInfo/")
mediaInfoCLIPath = ""

if platform.system() == "Linux":
    mediaInfoCLIPath = os.path.join(mediaInfoDir, "Project/GNU/CLI/mediainfo")
else:
    raise "OS not managed for the moment"

# MediaConch
mediaConchDir = os.path.join(modulesDir, "MediaConch")
mediaConchCSamplesDir = os.path.join(mediaConchDir, "SampleTestFiles")
mediaConchCDemoDir = os.path.join(mediaConchDir, "Demo/Files")
mediaConchCorpusDir = os.path.join(mediaConchDir, "TestFileCorpus")

# MediaConchCLI
mediaConchCLIDir = os.path.join(modulesDir, "MediaConch_SourceCode")
mediaConchCLIPath = ""
if platform.system() == "Linux":
    mediaConchCLIPath = os.path.join(mediaConchCLIDir, "Project/GNU/CLI/mediaconch")
else:
    raise "OS not managed for the moment"

if classDir not in sys.path:
    sys.path.insert(0, classDir)

from MediaInfoLibTest import MediaInfoLibTest

# Behave init

def before_all(ctx):
    ctx.zenLibPath = zenLibPath
    ctx.mediaInfoLibPath = mediaInfoLibPath
    ctx.mediaInfoCLIPath = mediaInfoCLIPath
    ctx.mediaConchCLIPath = mediaConchCLIPath
    ctx.samplesDir = mediaConchCSamplesDir
    ctx.demoDir = mediaConchCDemoDir
    ctx.corpusDir = mediaConchCorpusDir
    ctx.MIPython = MediaInfoLibTest(mediaInfoCLIPath)

def before_feature(ctx, feature):
    # Check tags here
    pass

def before_scenario(ctx, scenario):
    ctx.videoFiles = []
    ctx.policyFiles = []
    ctx.outFormat = None
    ctx.tool = None
    ctx.processRet = None
    ctx.processStdout = None
    ctx.outSplitted = None
    ctx.xmlOutput = None

def before_step(ctx, step):
    pass

def after_step(ctx, step):
    pass

def after_scenario(ctx, scenario):
    pass

def after_feature(ctx, feature):
    pass

def after_all(ctx):
    pass
