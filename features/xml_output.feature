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
          And I register ffv1_0.mov as FFV1 video file
          And I use the XML output format
          And I use the Info tool
         When I use the CLI
         Then CLI is terminated correctly
          And the output is a valid XML
          And the generated XML contains
          | track   | field         | value  |
          | General | Count         | 308    |
          | General | StreamCount   | 1      |
          | General | FileName      | ffv1_0 |
          | General | FileExtension | mov    |
          | General | Format        | MPEG-4 |
          | Video   | Format        | FFV1   |
          | Video   | Width         | 320    |
          | Video   | Height        | 240    |
