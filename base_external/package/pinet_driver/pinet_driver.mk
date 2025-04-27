
##############################################################
#
# pinet_driver
#
##############################################################

PINET_DRIVER_VERSION = 3.0
PINET_DRIVER_SITE = /home/nalin/Desktop/final-project-AbhishekKoppaCU/PiNet-net-driver
PINET_DRIVER_SITE_METHOD = local


define PINET_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/buildroot_start.sh $(TARGET_DIR)/etc/init.d/S95pinet_start.sh
endef

$(eval $(generic-package))
$(eval $(kernel-module))