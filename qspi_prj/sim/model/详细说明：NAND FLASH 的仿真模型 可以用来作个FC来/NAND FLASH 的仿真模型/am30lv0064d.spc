--
--=====================================================================
--   Copyright (c) 2000 by Denali Software, Inc.  All rights reserved
--=====================================================================
--
--This file contains proprietary information of Denali Software, Inc.
--SOMA(tm) is Denali Software's proprietary language for defining 
--memory models.  
--
--Subject to your agreement with the restrictions set forth below, 
--Denali Software, Inc., grants you a non-exclusive license to use
--the SOMA language in the following manner :
--
--You may:
--
--  *  Use SOMA language to create memory models.
--
--  *  Distribute memory models created using the SOMA language to 
--     others provided that this notice is not removed from the file.
--
--You may not:
--
--  *  Create software programs or tools that use the SOMA language 
--     as either input or output where the software programs are 
--     intended for distribution to others.
--
--  *  Change the SOMA language in any manner.
--
--By using the SOMA specification files, you are consenting to be 
--bound by and are becoming party to this agreement.  If you do not 
--agree to all of the terms of this agreement, you may not use the 
--SOMA specification files.
--
--If you have any questions regarding this agreement, or if you 
--would like to inquire about obtaining additional or different rights 
--in the SOMA specification files and SOMA language, please contact 
--Denali Software.
--
--************************************************************************
-- Manufacturer    : AMD
-- Memory Class    : FLASH
-- Part Name       : am30lv0064d
-- Revision        : Tue Feb 20 12:10:18 2001
-- Description     : 64Mb (8 M x 8 - Bit) CMOS 3.0 Volt-only Flash Memory with
--                   UltraNAND Technology
-- Datasheet URL   : http://www.amd.com/products/nvd/techdocs/22203.pdf
-- Datasheet Info  : Rev. C+3, October 6, 2000
-- Author Name     : Denali Software,KK
-- Author Comment  : WARNING! tcry=50ns + t(time dependent on value of pull-up
--                   resistor at RY/BYbar pin.)
--************************************************************************
Version 0.001
flash_nand

Sizes
manufacturerCode 0x01
deviceCode 0xe6
blockCount 512
pagePerBlock 16
pageSize 528
addrWidth 23

Features

Pins
data io 8
cle cle 1
ale ale 1
cebar cen 1
rebar ren 1
webar wen 1
wpbar wpn 1
sebar sen 1
rdybybar ry_byn 1

Timing
tcls 0 ns
tclh 10 ns
tcs 0 ns
tch 10 ns
twp 30 ns
tals 0 ns
talh 10 ns
tds 20 ns
tdh 10 ns
twc 50 ns
twh 15 ns
tww disabled
trr 20 ns
trp 35 ns
trc 50 ns
trea 35 ns
tceh 100 ns
treaid 35 ns
trhz 30 ns
tchz 20 ns
treh 15 ns
tir 0 ns
trsto 35 ns
tcsto 45 ns
twhr 60 ns
tar1 100 ns
tcr 100 ns
tr 7 us
twb 100 ns
tar2 50 ns
trb 100 ns
tcry 50 ns
-- see WARNING!
trst1 5 us
trst2 10 us
trst3 500 us
trst4 5 us
tprog 0.2 ms
tberase 2 ms

