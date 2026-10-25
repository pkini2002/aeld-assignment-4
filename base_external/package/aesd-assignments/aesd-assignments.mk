
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################
AESD_ASSIGNMENTS_VERSION = 0be923d7623e2b31d17140c1020d4b227865f460

AESD_ASSIGNMENTS_SITE = \
https://github.com/pkini2002/aeld-assignment-3-and-later.git

AESD_ASSIGNMENTS_SITE_METHOD = git

define AESD_ASSIGNMENTS_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" \
        -C $(@D)/finder-app all
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS

    $(INSTALL) -D -m 0755 \
    $(@D)/finder-app/writer \
    $(TARGET_DIR)/usr/bin/writer

    $(INSTALL) -D -m 0755 \
    $(@D)/finder-app/finder.sh \
    $(TARGET_DIR)/usr/bin/finder.sh

    $(INSTALL) -D -m 0755 \
    $(@D)/finder-app/finder-test.sh \
    $(TARGET_DIR)/usr/bin/finder-test.sh

    mkdir -p $(TARGET_DIR)/etc/finder-app/conf

    cp -r $(@D)/finder-app/conf/* \
        $(TARGET_DIR)/etc/finder-app/conf/
endef

$(eval $(generic-package))
