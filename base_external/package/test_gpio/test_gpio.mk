
##############################################################
#
# TEST_GPIO
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
TEST_GPIO_VERSION = '4d24955436861b663fad351f71545eecea49e544'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
TEST_GPIO_SITE = 'git@github.com:nasa7792/AESD_FINAL_PROJECT_TRACKING.git'
TEST_GPIO_SITE_METHOD = git
TEST_GPIO_GIT_SUBMODULES = YES

define TEST_GPIO_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/test_gpio all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define TEST_GPIO_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/test_gpio/test_gpio $(TARGET_DIR)/usr/bin/test_gpio
	$(INSTALL) -m 0755 $(@D)/test_gpio/test_gpio_start_stop.sh $(TARGET_DIR)/etc/init.d/S99test_gpio
endef

$(eval $(generic-package))