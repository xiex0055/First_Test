; 8/6/2015 created by fxie
; The script is created to convert a zonehwy network for the base run to a network for the final run. 
; The only difference is limit codes for HOT-lane links (tollgrp>2). 

*del voya*.prn

int_network	= 'basezonehwy.net'
out_network	= 'finalzonehwy.net'
out_link	= 'link.dbf'
out_node	= 'node.dbf'

RUN PGM=NETWORK

FILEI NETI=@int_network@	;input base network
FILEO NETO=@out_network@	;output final network


if(li.1.tollgrp>2)	;HOT lane links with tollgrp>2
	if(li.1.amlimit=3 && li.1.pmlimit=3 && li.1.oplimit=3) amlimit=4 pmlimit=4 oplimit=4	;I-66 outside the Beltway; Beltway
	if(li.1.amlimit=3 && li.1.pmlimit=3 && li.1.oplimit=9) amlimit=4 pmlimit=4 oplimit=9	;I-66 inside the Beltway
	if(li.1.amlimit=3 && li.1.pmlimit=9 && li.1.oplimit=3) amlimit=4 pmlimit=9 oplimit=4	;I-95 NB
	if(li.1.amlimit=9 && li.1.pmlimit=3 && li.1.oplimit=3) amlimit=9 pmlimit=4 oplimit=4	;I-95 SB
endif

ENDRUN

RUN PGM=NETWORK

NETI = @out_network@

/* Write out link file */

linko= @out_link@,
  format=DBF,
  include=a(5),b(5),distance(7.2),jur(7),Screen(5),ftype(7),toll(9),tollgrp(5),
           amlane(3),amlimit(3),pmlane(3),pmlimit(3),oplane(3),oplimit(3),edgeid(10),linkid(10),Netyear(8),Shape_Leng(7.2),
           projectid(10)

/* Write out node file */

nodeo= @out_node@,
  format=DBF,
  include=n(6),x(8),y(8)

ENDRUN
