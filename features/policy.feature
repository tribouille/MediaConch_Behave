# Copyright (c) MediaArea.net SARL. All Rights Reserved.
#
# Use of this source code is governed by a GPLv3+/MPLv2+ license that can
# be found in the License.html file in the root of the source tree.
#

Feature: Test MediaConch XML asked

    Scenario: Test if MediaConch CLI exist
        Given CLI is existing and working

    Scenario: Test default option
        Given CLI is existing and working
          And I register the demo file Text0.mkv as video file
          And I use the XML output format
          And I use the Info tool
          And I use Test0.sch as a policy file
          And I use Test0.xml as a policy file
         When I use the CLI
         Then CLI is terminated correctly
          And the policy Test0.sch is valid
          And the policy Test0.xml is invalid
          And the policy Test0.sch is valid
          And the policy Test0.xml is invalid
