
##############################################################
#
# pinet_sender
#
##############################################################


PINET_SENDER_VERSION = '6e94c6fce2f609ca478e877848731b2c4a0138a8'
PINET_SENDER_SITE = 'git@github.com:cu-ecen-aeld/final-project-AbhishekKoppaCU.git'
PINET_SENDER_SITE_METHOD = git
PINET_SENDER_GIT_SUBMODULES = YES

define PINET_SENDER_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/socket/sender all
endef

# adding sender socket startup script
define PINET_SENDER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/socket/sender/pinet_sender $(TARGET_DIR)/usr/bin/pinet_sender
	$(INSTALL) -m 0755 $(@D)/socket/sender/sender-start-stop.sh $(TARGET_DIR)/etc/init.d/S98pinet_sender.sh
	
endef

$(eval $(generic-package))