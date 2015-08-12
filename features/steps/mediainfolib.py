# Copyright (c) MediaArea.net SARL. All Rights Reserved.
#
# Use of this source code is governed by a GPLv3+/MPLv2+ license that can
# be found in the License.html file in the root of the source tree.
#

from behave import *
import os

use_step_matcher("re")

@given("I add the option (?P<field>\w+) without value")
@given("I add the option (?P<field>\w+) with value (?P<value>\w+)")
def add_option(ctx, field, value=None):
    ctx.MIPython.add_option(field, value)

@when('I open the ffv1 corpus file (?P<filename>.+) with MIL')
def open_ffv1_corpus(ctx, filename):
    full_name_file = os.path.join(ctx.corpusDir, "ffv1_test_file_corpus", filename)
    ctx.MIPython.analyze_file(full_name_file)

@then("'(?P<value>.+)' is not present")
def grep_value_not_present(ctx, value):
    if ctx.MIPython.grep_information(value):
        assert False

@then('I close the MIL file')
def close_file(ctx):
    ctx.MIPython.finish()
