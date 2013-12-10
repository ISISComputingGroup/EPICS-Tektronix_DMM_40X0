TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = TekDMM4050
# TekDMM4050.dbd will be created and installed
DBD += TekDMM4050.dbd

# TekDMM4050.dbd will be made up from these files:
TekDMM4050_DBD += base.dbd

# Include dbd files from all support applications:
TekDMM4050_DBD += stream.dbd
TekDMM4050_DBD += asyn.dbd
TekDMM4050_DBD += drvAsynSerialPort.dbd
TekDMM4050_DBD += drvAsynIPPort.dbd
TekDMM4050_DBD += devIocStats.dbd

# Add all the support libraries needed by this IOC
TekDMM4050_LIBS += stream pcre
TekDMM4050_LIBS += asyn devIocStats

# TekDMM4050_registerRecordDeviceDriver.cpp derives from TekDMM4050.dbd
TekDMM4050_SRCS += TekDMM4050_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
TekDMM4050_SRCS_DEFAULT += TekDMM4050Main.cpp
TekDMM4050_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#TekDMM4050_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
TekDMM4050_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

