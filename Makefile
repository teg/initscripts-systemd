SERVICES = ${wildcard *.service}
TARGETS  = ${wildcard *.target}
SCRIPTS  = modules-load crypttab

makedirs:
	@install -vd ${DESTDIR}/lib/systemd/system/sysinit.target.wants \
	            ${DESTDIR}/lib/systemd/system

install: makedirs
	@install -vm755 -t ${DESTDIR}/lib/systemd/ ${SCRIPTS}
	@install -vm644 -t ${DESTDIR}/lib/systemd/system ${SERVICES} ${TARGETS}
	@( cd ${DESTDIR}/lib/systemd/system/sysinit.target.wants && \
	  ln -vs ../nisdomainname.service && \
	  ln -vs ../modules-load.service && \
	  ln -vs ../md-assemble.service && \
	  ln -vs ../lvm-load.service && \
	  ln -vs ../crypttab.service && \
	  ln -vs ../timezone.service && \
	  ln -vs ../depmod.service )
