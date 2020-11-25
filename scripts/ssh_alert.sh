#!/bin/sh

RECIPIENT=youremail@email.com
SUBJECT="Email from your Server: SSH Alert"


BODY="
A SSH login was successful, so here are some information for security:
  	User:        $PAM_USER
	User IP Host: $PAM_RHOST
	Service:     $PAM_SERVICE
	TTY:         $PAM_TTY
	Date:        `date`
	Server:      `uname -a`
"

if [ ${PAM_TYPE} = "open_session" ]; then
	echo "Subject:${SUBJECT} ${BODY}" | /usr/sbin/sendmail ${RECIPIENT}
fi

exit 0
