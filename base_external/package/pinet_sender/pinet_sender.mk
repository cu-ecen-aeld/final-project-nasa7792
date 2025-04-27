
##############################################################
#
# pinet_sender
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
PINET_SENDER_VERSION = 'e1f701eeb34a57ecb40d020a17e82f1857dcb3d9'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
PINET_SENDER_SITE = 'git@github.com:cu-ecen-aeld/final-project-AbhishekKoppaCU.git'
PINET_SENDER_SITE_METHOD = git
PINET_SENDER_GIT_SUBMODULES = YES

define PINET_SENDER_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/socket/sender all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define PINET_SENDER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/socket/sender/pinet_sender $(TARGET_DIR)/usr/bin/pinet_sender
endef

$(eval $(generic-package))