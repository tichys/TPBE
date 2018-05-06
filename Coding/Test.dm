
skilltree
	var/list/layout=list(

	//this is the way I'd imagined it easiest to do a skill tree -- graphically made, and easy to see.

	//screen size; 11x11
list(,,,,,,,,,,,,,,,,,,,),
list(,,,,,,,,,,,,,,,,,,,),
list(,,,,,,,,,,,,,,,,,,,),
list(,,,,,,,,,,,,,,,,,,,),
list(,,,,,,,,,,,,,,,,,,,), //y1-11
list(,,,,,,,,,,,,,,,,,,,),
list(,,,,,,,,,,,,,,,,,,,),
list(,,,,,,,,,,,,,,,,,,,),
list(,,,,,,,,,,,,,,,,,,,),  //mad it 20x20
list(,,,,,,,,,,,,,,,,,,,),
list(,,,,,,,,,,,,,,,,,,,),
list(,,,,,,,,,,,,,,,,,,,),
list(,,,,,,,,,,,,,,,,,,,),
list(,,,,,,,,,,,,,,,,,,,),
list(,,,,,,,,,,,,,,,,,,,),
list(,,,,,,,,,,,,,,,,,,,),
list(,,,,,,,,,,,,,,,,,,,),
list(,,,,,,,,,,,,,,,,,,,),
list(,,,,,,,,,,,,,,,,,,,),
list(,,,,,,,,,,,,,,,,,,,)
		//x1-11
)

#define EARW  /skill/arrow(loc=CURRENT_SCHEME,dir=EAST)
#define WARW  /skill/arrow(loc=CURRENT_SCHEME,dir=WEST)
#define NARW  /skill/arrow(loc=CURRENT_SCHEME,dir=NORTH)
#define SARW  /skill/arrow(loc=CURRENT_SCHEME,dir=SOUTH)
#define NEARW /skill/arrow(loc=CURRENT_SCHEME,dir=NORTHEAST)
#define SEARW /skill/arrow(loc=CURRENT_SCHEME,dir=SOUTHEAST)
#define NWARW /skill/arrow(loc=CURRENT_SCHEME,dir=NORTHWEST)
#define SWARW /skill/arrow(loc=CURRENT_SCHEME,dir=SOUTHWEST)

//this is a really nice way of organizing data, it saves a lot of typing, and, since each is used twice
//it saves a fair amount of retyping, too.

//#define BOLT    /skill/magician/bolt
//#define ASSLT   /skill/magician/assault
//#define PSNTH   /skill/magician/poisontouch
//#define QUAKE   /skill/magician/quake
#define Dge   /obj/Skills/Universal/Dodge

//#define FSHLD   /skill/magician/fireshield
//#define ISHLD   /skill/magician/watershield
//#define WSHLD   /skill/magician/windshield
//#define ESHLD   /skill/magician/earthshield
//#define MSHLD   /skill/magician/magicshield

