
##############################################################
#
# HELLO_PACKAGE
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
HELLO_PACKAGE_VERSION = '4d24955436861b663fad351f71545eecea49e544'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
HELLO_PACKAGE_SITE = 'git@github.com:nasa7792/AESD_FINAL_PROJECT_TRACKING.git'
HELLO_PACKAGE_SITE_METHOD = git
HELLO_PACKAGE_GIT_SUBMODULES = YES

define HELLO_PACKAGE_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/hello_package all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define HELLO_PACKAGE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/hello_package/hello $(TARGET_DIR)/usr/bin/hello
endef

$(eval $(generic-package))