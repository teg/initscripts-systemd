SERVICES   = ${wildcard *.service}
TARGETS    = ${wildcard *.target}
SCRIPTS    = arch-persistent-settings
GENERATORS = arch-daemons

makedirs:
	@install -vd ${DESTDIR}/lib/systemd/system-generators \
	             ${DESTDIR}/lib/systemd/system

install: makedirs
	@install -vm755 -t ${DESTDIR}/lib/systemd/ ${SCRIPTS}
	@install -vm755 -t ${DESTDIR}/lib/systemd/system-generators/ ${GENERATORS}
	@install -vm644 -t ${DESTDIR}/lib/systemd/system ${SERVICES} ${TARGETS}
