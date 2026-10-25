
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################
AESD_ASSIGNMENTS_VERSION = master

AESD_ASSIGNMENTS_SITE = \
git@github.com:pkini2002/aeld-assignment-3-and-later.git

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

    $(INSTALL) -D -m 0755 \
    $(@D)/finder-app/tester.sh \
    $(TARGET_DIR)/usr/bin/tester.sh

   mkdir -p $(TARGET_DIR)/etc/finder-app/conf

    cp -r $(@D)/conf/* \
        $(TARGET_DIR)/etc/finder-app/conf/
endef

$(eval $(generic-package))
