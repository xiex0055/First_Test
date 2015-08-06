
*del voya*.prn



RUN PGM=HIGHTWAY

FILEI NETI=basezonehwy.net
FILEO NETO=finalzonehwy.net


if(li.tollgrp>2)
	if(li.amlimit=3 && li.pmlimit=3 && li.oplimit=3) amlimit=4 pmlimit=4 oplimit=4
	if(li.amlimit=3 && li.pmlimit=3 && li.oplimit=9) amlimit=4 pmlimit=4 oplimit=9
	if(li.amlimit=3 && li.pmlimit=9 && li.oplimit=3) amlimit=4 pmlimit=9 oplimit=4
	if(li.amlimit=9 && li.pmlimit=3 && li.oplimit=3) amlimit=9 pmlimit=4 oplimit=4	
endif

ENDRUN

