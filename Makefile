SERVICES = ${wildcard *.service}
TARGETS  = ${wildcard *.target}
SCRIPTS  = arch-persistent-settings

makedirs:
	@install -vd ${DESTDIR}/lib/systemd/system/sysinit.target.wants \
	             ${DESTDIR}/lib/systemd/system/shutdown.target.wants

install: makedirs
	@install -vm755 -t ${DESTDIR}/lib/systemd/ ${SCRIPTS}
	@install -vm644 -t ${DESTDIR}/lib/systemd/system ${SERVICES} ${TARGETS}
	@( cd ${DESTDIR}/lib/systemd/system/sysinit.target.wants && \
	  ln -vsf ../nisdomainname.service && \
	  ln -vsf ../md-assemble.service && \
	  ln -vsf ../lvm-activate.service && \
	  ln -vsf ../depmod.service )
	@( cd ${DESTDIR}/lib/systemd/system/shutdown.target.wants && \
	  ln -vsf ../arch-persistent-settings.service )
