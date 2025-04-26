
##############################################################
#
# pinet_driver
#
##############################################################

PINET_DRIVER_VERSION = 1.0
PINET_DRIVER_SITE = /home/nalin/Desktop/final-project-AbhishekKoppaCU/PiNet-net-driver
PINET_DRIVER_SITE_METHOD = local


define PINET_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/start_pinet.sh $(TARGET_DIR)/etc/init.d/S97pinet_start
endef

$(eval $(generic-package))
$(eval $(kernel-module))