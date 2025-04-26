##############################################################
#
# SERVO_TEST
#
##############################################################

SERVO_TEST2_VERSION = 1.0
SERVO_TEST2_SITE = /home/nalin/Desktop/servo_test
SERVO_TEST2_SITE_METHOD = local

define SERVO_TEST2_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define SERVO_TEST2_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/servo $(TARGET_DIR)/usr/bin/servo
endef

$(eval $(generic-package))