//here is a sample tree using the above skills
//it comes up in reverse of what you would think -- the SHLD skills appear at the top

	Soul_Reaper
		layout=list(
list( , ,Dge , , ,,,,,,,,,,,,,,,),
list( , , , , ,,,,,,,,,,,,,,,),
//list(BOLT , ,ASSLT , , ,,,,,,,,,,,,,,,),
list( , , , , ,,,,,,,,,,,,,,,),
//list( , ,PSNTH, ,QUAKE,,,,,,,,,,,,,,,),



//list(     ,     ,NBOLT,     ,     ,,,,,,),
//list(     ,     ,     ,     ,     ,,,,,,),
//list(BOLT ,     ,ASSLT,     ,     ,,,,,,),
//list(     ,     ,     ,     ,     ,,,,,,),
//list(     ,     ,PSNTH,     ,QUAKE,,,,,,),
//list(     ,     ,     ,     ,     ,,,,,,,,,,,,,,,),
//list(     ,     ,     ,     ,     ,,,,,,,,,,,,,,,),
//list(     ,     ,FSHLD,     ,ISHLD,,,,,,,,,,,,,,,),
//list(MSHLD,     ,     ,     ,     ,,,,,,,,,,,,,,,),
//list(     ,     ,ESHLD,     ,WSHLD,,,,,,,,,,,,,,,),
//list(     ,     ,     ,     ,     ,,,,,,,,,,,,,,,)

)
/*
#define STRK     /skill/runeknight/strike
#define WSTRK    /skill/runeknight/waterstrike
#define FSTRK    /skill/runeknight/firestrike
#define SSTRK    /skill/runeknight/swiftstrike
#define JAB      /skill/runeknight/jab
#define THROWN    /skill/runeknight/thrown
#define FTHRW    /skill/runeknight/firethrow

#define WIMBU    /skill/runeknight/windimbue
#define IIMBU    /skill/runeknight/waterimbue
#define FIMBU    /skill/runeknight/fireimbue
#define EIMBU    /skill/runeknight/earthimbue
#define MIMBU    /skill/runeknight/magicimbue



	runeknight
		layout=list(
list(     ,     ,     ,     ,     ,     ,     ,     ,     ,,,,,,,,,,,),
list(     ,     ,     ,     ,     ,     ,     ,     ,     ,,,,,,,,,,,),
list(MIMBU,     ,FIMBU,     ,IIMBU,     ,WIMBU,     ,EIMBU,,,,,,,,,,,),
list(     ,     ,     ,     ,     ,     ,     ,     ,     ,,,,,,,,,,,),
list(     ,     ,     ,     ,     ,     ,     ,     ,     ,,,,,,,,,,,),
list(     ,     ,     ,     ,     ,     ,     ,     ,     ,,,,,,,,,,,),
list(     ,     ,JAB  ,     ,     ,     ,     ,     ,     ,,,,,,,,,,,),
list(     ,     ,     ,     ,     ,     ,     ,     ,     ,,,,,,,,,,,),
list(STRK ,     ,THROWN,     ,FTHRW,     ,     ,     ,     ,,,,,,,,,,,),
list(     ,     ,     ,     ,     ,     ,     ,     ,     ,,,,,,,,,,,),
list(     ,     ,FSTRK,     ,WSTRK,     ,     ,     ,     ,,,,,,,,,,,)

)
*/
skill
	Click()
		if(usr.SkillPoints<=0)
			usr << "You have no skill points to spend."
			return
		if(usr.busy)return
		usr.busy=TRUE

		if(reqskill)

			if(!(src in usr.Skills))

				if(!(locate(reqskill) in usr.Skills))

					var/skill/req=new reqskill
					usr << "You must first get \"[req]\"[reqskilllvl>1 ? " to the level [reqskilllvl]" : ""]."
					del req
					usr.busy=FALSE
					return
				else

					var/tskill=locate(reqskill) in usr.Skills
					if(tskill && usr.Skills[tskill]<reqskilllvl)

						var/skill/req=new reqskill
						usr << "You must first get \"[req]\"[reqskilllvl>1 ? " to the level [reqskilllvl]" : ""]."
						del req
						usr.busy=FALSE
						return

		if(!(locate(type) in usr.Skills))
					//just checkin'
			if(alert(usr,"Are you sure you want to buy [src]?","[src]","Yes","No")=="Yes")
				usr.Skills += src
				usr.Skills[src]=1
				usr.SkillPoints-=skillcost
				usr.client.load_tree(usr.Class)
				usr << "You learned [src]!"
		else
					//verification of the skills existance
			var/skill/x=locate(type) in usr.Skills
			if(!x)usr << "Odd issue here.."
			if(usr.Skills[x]>=x.maxlevel)
				usr << "[src] is currently at level [maxlevel], the maximum level."
				usr.busy=FALSE
				return

			if(alert(usr,"Are you sure you want to raise [src]'s level to [curlevel+1]?","[src]","Yes","No")=="Yes")

				usr.Skills[x]++
				usr.SkillPoints-=skillcost
				usr.client.load_tree(usr.Class)
					//reload the tree afterwards, so you can visually see the changes
		usr.busy=FALSE

	icon='2Full.dmi'

	New(newloc)
		if(istext(newloc))
			screen_loc = newloc
					//thanks again to lummox

	available/icon_state="available"
					//blue
	unbuyable/icon_state="unbuyable"
					//red
	completed/icon_state="completed"
					//green
	arrow
		icon_state="arrow"
		New(loc,dir)
			dir=dir

	parent_type=/obj

	var
		curlevel   =0
		maxlevel   =5
		reqskill
		reqskilllvl=1
		skillcost  =1
					//again, with the test magician.
					//I tried to organize it, so it goes in order of advancement
					//they're also very condensed, but linear.
	Soul_Reaper
//		bolt       {icon_state="bolt"}
//		poisontouch{icon_state="poisontouch";reqskill=BOLT}
//					//this one requires bolt
//		assault    {icon_state="magstrike";reqskill=BOLT}
		netherbolt {icon_state="netherbolt";/*reqskill=BOLT;reqskilllvl=3*/}
//					//this one requires bolt to be at level 3.
//		quake      {icon_state="quake";reqskill=PSNTH}
//
//		magicshield{icon_state="defnether"}
//		fireshield {icon_state="deffire";reqskill=MSHLD}
//		watershield{icon_state="defwater";reqskill=FSHLD}
//		windshield {icon_state="defwind";reqskill=ESHLD}
//		earthshield{icon_state="defearth";reqskill=MSHLD}


