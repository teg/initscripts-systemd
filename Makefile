install:
<<<<<<< HEAD
	install -m755 -t ${DESTDIR}/lib/systemd/ \
		rc.shutdown \
		rc.sysinit \
		modules-load
	install -m644 -t ${DESTDIR}/lib/systemd/system \
		poweroff.service \
		halt.service \
		reboot.service \
		sysinit.service \
		nisdomainname.service \
		modules-load.service
	(
		cd ${DESTDIR}/lib/systemd/system/sysinit.target.wants && \
		ln -s ../nisdomainname.service && \
		ln -s ../modules-load.service 
	)
