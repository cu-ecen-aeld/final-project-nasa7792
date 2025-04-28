##############################################################
#
# SERVO_TEST
#
##############################################################

SERVO_TEST2_VERSION = 1.5
SERVO_TEST2_SITE = /home/nalin/Desktop/AESD_FINAL_PROJECT_TRACKING/motor
SERVO_TEST2_SITE_METHOD = local

define SERVO_TEST2_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define SERVO_TEST2_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/motor $(TARGET_DIR)/usr/bin/motor
endef

$(eval $(generic-package))
