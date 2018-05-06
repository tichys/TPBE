obj/Bankai/IceWings
	layer=FLOAT_LAYER
	pixel_y=-5
	Front
		icon='IceWingsFront.dmi'
	Back
		layer=6
		icon='IceWingsBack.dmi'
	Left
		icon='IceWingsLeft.dmi'
	Right
		icon='IceWingsRight.dmi'

	Zanpakuto_South
		icon='Zanpakuto_South.dmi'
		layer=6
	Zanpakuto_West
		icon='Zanpakuto_West.dmi'
		layer=6

	Big
		icon='1aura1.dmi'

obj/Scatter
	layer=FLOAT_LAYER
	pixel_y=-5
	Before
		icon='senbonscatter.dmi'


mob/proc/AddIceWings()
	var/xoff=-80
	for(var/i=1;i<=8;i++)	//add front & back
		xoff+=32
		var/obj/Bankai/IceWings/Front/F=new()
		F.pixel_x=xoff;F.icon_state="[i]"
		if(i<=4)	F.pixel_y+=32
		src.overlays+=F
		var/obj/Bankai/IceWings/Back/B=new()
		B.pixel_x=xoff;B.icon_state="[i]"
		if(i<=4)	B.pixel_y+=32
		src.overlays+=B
		if(i==4)	xoff=-80
	xoff=-62
	for(var/i=1;i<=5;i++)	//add left
		xoff+=32
		var/obj/Bankai/IceWings/Left/S=new()
		S.pixel_x=xoff;S.icon_state="[i]"
		if(i<=2)	S.pixel_y+=32
		src.overlays+=S
		if(i==2)	xoff=-96
	xoff=-32
	for(var/i=1;i<=5;i++)	//add right
		xoff+=32
		var/obj/Bankai/IceWings/Right/S=new()
		S.pixel_x=xoff;S.icon_state="[6-i]"
		if(i>3)	S.pixel_y+=32
		src.overlays+=S
		if(i==3)	xoff=-32



mob/proc/AddBankaiEnergy()
	var/xoff=-20
	var/obj/Bankai/IceWings/Big/A=new()
	var/obj/Bankai/IceWings/Big/B=new()
	var/obj/Bankai/IceWings/Big/C=new()
	var/obj/Bankai/IceWings/Big/D=new()
	var/obj/Bankai/IceWings/Big/E=new()
	var/obj/Bankai/IceWings/Big/F=new()
	var/obj/Bankai/IceWings/Big/G=new()
	var/obj/Bankai/IceWings/Big/H=new()
	var/obj/Bankai/IceWings/Big/I=new()
	var/obj/Bankai/IceWings/Big/J=new()
	var/obj/Bankai/IceWings/Big/K=new()
	var/obj/Bankai/IceWings/Big/L=new()
	A.pixel_x=xoff;A.pixel_y=0;A.alpha=150;A.icon_state = "0,0";src.overlays+=A
	B.pixel_x=xoff+32;B.pixel_y=0;B.alpha=150;B.icon_state = "1,0";src.overlays+=B
	C.pixel_x=xoff+64;C.pixel_y=0;C.alpha=150;C.icon_state = "2,0";src.overlays+=C
	D.pixel_x=xoff;D.pixel_y=32;D.alpha=150;D.icon_state="0,1";src.overlays+=D
	E.pixel_x=xoff+32;E.pixel_y=32;E.alpha=150;E.icon_state="1,1";src.overlays+=E
	F.pixel_x=xoff+64;F.pixel_y=32;F.alpha=150;F.icon_state="2,1";src.overlays+=F
	G.pixel_x=xoff;G.pixel_y=64;G.alpha=150;G.icon_state="0,2";src.overlays+=G
	H.pixel_x=xoff+32;H.pixel_y=64;H.alpha=150;H.icon_state="1,2";src.overlays+=H
	I.pixel_x=xoff+64;I.pixel_y=64;I.alpha=150;I.icon_state="2,2";src.overlays+=I
	J.pixel_x=xoff;J.pixel_y=96;J.alpha=150;J.icon_state="0,3";src.overlays+=J
	K.pixel_x=xoff+32;K.pixel_y=96;K.alpha=150;K.icon_state="1,3";src.overlays+=K
	L.pixel_x=xoff+64;L.pixel_y=96;L.alpha=150;L.icon_state="2,3";src.overlays+=L

/*

	0,3 1,3 2,3
	0,2 1,2 2,2
	0,1 1,1 2,1
	0,0 1,0 2,0

*/

mob/proc/RemoveIceWings()
	for(var/i=1;i<=5;i++)
		var/obj/Bankai/IceWings/Left/L=new()
		var/obj/Bankai/IceWings/Right/R=new()
		var/obj/Bankai/IceWings/Front/F=new()
		var/obj/Bankai/IceWings/Back/B=new()
		src.overlays-=L
		src.overlays-=R
		src.overlays-=F
		src.overlays-=B
		src.RefreshClothes()