TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = TekDMM4040
# TekDMM4040.dbd will be created and installed
DBD += TekDMM4040.dbd

# TekDMM4040.dbd will be made up from these files:
TekDMM4040_DBD += base.dbd

# Include dbd files from all support applications:
TekDMM4040_DBD += stream.dbd
TekDMM4040_DBD += asyn.dbd
TekDMM4040_DBD += drvAsynSerialPort.dbd
TekDMM4040_DBD += drvAsynIPPort.dbd
TekDMM4040_DBD += devIocStats.dbd

# Add all the support libraries needed by this IOC
TekDMM4040_LIBS += stream pcre
TekDMM4040_LIBS += asyn devIocStats

# TekDMM4040_registerRecordDeviceDriver.cpp derives from TekDMM4040.dbd
TekDMM4040_SRCS += TekDMM4040_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
TekDMM4040_SRCS_DEFAULT += TekDMM4040Main.cpp
TekDMM4040_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#TekDMM4040_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
TekDMM4040_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

