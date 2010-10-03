install:
	install -m755 -t ${DESTDIR}/lib/systemd/ \
		rc.shutdown \
		rc.sysinit \
		modules-load \
		crypttab \
		fsck
	install -m644 -t ${DESTDIR}/lib/systemd/system \
		poweroff.service \
		halt.service \
		reboot.service \
		sysinit.service \
		nisdomainname.service \
		modules-load.service \
		md-assemble.service \
		lvm-load.service \
		fsck.target \
		crypttab.service \
		fsck.service \
		timezone.service \
		depmod.service \
		leftover.service
	(
		cd ${DESTDIR}/lib/systemd/system/sysinit.target.wants && \
		ln -s ../nisdomainname.service && \
		ln -s ../modules-load.service 
		ln -s ../md-assemble.service
		ln -s ../lvm-load.service
		ln -s ../crypttab.service
		ln -s ../fsck.service
		ln -s ../timezone.service
		ln -s ../depmod.service
		ln -s ../leftover.service
	)
	( cd ${DESTDIR}/lib/systemd/system/local-fs.target.wants && \
		ln -sf ../fsck.target )