//	runeknight
//		strike     {icon_state="strike"}
//		swiftstrike{icon_state="swiftstrike";reqskill=STRK}
//		thrown      {icon_state="thrown";reqskill=STRK}
//		firestrike {icon_state="firestrike";reqskill=STRK}
//		jab        {icon_state="jab";reqskill=STRK;reqskilllvl=3}
//		waterstrike{icon_state="waterstrike";reqskill=FSTRK}
//		firethrow  {icon_state="firethrow";reqskill=THROWN}

//		magicimbue{icon_state="offnether"}
//		fireimbue {icon_state="offfire";reqskill=MIMBU}
//		waterimbue{icon_state="offwater";reqskill=FIMBU}
//		windimbue {icon_state="offwind";reqskill=IIMBU}
//		earthimbue{icon_state="offearth";reqskill=WIMBU}







//Want to customize the way the tree loads? Change CURRENT_SCHEME
//to one of the below methods
//You WILL have to be careful with your layout, if you choose to use arrows

//PS: Arrows do not currently work.

#define CURRENT_SCHEME TOP_TO_BOTTOM

//LEFT_TO_RIGHT

#define BOTTOM_TO_TOP "skilltree:[posy-1],[posx-1]"
#define TOP_TO_BOTTOM "skilltree:[proto.layout.len-posy],[li.len-posx]"
#define LEFT_TO_RIGHT "skilltree:[posx-1],[posy-1]"
#define RIGHT_TO_LEFT "skilltree:[li.len-posx],[proto.layout.len-posy]"


//world
//
//	view = 20


mob/var
//
//	class="runeknight"//,"magician")			 //semi-necessary for it to work
//								 //this can be either "runeknight" or "magician"
//	skillpoints=10
	list/skills=list()	 // skill=level
//
	skilltree
		Soul_Reaper/SR =new	 //skilltree objects necessary to generate the HUD
//		runeknight/rk=new

	tmp/busy = FALSE

mob/Stat()
//	..()
	for(var/obj/Skills/o in src.Skills)
		stat("[o]  [Skills[o]]")

				//just some demonstrative stuff
mob/GM/verb
//	Skillpoints_Set()
//		skillpoints=input(src,"How many skillpoints?","Skillpoints")as num
	Delete_Tree()
		src.client.screen = null
	Load_Tree()
		set category="GM"
		client.load_tree(src.Class)
//	Load_Magician()
//		src.client.screen = null
//		src.class = "magician"
//		client.load_tree(src.class)
//	Load_RuneKnight()
//		src.client.screen = null
//		src.class = "runeknight"
//		client.load_tree("runeknight")



client/proc
	load_tree(t)
		var/skilltree/proto
		switch(t)
									//gotta be a better way of doing this..
			if("Soul Reaper")  proto=mob.SR
			//if("runeknight")proto=mob.rk

		for(var/posy=1 to proto.layout.len)
									//y value
			var/list/li=proto.layout[posy]

			for(var/posx=1 to li.len)
									//x value
				if(li[posx])
									//don't want to spam null errors
					var/Skills/s=li[posx]
					//if(istype(s,/skill/arrow))
					//	screen += new s
					//	return

					var/Skills/ns=new s("[CURRENT_SCHEME]")

				//	var/skill/ns=new s("skilltree:[proto.layout.len-posy],[li.len-posx]")

					/*
					var/skill/ns=new s("skilltree:[li.len-posx],[proto.layout.len-posy]")
						This will make it go from right to left

					var/skill/ns=new s("skilltree:[proto.layout.len-posy],[li.len-posx]")
						This will make it go from top to bottom

					var/skill/ns=new s("skilltree:[posx-1],[posy-1]")
						This will make it go from left to right

					var/skill/ns=new s("skilltree:[posy-1],[posx-1]")
						This will make it go from bottom to top
					*/

					screen += ns
									//thank you, lummox's demo - I like the idea of overriding new() for this purpose
					if(!(locate(ns.type) in mob.Skills))
									//you haven't learned me yet
						if(ns.reqskill)
									//do we require a skill?
							if(!(locate(ns.reqskill) in mob.Skills))
									//we don't have the required skill.. sadface
								ns.overlays += new/Skills/unbuyable

							else
								var/tskill=locate(ns.reqskill) in mob.Skills
								if(tskill)

									if(mob.Skills[tskill]<ns.reqskilllvl)
									//you can't buy it if it has a level requirement and your level isn't high enough.
										ns.overlays += new/Skills/unbuyable

									else

										ns.overlays += new/Skills/available

								else
									//this should never occur.
									world << "Oddity here"

						else

							ns.overlays += new/Skills/available

					else
									//verification that it exists
						var/tskill=locate(ns.type) in mob.Skills
						if(tskill)

							ns.curlevel=mob.Skills[tskill]
									//we want to show it's a maxxed out skill!
							if(ns.curlevel>=ns.maxlevel)

								ns.overlays+=new/Skills/completed