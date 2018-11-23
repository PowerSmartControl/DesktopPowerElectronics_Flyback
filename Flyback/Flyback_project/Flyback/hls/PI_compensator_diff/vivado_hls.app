<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="com.autoesl.autopilot.project" name="PI_compensator_diff" top="PI_compensator_DiffEq">
  <files>
    <file name="../../PI_compensator_tb.c" sc="0" tb="1" cflags=" -DDBG_MODE"/>
    <file name="PI_compensator_diff/PI_compensator_DiffEq.c" sc="0" tb="false" cflags="-DDBG_MODE"/>
  </files>
  <solutions>
    <solution name="sysgen_test" status="inactive"/>
    <solution name="dbg_mode" status="active"/>
    <solution name="external_ref" status="inactive"/>
  </solutions>
  <includePaths/>
  <libraryPaths/>
  <Simulation>
    <SimFlow name="csim" csimMode="2" lastCsimMode="2"/>
  </Simulation>
</project>
