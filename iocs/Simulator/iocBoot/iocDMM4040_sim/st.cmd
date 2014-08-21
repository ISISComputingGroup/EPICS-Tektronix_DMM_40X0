#!../../bin/windows-x64/DMM4040_sim

## You may have to change DMM4040_sim to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet "IOCNAME" "$(P=$(MYPVPREFIX))DMM4040_SIM"
epicsEnvSet "IOCSTATS_DB" "$(DEVIOCSTATS)/db/iocAdminSoft.db"
epicsEnvSet "STREAM_PROTOCOL_PATH" "$(TOP)/../../DMM4040Sup"

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/DMM4040_sim.dbd"
DMM4040_sim_registerRecordDeviceDriver pdbbase

drvAsynIPPortConfigure ("PS1", "127.0.0.1:9999")

## Load record instances
dbLoadRecords("$(TOP)/../../db/devDMM4040.db","P=$(IOCNAME):, PORT=PS1")
#dbLoadRecords("$(IOCSTATS_DB)","IOC=$(IOCNAME)")

cd ${TOP}/iocBoot/${IOC}
iocInit

