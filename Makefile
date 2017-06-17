# vim: ts=8 ts=8

XML	=howto.xml

PDF	=${XML:.xml=.pdf}
HTML	=${XML:.xml=.html}
TXT	=${XML:.xml=.txt}

XMLTO	=xmlto
XMLTOARGS=

%.html:	%.xml
	${XMLTO} ${XMLTOARGS} html-nochunks $^

%.pdf:	%.xml
	${XMLTO} ${XMLTOARGS} pdf $^

%.txt:	%.xml
	${XMLTO} ${XMLTOARGS} txt $^

.PHONY:	all html pdf text txt clean distclean clobber view

all::	${HTML} ${PDF} ${TXT}

html::	${HTML}
pdf::	${PDF}
text txt::	${TXT}

clean::

distclean clobber:: clean
	${RM} ${HTML} ${PDF} ${TXT}

view::	${HTML}
	htmlview ${HTML} &
