install:
	install -dm755 -t ${DESTDIR}/lib/systemd/ \
		rc.shutdown \
		modules-load \
		crypttab \
		fsck
	install -dm644 -t ${DESTDIR}/lib/systemd/system \
		poweroff.service \
		halt.service \
		reboot.service \
		nisdomainname.service \
		modules-load.service \
		md-assemble.service \
		lvm-load.service \
		fsck.target \
		crypttab.service \
		fsck.service \
		timezone.service \
		depmod.service \
		leftover.service \
		sysinit.target
	mkdir -p ${DESTDIR}/lib/systemd/system/sysinit.target.wants
	(
		cd ${DESTDIR}/lib/systemd/system/sysinit.target.wants && \
		ln -s ../nisdomainname.service && \
		ln -s ../modules-load.service && \
		ln -s ../md-assemble.service && \
		ln -s ../lvm-load.service && \
		ln -s ../crypttab.service && \
		ln -s ../fsck.service && \
		ln -s ../timezone.service && \
		ln -s ../depmod.service && \
		ln -s ../leftover.service
	)
	mkdir -p ${DESTDIR}/lib/systemd/system/local-fs.target.wants
	( cd ${DESTDIR}/lib/systemd/system/local-fs.target.wants && \
		ln -sf ../fsck.target )
