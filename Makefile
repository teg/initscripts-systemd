SERVICES   = ${wildcard *.service}
SCRIPTS    = arch-modules-load
GENERATORS = arch-daemons

makedirs:
	@install -vd ${DESTDIR}/usr/lib/systemd/system-generators \
	             ${DESTDIR}/usr/lib/systemd/system

install: makedirs
	@install -vm755 -t ${DESTDIR}/usr/lib/systemd/ ${SCRIPTS}
	@install -vm755 -t ${DESTDIR}/usr/lib/systemd/system-generators/ ${GENERATORS}
	@install -vm644 -t ${DESTDIR}/usr/lib/systemd/system ${SERVICES}
