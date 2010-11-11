SERVICES = ${wildcard *.service}
TARGETS  = ${wildcard *.target}
SCRIPTS  = modules-load

makedirs:
	@install -vd ${DESTDIR}/lib/systemd/system/sysinit.target.wants \
	            ${DESTDIR}/lib/systemd/system

install: makedirs
	@install -vm755 -t ${DESTDIR}/lib/systemd/ ${SCRIPTS}
	@install -vm644 -t ${DESTDIR}/lib/systemd/system ${SERVICES} ${TARGETS}
	@( cd ${DESTDIR}/lib/systemd/system/sysinit.target.wants && \
	  ln -vsf ../nisdomainname.service && \
	  ln -vsf ../modules-load.service && \
	  ln -vsf ../md-assemble.service && \
	  ln -vsf ../lvm-load.service && \
	  ln -vsf ../timezone.service && \
	  ln -vsf ../depmod.service )
