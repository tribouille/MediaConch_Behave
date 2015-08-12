# Copyright (c) MediaArea.net SARL. All Rights Reserved.
#
# Use of this source code is governed by a GPLv3+/MPLv2+ license that can
# be found in the License.html file in the root of the source tree.
#

Feature: Test MediaInfoLib FFV1

    Scenario Outline: Test to open a file
        Given I add the option Details with value 1
         When I open the ffv1 corpus file <File> with MIL
         Then 'Other data' is not present
         Then I close the MIL file

    Examples: FFV1 Corpus files
       | File                                                 |
       | ffv1_test_pixfmt-bgr0_coder-1_level-3.mkv            |
       | ffv1_test_pixfmt-bgr0_coder-0_level-1.mkv            |
       | ffv1_test_pixfmt-bgr0_coder-0_level-3.mkv            |
       | ffv1_test_pixfmt-bgr0_coder-1_level-1.mkv            |
       | ffv1_test_pixfmt-bgr0_coder-1_level-3.mkv            |
       | ffv1_test_pixfmt-bgra_coder-0_level-1.mkv            |
       | ffv1_test_pixfmt-bgra_coder-0_level-3.mkv            |
       | ffv1_test_pixfmt-bgra_coder-1_level-1.mkv            |
       | ffv1_test_pixfmt-bgra_coder-1_level-3.mkv            |
       | ffv1_test_pixfmt-gbrp10le_coder-1_level-1.mkv        |
       | ffv1_test_pixfmt-gbrp10le_coder-1_level-3.mkv        |
       | ffv1_test_pixfmt-gbrp12le_coder-1_level-1.mkv        |
       | ffv1_test_pixfmt-gbrp12le_coder-1_level-3.mkv        |
       | ffv1_test_pixfmt-gbrp14le_coder-1_level-1.mkv        |
       | ffv1_test_pixfmt-gbrp14le_coder-1_level-3.mkv        |
       | ffv1_test_pixfmt-gbrp9le_coder-1_level-1.mkv         |
       | ffv1_test_pixfmt-gbrp9le_coder-1_level-3.mkv         |
       | ffv1_test_pixfmt-gray16le_coder-1_level-1.mkv        |
       | ffv1_test_pixfmt-gray16le_coder-1_level-3.mkv        |
       | ffv1_test_pixfmt-gray_coder-0_level-1.mkv            |
       | ffv1_test_pixfmt-gray_coder-0_level-3.mkv            |
       | ffv1_test_pixfmt-gray_coder-1_level-1.mkv            |
       | ffv1_test_pixfmt-gray_coder-1_level-3.mkv            |
       | ffv1_test_pixfmt-yuv410p_coder-0_level-1.mkv         |
       | ffv1_test_pixfmt-yuv410p_coder-0_level-3.mkv         |
       | ffv1_test_pixfmt-yuv410p_coder-1_level-1.mkv         |
       | ffv1_test_pixfmt-yuv410p_coder-1_level-3.mkv         |
       | ffv1_test_pixfmt-yuv411p_coder-0_level-1.mkv         |
       | ffv1_test_pixfmt-yuv411p_coder-0_level-3.mkv         |
       | ffv1_test_pixfmt-yuv411p_coder-1_level-1.mkv         |
       | ffv1_test_pixfmt-yuv411p_coder-1_level-3.mkv         |
       | ffv1_test_pixfmt-yuv420p10le_coder-1_level-1.mkv     |
       | ffv1_test_pixfmt-yuv420p10le_coder-1_level-3.mkv     |
       | ffv1_test_pixfmt-yuv420p16le_coder-1_level-1.mkv     |
       | ffv1_test_pixfmt-yuv420p16le_coder-1_level-3.mkv     |
       | ffv1_test_pixfmt-yuv420p9le_coder-1_level-1.mkv      |
       | ffv1_test_pixfmt-yuv420p9le_coder-1_level-3.mkv      |
       | ffv1_test_pixfmt-yuv420p_coder-0_level-1.mkv         |
       | ffv1_test_pixfmt-yuv420p_coder-0_level-3.mkv         |
       | ffv1_test_pixfmt-yuv420p_coder-1_level-1.mkv         |
       | ffv1_test_pixfmt-yuv420p_coder-1_level-3.mkv         |
       | ffv1_test_pixfmt-yuv422p10le_coder-1_level-1_g-1.mkv |
       | ffv1_test_pixfmt-yuv422p10le_coder-1_level-1.mkv     |
       | ffv1_test_pixfmt-yuv422p10le_coder-1_level-3_g-1.mkv |
       | ffv1_test_pixfmt-yuv422p10le_coder-1_level-3.mkv     |
       | ffv1_test_pixfmt-yuv422p16le_coder-1_level-1.mkv     |
       | ffv1_test_pixfmt-yuv422p16le_coder-1_level-3.mkv     |
       | ffv1_test_pixfmt-yuv422p9le_coder-1_level-1.mkv      |
       | ffv1_test_pixfmt-yuv422p9le_coder-1_level-3.mkv      |
       | ffv1_test_pixfmt-yuv422p_coder-0_level-1_g-1.mkv     |
       | ffv1_test_pixfmt-yuv422p_coder-0_level-1.mkv         |
       | ffv1_test_pixfmt-yuv422p_coder-0_level-3_g-1.mkv     |
       | ffv1_test_pixfmt-yuv422p_coder-0_level-3.mkv         |
       | ffv1_test_pixfmt-yuv422p_coder-1_level-1_g-1.mkv     |
       | ffv1_test_pixfmt-yuv422p_coder-1_level-1.mkv         |
       | ffv1_test_pixfmt-yuv422p_coder-1_level-3_g-1.mkv     |
       | ffv1_test_pixfmt-yuv422p_coder-1_level-3.mkv         |
       | ffv1_test_pixfmt-yuv440p_coder-0_level-1.mkv         |
       | ffv1_test_pixfmt-yuv440p_coder-0_level-3.mkv         |
       | ffv1_test_pixfmt-yuv440p_coder-1_level-1.mkv         |
       | ffv1_test_pixfmt-yuv440p_coder-1_level-3.mkv         |
       | ffv1_test_pixfmt-yuv444p10le_coder-1_level-1.mkv     |
       | ffv1_test_pixfmt-yuv444p10le_coder-1_level-3.mkv     |
       | ffv1_test_pixfmt-yuv444p16le_coder-1_level-1.mkv     |
       | ffv1_test_pixfmt-yuv444p16le_coder-1_level-3.mkv     |
       | ffv1_test_pixfmt-yuv444p9le_coder-1_level-1.mkv      |
       | ffv1_test_pixfmt-yuv444p9le_coder-1_level-3.mkv      |
       | ffv1_test_pixfmt-yuv444p_coder-0_level-1.mkv         |
       | ffv1_test_pixfmt-yuv444p_coder-0_level-3.mkv         |
       | ffv1_test_pixfmt-yuv444p_coder-1_level-1.mkv         |
       | ffv1_test_pixfmt-yuv444p_coder-1_level-3.mkv         |
       | ffv1_test_pixfmt-yuva420p10le_coder-1_level-1.mkv    |
       | ffv1_test_pixfmt-yuva420p10le_coder-1_level-3.mkv    |
       | ffv1_test_pixfmt-yuva420p16le_coder-1_level-1.mkv    |
       | ffv1_test_pixfmt-yuva420p16le_coder-1_level-3.mkv    |
       | ffv1_test_pixfmt-yuva420p9le_coder-1_level-1.mkv     |
       | ffv1_test_pixfmt-yuva420p9le_coder-1_level-3.mkv     |
       | ffv1_test_pixfmt-yuva420p_coder-0_level-1.mkv        |
       | ffv1_test_pixfmt-yuva420p_coder-0_level-3.mkv        |
       | ffv1_test_pixfmt-yuva420p_coder-1_level-1.mkv        |
       | ffv1_test_pixfmt-yuva420p_coder-1_level-3.mkv        |
       | ffv1_test_pixfmt-yuva422p10le_coder-1_level-1.mkv    |
       | ffv1_test_pixfmt-yuva422p10le_coder-1_level-3.mkv    |
       | ffv1_test_pixfmt-yuva422p16le_coder-1_level-1.mkv    |
       | ffv1_test_pixfmt-yuva422p16le_coder-1_level-3.mkv    |
       | ffv1_test_pixfmt-yuva422p9le_coder-1_level-1.mkv     |
       | ffv1_test_pixfmt-yuva422p9le_coder-1_level-3.mkv     |
       | ffv1_test_pixfmt-yuva422p_coder-0_level-1.mkv        |
       | ffv1_test_pixfmt-yuva422p_coder-0_level-3.mkv        |
       | ffv1_test_pixfmt-yuva422p_coder-1_level-1.mkv        |
       | ffv1_test_pixfmt-yuva422p_coder-1_level-3.mkv        |
       | ffv1_test_pixfmt-yuva444p10le_coder-1_level-1.mkv    |
       | ffv1_test_pixfmt-yuva444p10le_coder-1_level-3.mkv    |
       | ffv1_test_pixfmt-yuva444p16le_coder-1_level-1.mkv    |
       | ffv1_test_pixfmt-yuva444p16le_coder-1_level-3.mkv    |
       | ffv1_test_pixfmt-yuva444p9le_coder-1_level-1.mkv     |
       | ffv1_test_pixfmt-yuva444p9le_coder-1_level-3.mkv     |
       | ffv1_test_pixfmt-yuva444p_coder-0_level-1.mkv        |
       | ffv1_test_pixfmt-yuva444p_coder-0_level-3.mkv        |
       | ffv1_test_pixfmt-yuva444p_coder-1_level-1.mkv        |
       | ffv1_test_pixfmt-yuva444p_coder-1_level-3.mkv        |
