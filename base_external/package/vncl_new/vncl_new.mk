
##############################################################
#
# VNCL
#
##############################################################


VNCL_NEW_VERSION = '787821e737c53018223bf84896495074c68c057f'
VNCL_NEW_SITE = 'git@github.com:nasa7792/AESD_FINAL_PROJECT_TRACKING.git'
VNCL_NEW_SITE_METHOD = git
VNCL_NEW_GIT_SUBMODULES=YES

define VNCL_NEW_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/vncl4040_sensor all
endef

define VNCL_NEW_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/vncl4040_sensor/vncl4040_sensor $(TARGET_DIR)/usr/bin/vncl4040_sensor
	$(INSTALL) -m 0755 $(@D)/vncl4040_sensor/vncl_start_stop.sh $(TARGET_DIR)/etc/init.d/S97vncl.sh
endef

$(eval $(generic-package))