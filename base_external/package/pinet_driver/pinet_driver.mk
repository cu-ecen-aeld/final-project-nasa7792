
##############################################################
#
# pinet_driver
#
##############################################################

PINET_DRIVER_VERSION = '97f3d51f25840f2741179806a36f3076f04a8f1f'
PINET_DRIVER_SITE = 'git@github.com:cu-ecen-aeld/final-project-AbhishekKoppaCU.git'
PINET_DRIVER_SITE_METHOD = git
PINET_DRIVER_GIT_SUBMODULES = YES
PINET_DRIVER_MODULE_SUBDIRS=PiNet-net-driver

define PINET_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/PiNet-net-driver/buildroot_start.sh $(TARGET_DIR)/etc/init.d/S95pinet_start.sh
endef

$(eval $(generic-package))
$(eval $(kernel-module))