install: minilogd
	install -d -m755 ${DESTDIR}/etc/rc.d ${DESTDIR}/etc/conf.d ${DESTDIR}/etc/rc.d/functions.d/ ${DESTDIR}/etc/cron.hourly/
	install -D -m644 rc.conf ${DESTDIR}/etc/rc.conf
	install -m755 -t ${DESTDIR}/etc/ rc.local rc.local.shutdown rc.shutdown rc.single rc.sysinit
	install -D -m755 adjtime.cron ${DESTDIR}/etc/cron.hourly/adjtime
	install -D -m644 functions ${DESTDIR}/etc/rc.d/functions
	install -D -m755 network ${DESTDIR}/etc/rc.d/network
	install -D -m755 minilogd ${DESTDIR}/sbin/minilogd

minilogd:
	gcc ${CFLAGS} -o minilogd minilogd.c

clean:
	rm -f minilogd
