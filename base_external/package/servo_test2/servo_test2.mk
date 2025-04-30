##############################################################
#
# SERVO_TEST
#
##############################################################

SERVO_TEST2_VERSION = '53fd826a97316630daa6bffcfba91489a2086b33'
SERVO_TEST2_SITE = 'git@github.com:nasa7792/AESD_FINAL_PROJECT_TRACKING.git'
SERVO_TEST2_SITE_METHOD = git
SERVO_TEST2_GIT_SUBMODULES=YES

define SERVO_TEST2_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/motor all
endef

define SERVO_TEST2_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/motor/motor $(TARGET_DIR)/usr/bin/motor
	$(INSTALL) -m 0755 $(@D)/motor/motor-start-stop.sh $(TARGET_DIR)/etc/init.d/S98motor.sh
endef

$(eval $(generic-package))
