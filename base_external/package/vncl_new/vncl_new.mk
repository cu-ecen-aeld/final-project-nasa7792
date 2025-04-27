
##############################################################
#
# VNCL
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
VNCL_NEW_VERSION = 2.2
VNCL_NEW_SITE = /home/nalin/Desktop/AESD_FINAL_PROJECT_TRACKING/vncl4040_sensor
VNCL_NEW_SITE_METHOD = local

define VNCL_NEW_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define VNCL_NEW_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/vncl4040_sensor $(TARGET_DIR)/usr/bin/vncl4040_sensor
	$(INSTALL) -m 0755 $(@D)/vncl_start_stop.sh $(TARGET_DIR)/etc/init.d/S97vncl.sh
endef

$(eval $(generic-package))