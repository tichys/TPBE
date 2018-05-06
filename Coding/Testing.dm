mob/verb
	ScatterBan()
	usr.CanMove = 1
	new/obj/senbonscatter(usr.loc)
	usr.dir = SOUTH
	sleep(9)
	usr.CanMove = 1
	usr.controlbug = 1
	var/Q = new/mob/pedals(usr.loc)
	var/W = new/mob/pedals(usr.loc)
	var/E = new/mob/pedals(usr.loc)
	var/R = new/mob/pedals(usr.loc)
	var/T = new/mob/pedals(usr.loc)
	Q:owner = usr
	var/T2 = new/mob/pedals(usr.loc)
	T2:owner = usr
	var/T3 = new/mob/pedals(usr.loc)
	T3:owner = usr
	W:owner = usr
	E:owner = usr
	R:owner = usr
	T:owner = usr
	for(var/mob/pedals/M in world)
		if(M.owner == usr)
			walk_rand(M)

mob/var
	tmp/controlbug = 0

obj
	scatterbankai2
	icon = 'byakuyashikai.dmi'
  icon_state = "bankai"
  New()
   flick("bankai",src)
   spawn(9)
    var/Q = new/mob/pedals(src.loc)
	   Q:owner = src.owner
	   Q:attack = src.attack
	   var/G = new/mob/pedals(src.loc)
	   G:owner = src.owner
	   G:attack = src.attack
	   del src