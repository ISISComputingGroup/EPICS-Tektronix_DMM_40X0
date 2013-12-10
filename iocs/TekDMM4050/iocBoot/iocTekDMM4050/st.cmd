#!../../bin/windows-x64/TekDMM4050

## You may have to change TekDMM4050 to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet "IOCNAME" "$(P=$(MYPVPREFIX))DMM4050"
epicsEnvSet "IOCSTATS_DB" "$(DEVIOCSTATS)/db/iocAdminSoft.db"
epicsEnvSet "STREAM_PROTOCOL_PATH" "$(TOP)/../../DMM4040Sup"
epicsEnvSet "TTY" "$(TTY=\\\\\\\\.\\\\COM19)"

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/TekDMM4050.dbd"
TekDMM4050_registerRecordDeviceDriver pdbbase

drvAsynSerialPortConfigure("L0", "$(TTY)", 0, 0, 0, 0)
asynSetOption("L0", -1, "baud", "9600")
asynSetOption("L0", -1, "bits", "8")
asynSetOption("L0", -1, "parity", "none")
asynSetOption("L0", -1, "stop", "1")

## Load record instances
dbLoadRecords("$(TOP)/../../db/devDMM4040.db","P=$(IOCNAME):, PORT=L0")
dbLoadRecords("$(IOCSTATS_DB)","IOC=$(IOCNAME)")

cd ${TOP}/iocBoot/${IOC}
iocInit

