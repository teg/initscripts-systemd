SERVICES   = ${wildcard *.service}
SCRIPTS    = arch-modules-load
GENERATORS = arch-daemons

makedirs:
	@install -vd ${DESTDIR}/usr/lib/systemd/system-generators \
	             ${DESTDIR}/usr/lib/systemd/system/{multi-user,shutdown}.target.wants

install: makedirs
	@install -vm755 -t ${DESTDIR}/usr/lib/systemd/ ${SCRIPTS}
	@install -vm755 -t ${DESTDIR}/usr/lib/systemd/system-generators/ ${GENERATORS}
	@install -vm644 -t ${DESTDIR}/usr/lib/systemd/system ${SERVICES}
	ln -s ../rc-local.service ${DESTDIR}/usr/lib/systemd/system/multi-user.target.wants/
	ln -s ../rc-local-shutdown.service ${DESTDIR}/usr/lib/systemd/system/shutdown.target.wants/
