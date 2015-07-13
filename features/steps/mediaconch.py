# Copyright (c) MediaArea.net SARL. All Rights Reserved.
#
# Use of this source code is governed by a GPLv3+/MPLv2+ license that can
# be found in the License.html file in the root of the source tree.
#

from behave import *
import os
import subprocess
import xml.etree.ElementTree as ET

use_step_matcher("re")

@given('CLI is existing and working')
def mediaconch_exists(ctx):
    if not os.path.exists(ctx.mediaConchCLIPath):
        assert False, "CLI is not yet compiled"

@given('I register (?P<videoName>.+) as (?P<videoFormat>\w+) video file')
def step_register_video_file(ctx, videoName, videoFormat):
    ctx.videoFiles.append(os.path.join(ctx.samplesDir, videoFormat, videoName))

@given('I use the (?P<outFormat>\w+) output format')
def step_select_format(ctx, outFormat):
    ctx.outFormat = outFormat

@given('I use the (?P<tool>\w+) tool')
def step_select_tool(ctx, tool):
    ctx.tool = tool

@given('I register the demo file (?P<filename>.+) as video file')
def step_register_demo_file(ctx, filename):
    ctx.videoFiles.append(os.path.join(ctx.demoDir, filename))

@given(u'I use (?P<filename>.+) as a policy file')
def step_register_policy_file(ctx, filename):
    ctx.policyFiles.append(os.path.join(ctx.demoDir, filename))

@when('I use the CLI')
def step_impl(ctx):
    argument = [ ctx.mediaConchCLIPath ]
    if ctx.tool:
        argument.append("--tool=%s" % ctx.tool)
    if ctx.outFormat:
        argument.append("--format=%s" % ctx.outFormat)
    if (len(ctx.policyFiles)):
        for policy in ctx.policyFiles:
            argument.append("--policy=%s" % policy)
    for videoFile in ctx.videoFiles:
        argument.append(videoFile)

    process = subprocess.Popen(argument, stdout=subprocess.PIPE, stderr=None)
    ctx.processRet = process.wait()
    ctx.processStdout = process.communicate()

@then(u'CLI is terminated (?P<res>\w+:|correctly|badly|)')
def step_impl(ctx, res):
    if res == "correctly":
        assert ctx.processRet == 0
    elif res == "badly":
        assert ctx.processRet != 0
    else:
        assert False

@then(u'the output is a valid XML')
def step_validate_xml_output(ctx):
    try:
        ctx.xmlOutput = ET.fromstring(ctx.processStdout[0])
    except:
        assert False, "Output is not a valid XML"

@then(u'the generated XML contains')
def step_xml_contains(ctx):
    elements = {}
    for row in ctx.table:
        if not "track" in ctx.table.headings or not "field" in ctx.table.headings or not "value" in ctx.table.headings:
            assert False, "track must be set"
        check_in_xml_output(ctx.xmlOutput, row['track'], row['field'], row['value'])

@then(u'the policy (?P<policy>.+) is (?P<val>\w+:|invalid|valid|)')
def step_validate_xml_output(ctx, policy, val=None):
    if not ctx.outSplitted:
        ctx.outSplitted = ctx.processStdout[0].splitlines()
    output = ctx.outSplitted.pop(0)
    output_wanted = "%s: " % (os.path.join(ctx.demoDir, policy))
    if val == "invalid":
        output_wanted += "NOT "
        #remove error lines
        for line in ctx.outSplitted:
            if line.startswith("\t") or not len(line):
                ctx.outSplitted.remove(line)
            else:
                break

    output_wanted += "VALID"
    if not output.startswith(output_wanted):
        assert False, "%s does not validate the output XML" % policy

#HELPER
def check_in_xml_output(xml, track, field, value):
    for miFile in xml.findall("File"):
        for miTrack in miFile.findall("track"):
            if not miTrack.attrib['type'] == track:
                continue
            if not miTrack.find(field).text == value:
                assert False, "in track %s: field:%s is not equal to %s" % (track, field, value)
