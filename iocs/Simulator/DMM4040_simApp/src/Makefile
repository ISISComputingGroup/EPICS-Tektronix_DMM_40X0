TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = DMM4040_sim
# DMM4040_sim.dbd will be created and installed
DBD += DMM4040_sim.dbd

# DMM4040_sim.dbd will be made up from these files:
DMM4040_sim_DBD += base.dbd

# Include dbd files from all support applications:
DMM4040_sim_DBD += stream.dbd
DMM4040_sim_DBD += asyn.dbd
DMM4040_sim_DBD += drvAsynSerialPort.dbd
DMM4040_sim_DBD += drvAsynIPPort.dbd
DMM4040_sim_DBD += devIocStats.dbd

DMM4040_sim_LIBS += stream pcre
DMM4040_sim_LIBS += asyn devIocStats

# DMM4040_sim_registerRecordDeviceDriver.cpp derives from DMM4040_sim.dbd
DMM4040_sim_SRCS += DMM4040_sim_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
DMM4040_sim_SRCS_DEFAULT += DMM4040_simMain.cpp
DMM4040_sim_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#DMM4040_sim_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
DMM4040_sim_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

