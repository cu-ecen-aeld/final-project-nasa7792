
##############################################################
#
# pinet_receiver
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
PINET_RECEIVER_VERSION = 3.6
PINET_RECEIVER_SITE = /home/nalin/Desktop/final-project-AbhishekKoppaCU/socket/receiver
PINET_RECEIVER_SITE_METHOD = local

define PINET_RECEIVER_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define PINET_RECEIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/pinet_receiver $(TARGET_DIR)/usr/bin/pinet_receiver
endef

$(eval $(generic-package))