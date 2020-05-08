#
# nInvaders
# basic building rules
#

NINVADERS_VERSION = 0.1.1
NINVADERS_SOURCE = ninvaders-$(NINVADERS_VERSION).tar.gz
NINVADERS_SITE = http://downloads.sourceforge.net/project/ninvaders/ninvaders/0.1.1
NINVADERS_INSTALL_STAGING = YES
NINVADERS_DEPENDENCIES = ncurses


define NINVADERS_BUILD_CMDS
    $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define NINVADERS_INSTALL_TARGET_CMDS
    $(INSTALL) -m 0755 -D $(@D)/nInvaders $(TARGET_DIR)/bin/ninvaders
endef

$(eval $(generic-package))





#define NINVADERS_INSTALL_STAGING_CMDS
#    $(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D)
#    $(TARGET_DIR)/bin/nInvaders
#endef


#define NINVADERS_BUILD_CMDS
#    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
#endef

#define NINVADERS_INSTALL_STAGING_CMDS
#    $(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
#endef


#endef


