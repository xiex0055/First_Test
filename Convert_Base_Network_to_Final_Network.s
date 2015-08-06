; 8/6/2015 created by fxie
; The script is created to convert a zonehwy network for the base run to a network for the final run. 
; The only difference is limit codes for HOT-lane links (tollgrp>2). 

*del voya*.prn



RUN PGM=HIGHTWAY

FILEI NETI=basezonehwy.net	;input base network
FILEO NETO=finalzonehwy.net	;output final network


if(li.tollgrp>2)	;HOT lane links with tollgrp>2
	if(li.amlimit=3 && li.pmlimit=3 && li.oplimit=3) amlimit=4 pmlimit=4 oplimit=4	;I-66 outside the Beltway; Beltway
	if(li.amlimit=3 && li.pmlimit=3 && li.oplimit=9) amlimit=4 pmlimit=4 oplimit=9	;I-66 inside the Beltway
	if(li.amlimit=3 && li.pmlimit=9 && li.oplimit=3) amlimit=4 pmlimit=9 oplimit=4	;I-95 NB
	if(li.amlimit=9 && li.pmlimit=3 && li.oplimit=3) amlimit=9 pmlimit=4 oplimit=4	;I-95 SB
endif

ENDRUN

