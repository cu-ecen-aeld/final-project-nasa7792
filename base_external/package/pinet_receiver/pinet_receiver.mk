
##############################################################
#
# pinet_receiver
#
##############################################################


PINET_RECEIVER_VERSION = '97f3d51f25840f2741179806a36f3076f04a8f1f'
PINET_RECEIVER_SITE = 'git@github.com:cu-ecen-aeld/final-project-AbhishekKoppaCU.git'
PINET_RECEIVER_SITE_METHOD = git
PINET_RECEIVER_GIT_SUBMODULES = YES

define PINET_RECEIVER_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/socket/receiver all
endef

# adding start script for reciever socket and binaries
define PINET_RECEIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/socket/receiver/pinet_receiver $(TARGET_DIR)/usr/bin/pinet_receiver
	$(INSTALL) -m 0755 $(@D)/socket/receiver/receiver-start-stop.sh $(TARGET_DIR)/etc/init.d/S97pinet_receiever.sh
endef

$(eval $(generic-package))