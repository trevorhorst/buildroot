#############################################################
#
# CONTROLSOFTWARE
#
#############################################################

CONTROLSOFTWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_CONTROLSOFTWARE_VERSION))
CONTROLSOFTWARE_PROJECT = control

ifeq ($(BR2_PACKAGE_CONTROLSOFTWARE_CUSTOM_LOCAL),y)
# Handler for the local package option
CONTROLSOFTWARE_SITE = $(call qstrip,$(BR2_PACKAGE_CONTROLSOFTWARE_CUSTOM_LOCAL_LOCATION))
CONTROLSOFTWARE_SITE_METHOD = local
else
# Handler for the git option
CONTROLSOFTWARE_SITE = https://github.com/trevorhorst/ControlSoftware/archive
CONTROLSOFTWARE_SOURCE = $(CONTROLSOFTWARE_VERSION).tar.gz
CONTROLSOFTWARE_SITE_METHOD = git 
endif

CONTROLSOFTWARE_DEPENDENCIES = readline libmicrohttpd libcurl

# Some hooks that we may want to use in the future
# define CONTROLSOFTWARE_CONFIGURE_CMDS
# endef
# define CONTROLSOFTWARE_BUILD_CMDS
# endef

define CONTROLSOFTWARE_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/local/bin
    echo "Moving daemon to the images directory"
    # cp -a $(@D)/app/$(CONTROLSOFTWARE_PROJECT)d $(TARGET_DIR)/../images/
    cp -a $(@D)/app/$(CONTROLSOFTWARE_PROJECT)d $(TARGET_DIR)/usr/local/bin
endef

$(eval $(cmake-package))
