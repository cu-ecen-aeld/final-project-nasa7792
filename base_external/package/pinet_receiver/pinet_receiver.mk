
##############################################################
#
# pinet_receiver
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
PINET_RECEIVER_VERSION = '3531018b67fd94ce528b3af5ebd44be782690906'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
PINET_RECEIVER_SITE = 'git@github.com:cu-ecen-aeld/final-project-AbhishekKoppaCU.git'
PINET_RECEIVER_SITE_METHOD = git
PINET_RECEIVER_GIT_SUBMODULES = YES

define PINET_RECEIVER_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/socket/receiver all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define PINET_RECEIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/socket/receiver/pinet_receiver $(TARGET_DIR)/usr/bin/pinet_receiver
endef

$(eval $(generic-package))