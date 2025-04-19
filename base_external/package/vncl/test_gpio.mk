
##############################################################
#
# VNCL
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
VNCL_VERSION = 'e3adb96ba37d3bd782088e4c1ef75f693b0b1c46'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
VNCL_SITE = 'git@github.com:nasa7792/AESD_FINAL_PROJECT_TRACKING.git'
VNCL_SITE_METHOD = git
VNCL_GIT_SUBMODULES = YES

define VNCL_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/vncl40404 all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define VNCL_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/vncl40404/vncl4040 $(TARGET_DIR)/usr/bin/vncl4040
endef

$(eval $(generic-package)) 
