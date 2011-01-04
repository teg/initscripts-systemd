SERVICES = ${wildcard *.service}
TARGETS  = ${wildcard *.target}
SCRIPTS  = arch-persistent-settings

makedirs:
	@install -vd ${DESTDIR}/lib/systemd/system

install: makedirs
	@install -vm755 -t ${DESTDIR}/lib/systemd/ ${SCRIPTS}
	@install -vm644 -t ${DESTDIR}/lib/systemd/system ${SERVICES} ${TARGETS}
