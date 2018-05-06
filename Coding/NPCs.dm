datum/PathDatum
	var/turf/Loc
	var/WaitTime=4
	New(var/x,var/y,var/z,var/WT=4)
		src.WaitTime=WT
		src.Loc=locate(x,y,z)
		return ..()

/*turf/Entered(var/obj/NPC/Pathed/P)
	if(istype(P,/obj/NPC/Pathed))
		if(src==P.CurPath.Loc)
			spawn(P.CurPath.WaitTime)
				if(P.CurPathNum+P.Dir<=0)	P.Dir=1
				if(P.CurPathNum+P.Dir>P.PathLocs.len)
					var/datum/PathDatum/PL=P.PathLocs[1]
					if(P.loc==PL.Loc)	{P.Dir=1;P.CurPathNum=1}
					else	P.Dir=-1
				P.CurPathNum+=P.Dir;P.CurPath=P.PathLocs[P.CurPathNum]
				walk_to(P,P.CurPath.Loc,0,P.WalkSpeed)
	return ..()*/
var/list/TicketsHanded=list()
var/list/TicketsRolled=list()
mob/Supplemental
	Millamber
		icon='SoulReaper.dmi'
		New()
			src.StmBar()
			src.ReiBar()
			src.AddName()
			src.AddHair("Kenpachi")
			return ..()


obj/NPC
	layer=4
	density=1
	mouse_opacity=0
	var/list/Quests=list()
	icon='SoulReaper.dmi'
	New()
		src.AddName()
		if(src.name=="Yoruichi")	src.AddHair("Yoruichi")
		if(src.name=="Ran'Tao")	src.AddHair("Byakuya")
		if(src.icon=='SoulReaper.dmi'||src.icon=='captain.dmi'||src.icon=='SchoolFemale.dmi')
			var/obj/HO=new/obj/HairOver
			if(src.gender=="female"||src.icon=='SchoolFemale.dmi')	HO.icon='yoruichi.dmi'
			else	HO.icon=pick('ichigo.dmi','toshiro.dmi','urahara.dmi','uryu.dmi','renji.dmi','Byakuya.dmi','Kenpachi.dmi','Izuru.dmi','Maki.dmi')
			HO.icon=MyRGB(HO.icon,rgb(rand(0,100),rand(0,100),rand(0,55)))
			src.overlays+=HO
	Other
		Portal
			layer=8
			density=0
			var/mob/Owner
			var/PortalTo="Outpost"
			icon='Effects.dmi';icon_state="Portal"
			DblClick()
				if(usr.Chatting)	return
				if(usr.RegenWait>=0)	{QuestShow(usr,"Cannot be Entered During Combat");return}
				if(!src.Owner)
					if(src.icon_state!="invis")	del src
					return
				if(src in get_step(usr,usr.dir))
					var/DelWarning=""
					if(src.Owner==usr)	DelWarning="Entering your own Portal will cause it to Close."
					if(ShowAlert(usr,"Enter [src.Owner.name]'s Portal to [src.PortalTo]? > > [DelWarning]",list("Enter","Cancel"))=="Enter")
						if(!src || !src.Owner || src.icon_state=="invis")	return
						for(var/obj/NPC/Shopish/Transporter/M in world)	if(M.Place==src.PortalTo)
							usr.loc=get_step(M,M.dir);break
						if(src.Owner==usr)	del src
			New()
				MyFlick("PortalOpen",src)
			Del()
				src.icon_state="invis"
				MyFlick("PortalClose",src)
				sleep(4);return ..()
	Random
		var/Message="Hello"
		QuestChest
			icon='QuestItems.dmi';icon_state="Diary"
			var/Item2Give="/obj/Items/QuestItems/Diary"
			New()
				return
			DblClick()
				var/obj/O=new src.Item2Give
				if(usr.GetItem(O))
					src.loc=locate(rand(80,100),rand(80,100),2)
					spawn(300)	src.loc=locate(initial(src.x),initial(src.y),initial(src.z))
		Chest
			icon='Jungle.dmi';icon_state="Chest"
			var/Item2Give="/obj/Items/Potions/Energy_Drink"
			New()
				src.name="";return ..()
			DblClick()
				MyFlick("OpenChest",src);PlaySoundEffect(usr,'Open1.wav')
				if(src.Item2Give=="Empty")
					QuestShow(usr,"It Looks Empty...");return
				if(findtext(usr.ChestList,"*[src.x],[src.y],[src.z]",1,0))
					QuestShow(usr,"Already Looted this Chest!");return
				var/obj/O=new src.Item2Give
				if(usr.GetItem(O))	usr.ChestList+="*[src.x],[src.y],[src.z]"
		Window
			density=1;icon_state="Window"
			name="";icon='Interior.dmi'
			DblClick()
				PlaySoundEffect(usr,'Menu.wav')
				if(src.icon_state=="Window")	src.icon_state="ClosedWindow"
				else	src.icon_state="Window"
		Arena_Sign
			name=""
			icon='Arena.dmi';icon_state="SignL"
			pixel_y=-8
			DblClick()
				PlayMenuSound(usr,'TP_Talk_Start.wav')
				usr.ViewArenaScores();winset(usr,"MainWindow.MapMain","focus=true")
		Sign
			name="";icon='NPCs.dmi';icon_state="Sign"
			Message="- Posted Notice - > > Be Aware,  The following Areas are not 100% Completed at this point in time."
		Restaurant_Owner
			Message="Sorry, we're still getting a menu together.  Come back another time."
		Talker
			Message="..."
		Chilly_Girl
			icon='NPCs.dmi'
			icon_state="Little Girl"
			Message="Hey!  It's cold in here!"
		DblClick()
			if(src in get_step(usr,usr.dir))
				PlayMenuSound(usr,'TP_Talk_Start.wav')
				ShowText(usr,src.Message)
	Pathed
		var/CurPathNum=2;var/Dir=1
		var/datum/PathDatum/CurPath
		var/list/PathLocs=list()
		var/Message;var/WalkSpeed=4
		Krain
			Message="They say if you Graft hollow masks together you can make powerfull equipment Shards"
			New()
				var/PT=text2path("/datum/PathDatum")
				src.PathLocs=list(new PT(28,153,3,20),new PT(28,135,3,30));return ..()
		Energetic_Girl
			icon='NPCs.dmi'
			icon_state="Spaz"
			Message="AHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"
			WalkSpeed=1
			New()
				var/PT=text2path("/datum/PathDatum")
				src.PathLocs=list(new PT(41,139,3),new PT(59,139,3),new PT(59,145,3),new PT(41,145,3),new PT(41,139,3))
				return ..()
		Trainee
			Message="Work hard and maybe someday you can become a Captain!"
			New()
				var/PT=text2path("/datum/PathDatum")
				src.PathLocs=list(new PT(165,23,3,100),new PT(165,34,3),new PT(173,34,3),new PT(173,17,3),new PT(182,17,3,50))
				return ..()
		DblClick()
			if(src in get_step(usr,usr.dir))
				PlayMenuSound(usr,'TP_Talk_Start.wav')
				ShowText(usr,src.Message)
		New()
			return ..()
			spawn(rand(5,10))
				src.CurPath=src.PathLocs[2]
				walk_to(src,src.CurPath.Loc,0,src.WalkSpeed)
			return ..()

	Shopish
		Arena_Manager
		BlankArenaManager
			icon=null;name=""
			DblClick()
				if(src in get_step(usr,usr.dir))
					//ShowText(usr,"The Arena is currently closed for maintenance.  We'll be in working condition again shortly!");return
					if(ShowAlert(usr,"Welcome to the Golden Arena! > > Here you can engage in battle with hollows from around the world! > Each round you successfully complete will net you some bonus Copper.  Of course, if you end up falling in combat that bonus will be lost. Be carefull not to exceed your limits! > > So whataya say? Interested in signing up?",list("Register","Cancel"))=="Register")
						usr.ArenaRound=0;usr.ArenaBonus=0
						usr.StartArena()
		Name_Changer
			DblClick()
				if(src in get_step(usr,usr.dir))
					if(usr.IsMuted())
						ShowAlert(usr,"You can not change your name when you are muted!");return
					if(KillEvent==1)
						ShowAlert(usr,"You can not change your name during a MonsterBash event!");return
					if(!usr.Subscriber)
						ShowAlert(usr,"This Service is only Available to Zeus Donators!");return
					if(ShowAlert(usr,"If you'd like I can change your character's name for you. > This service is provided for free and can be used an unlimited amount of times",list("Change","Cancel"))=="Change")
						usr.ChangeName()
						if(usr)	usr.AddName()
		Respeccer
			DblClick()
				if(src in get_step(usr,usr.dir))
					var/GoldCost=0;var/SilvCost=500;if(usr.Subscriber)	SilvCost=0
					SilvCost*=usr.RespecUses+1;SilvCost=min(10000,SilvCost)
					while(SilvCost>=100)	{GoldCost+=1;SilvCost-=100}
					var/GoldTag=(GoldCost ? "[GoldCost] Gold" : "");var/AndT=(GoldCost&&SilvCost ? " and " : "")
					var/SilvTag=(SilvCost ? "[SilvCost] Silver" : "");GoldTag=(!GoldCost&&!SilvCost ? "Free for Subs" : "[GoldTag]")
					switch(ShowAlert(usr,"If you want I can Reset all your Skill and Trait Points or just your stat points for [GoldTag][AndT][SilvTag].",list("Respec","Restat","Retrait")))
						if("Respec")
							switch(ShowAlert(usr,"Are you certain you want to reset your stats,skills and traits?.",list("Yes","No")))
								if("Yes")
									if(CheckGold(TrueValue(usr),TrueValue(GoldCost,SilvCost,0)))
										usr.Respec();usr.RespecUses+=1
										usr.TakeGold(GoldCost,SilvCost,0)
										QuestShow(usr,"Your Character has been Respecced")
									else	ShowAlert(usr,"You dont have enough!  It costs [GoldTag][AndT][SilvTag] to Respec your Character!")
									if(!GoldCost && !SilvCost)	ShowAlert(usr,"To show our appreciation for your support of Zeus Games... > This service has been provided free of charge!")
									return
								if("No")
									return
						if("Restat")
							switch(ShowAlert(usr,"Are you certain you want to reset your stat points?.",list("Yes","No")))
								if("Yes")
									if(CheckGold(TrueValue(usr),TrueValue(GoldCost,SilvCost,0)))
										usr.Restat();usr.RespecUses+=1
										usr.TakeGold(GoldCost,SilvCost,0)
										QuestShow(usr,"Your Character has received a Restat")
									else	ShowAlert(usr,"You dont have enough!  It costs [GoldTag][AndT][SilvTag] to Respec your Character!")
									if(!GoldCost && !SilvCost)	ShowAlert(usr,"To show our appreciation for your support of Zeus Games... > This service has been provided free of charge!")
									return
								if("No")
									return
						if("Retrait")
							switch(ShowAlert(usr,"Are you certain you want to reset your trait points?.",list("Yes","No")))
								if("Yes")
									if(CheckGold(TrueValue(usr),TrueValue(GoldCost,SilvCost,0)))
										usr.Retrait();usr.RespecUses+=1
										usr.TakeGold(GoldCost,SilvCost,0)
										QuestShow(usr,"Your Character has received a Retrait")
									else	ShowAlert(usr,"You dont have enough!  It costs [GoldTag][AndT][SilvTag] to Respec your Character!")
									if(!GoldCost && !SilvCost)	ShowAlert(usr,"To show our appreciation for your support of Zeus Games... > This service has been provided free of charge!")
									return
								if("No")
									return

		Barber
			DblClick()
				if(src in get_step(usr,usr.dir))
					var/GoldCost=0;var/SilvCost=5;if(usr.Subscriber)	SilvCost=0
					SilvCost*=usr.BarberUses+1;SilvCost=min(10000,SilvCost)
					while(SilvCost>=100)	{GoldCost+=1;SilvCost-=100}
					var/GoldTag=(GoldCost ? "[GoldCost] Gold" : "");var/AndT=(GoldCost&&SilvCost ? " and " : "")
					var/SilvTag=(SilvCost ? "[SilvCost] Silver" : "");GoldTag=(!GoldCost&&!SilvCost ? "Free for Subs" : "[GoldTag]")
					if(ShowAlert(usr,"Interested in trying a new hair style?  Only [GoldTag][AndT][SilvTag].",list("Cut","Cancel"))=="Cut")
						if(CheckGold(TrueValue(usr),TrueValue(GoldCost,SilvCost,0)))
							usr.HairColor()
							usr.dir=SOUTH;usr.BarberUses+=1
							usr.TakeGold(GoldCost,SilvCost,0)
						else	ShowAlert(usr,"You dont have enough!  It costs [GoldTag][AndT][SilvTag] to Change your Hair Style!")
						if(!GoldCost && !SilvCost)	ShowAlert(usr,"To show our appreciation for your support of Zeus Games... > This service has been provided free of charge!")
		Zanpakuto_Manager
			DblClick()
				if(src in get_step(usr,usr.dir))
					for(var/obj/Skills/SoulReaper/Shikai/S in usr.Skills)
						var/GoldCost=0;var/SilvCost=10000;if(usr.Subscriber)	SilvCost=0
						while(SilvCost>=100)	{GoldCost+=1;SilvCost-=100}
						var/GoldTag=(GoldCost ? "[GoldCost] Gold" : "");var/AndT=(GoldCost&&SilvCost ? " and " : "")
						var/SilvTag=(SilvCost ? "[SilvCost] Silver" : "");GoldTag=(!GoldCost&&!SilvCost ? "Free for Subs" : "[GoldTag]")
						if(ShowAlert(usr,"Interested in trying a new Zanpakuto and a Respec?  Only [GoldTag][AndT][SilvTag].",list("Change","Cancel")))
							if("Change")
								if(usr.Bankai== 1 || usr.Shikai==1)
									ShowAlert(usr,"You can not change your Zan when you are in Bankai or Shikai!")
									return
							if(CheckGold(TrueValue(usr),TrueValue(GoldCost,SilvCost,0)))
								usr.TakeGold(GoldCost,SilvCost,0);usr.Respec();usr.ZanCreation()
							else	ShowAlert(usr,"You dont have enough!  It costs [GoldTag][AndT][SilvTag] to Change your Zanpakuto!")
							if(!GoldCost && !SilvCost)	ShowAlert(usr,"To show our appreciation for your support of Zeus Games... > This service has been provided free of charge!")
						return
					ShowAlert(usr,"You don't seem to have a Zanpakuto available...")

		Honor_Exchanger
			DblClick()
				if(src in get_step(usr,usr.dir))
					switch(ShowAlert(usr,"I can exchange your honor points for various prizes. Please pick a type.",list("Stats","Mask","Cancel")))
						if("Stats")
							switch(ShowAlert(usr,"Ah! You'd like to boost your stats eh? That will cost 5000 Honor per stat if below 500, otherwise 20000 per stat. Which one will it be then?",list("Prime","Secondary","Cancel")))
								if("Prime")
									switch(ShowAlert(usr,"Will it be Magic, Strength or Agility that you are after?",list("MGC","STR","AGI")))
										if("MGC")
											var/X=input("How many points do you wish to purchase?") as num
											if(!X)
												return
											if(X<=0)
												return
											if(usr.Level <= 499)
												if(usr.Honor < X*5000)
													ShowAlert(usr,"Are you trying to cheat me? You do not have the required Honor points")
													return
												else
													usr.Honor -= X*5000
													usr.MGC += X
													usr.boughtMGC += X
													usr.boughtstats += X
													ShowAlert(usr,"There you go! [X] MGC points it is.")
													usr.Save()
											else
												if(usr.Honor < X*20000)
													ShowAlert(usr,"Are you trying to cheat me? You do not have the required Honor points")
													return
												else
													usr.Honor -= X*20000
													usr.MGC += X
													usr.boughtMGC += X
													usr.boughtstats += X
													ShowAlert(usr,"There you go! [X] MGC points it is.")
													usr.Save()
										if("STR")
											var/X=input("How many points do you wish to purchase?") as num
											if(!X)
												return
											if(X<=0)
												return
											if(usr.Level <= 499)
												if(usr.Honor < X*5000)
													ShowAlert(usr,"Are you trying to cheat me? You do not have the required Honor points")
													return
												else
													usr.Honor -= X*5000
													usr.STR += X
													usr.boughtSTR += X
													usr.boughtstats +=X
													ShowAlert(usr,"There you go! [X] STR points it is.")
													usr.Save()
											else
												if(usr.Honor < X*20000)
													ShowAlert(usr,"Are you trying to cheat me? You do not have the required Honor points")
													return
												else
													usr.Honor -= X*20000
													usr.STR += X
													usr.boughtSTR += X
													usr.boughtstats +=X
													ShowAlert(usr,"There you go! [X] STR points it is.")
													usr.Save()
										if("AGI")
											var/X=input("How many points do you wish to purchase?") as num
											if(!X)
												return
											if(X<=0)
												return
											if(usr.Level <= 499)
												if(usr.Honor < X*5000)
													ShowAlert(usr,"Are you trying to cheat me? You do not have the required Honor points")
													return
												else
													usr.Honor -= X*5000
													usr.AGI += X
													usr.boughtAGI += X
													usr.boughtstats += X
													ShowAlert(usr,"There you go! [X] AGI point it is.")
													usr.Save()
											else
												if(usr.Honor < X*20000)
													ShowAlert(usr,"Are you trying to cheat me? You do not have the required Honor points")
													return
												else
													usr.Honor -= X*20000
													usr.AGI += X
													usr.boughtAGI += X
													usr.boughtstats += X
													ShowAlert(usr,"There you go! [X] AGI point it is.")
													usr.Save()

								if("Secondary")
									switch(ShowAlert(usr,"Will it be Luck, Vitality or Magic Defense that you are after?",list("LCK","VIT","MDEF")))
										if("LCK")
											var/X=input("How many points do you wish to purchase?") as num
											if(!X)
												return
											if(X<=0)
												return
											if(usr.Level <=499)
												if(usr.Honor < X*5000)
													ShowAlert(usr,"Are you trying to cheat me? You do not have the required Honor points")
													return
												else
													usr.Honor -= X*5000
													usr.LCK += X
													usr.boughtLCK += X
													usr.boughtstats += X
													ShowAlert(usr,"There you go! [X] LCK points it is.")
													usr.Save()
											else
												if(usr.Honor < X*20000)
													ShowAlert(usr,"Are you trying to cheat me? You do not have the required Honor points")
													return
												else
													usr.Honor -= X*20000
													usr.LCK += X
													usr.boughtLCK += X
													usr.boughtstats += X
													ShowAlert(usr,"There you go! [X] LCK points it is.")
													usr.Save()

										if("VIT")
											var/X=input("How many points do you wish to purchase?") as num
											if(!X)
												return
											if(X<=0)
												return
											if(usr.Level <=499)
												if(usr.Honor < X*5000)
													ShowAlert(usr,"Are you trying to cheat me? You do not have the required Honor points")
													return
												else
													usr.Honor -= X*5000
													usr.VIT += X
													usr.boughtVIT += X
													usr.boughtstats += X
													ShowAlert(usr,"There you go! [X] VIT points it is.")
													usr.Save()
											else
												if(usr.Honor < X*20000)
													ShowAlert(usr,"Are you trying to cheat me? You do not have the required Honor points")
													return
												else
													usr.Honor -= X*20000
													usr.VIT += X
													usr.boughtVIT += X
													usr.boughtstats += X
													ShowAlert(usr,"There you go! [X] VIT points it is.")
													usr.Save()
										if("MDEF")
											var/X=input("How many points do you wish to purchase?") as num
											if(X<=0)
												return
											if(usr.Level <=499)
												if(usr.Honor < X*5000)
													ShowAlert(usr,"Are you trying to cheat me? You do not have the required Honor points")
													return
												else
													usr.Honor -= X*5000
													usr.MGCDEF += X
													usr.boughtMGCDEF += X
													usr.boughtstats += X
													ShowAlert(usr,"There you go! [X] MGCDEF points it is.")
													usr.Save()
											else
												if(usr.Honor < X*20000)
													ShowAlert(usr,"Are you trying to cheat me? You do not have the required Honor points")
													return
												else
													usr.Honor -= X*20000
													usr.MGCDEF += X
													usr.boughtMGCDEF += X
													usr.boughtstats += X
													ShowAlert(usr,"There you go! [X] MGCDEF points it is.")
													usr.Save()
						if("Mask")
							if(usr.Vaizard==1)
								ShowAlert(usr,"You must not be in Vaizard form in order to change your mask!")
								return
							if(usr.Honor<1000)
								ShowAlert(usr,"You need at least 1000 honor in order to change your mask!")
								return
							else
								switch(ShowAlert(usr,"Changing your Vaizard Mask will cost 1000 honor and the result is random.",list("Yes","No")))
									if("Yes")
										var/E = rand(1,3)
										if(E==1)
											usr.VaiMask="Ichigo"
										if(E==2)
											usr.VaiMask="Shinji"
										if(E==3)
											usr.VaiMask="Lisa"
										usr.Honor-= 1000
										ShowAlert(usr,"You have gained [usr.VaiMask]")
		Honor_Prize_Exchanger
			DblClick()
				if(src in get_step(usr,usr.dir))
					switch(ShowAlert(usr,"I will give you a gift certificate for 999000 honor, it has a chance to reward powerful items, Badges and more. Or you can exchange your Honor for an Honor Badge..",list("Gift","Badge","Cancel")))
						if("Gift")
							switch(ShowAlert(usr,"Are you sure you want to exchange 999k honor for a gift certificate? You can not undo this afterwards.",list("Yes","No")))
								if("No")
									return
								if("Yes")
									if(usr.Honor<999000)
										ShowAlert(usr,"You do not have enough honor.")
										return
									else
										usr.Honor-=999000
										usr.bank.DepositItem2(new /obj/Items/Other/Honor_Prize_Ticket)
										ShowAlert(usr,"Thank you, I have sent the Prize ticket to your bank..")
										usr.Save()
						if("Badge")
							switch(ShowAlert(usr,"You wish to exchange 5mil honor for 1 Badge?",list("Yes","No")))
								if("No")
									return
								if("Yes")
									if(usr.Honor<5000000)
										ShowAlert(usr,"You do not have enough honor.")
										return
									else
										usr.Honor-=5000000
										usr.Badges+=1
										ShowAlert(usr,"There you go! 1 Honor badge..")
										text2file("[time2text(world.realtime)]:[usr] received 1 badge for honor. <br>","creditlogs.html")
										usr.Save()

		Master_Refiner
			DblClick()
				if(src in get_step(usr,usr.dir))
					switch(ShowAlert(usr,"I can extract precious materials from equipment for you, you can use these materials to enchant other equipment. The original item will be destroyed in the process.",list("Salvage","Refine","Cancel")))
						if("Salvage")
							switch(ShowAlert(usr,"Salvaging an item will destroy it. However, you will various materials which you can use to refine equipment. The cost is 25000 gold.",list("Yes","No")))
								if("No")
									return
								if("Yes")
									if(usr.Gold<25000)
										ShowAlert(usr,"You do not have enough gold.")
										return
									else
										if(usr.trading==1)
											QuestShow(usr,"Come back when you aren't Auctioning.")
											return
										var/obj/Items/Equipment/O = input("Which item would you like to salvage?") as obj in usr.Inventory
										if(O)
											if(O.nosalvage || !O.SalvageItems)
												usr<<"<b>This item can not be Salvaged"
												return
											switch(ShowAlert(usr,"Salvage [O]?",list("Yes","No")))
												if("Yes")
													var/E=rand(1,5)
													for(var/Stat in O.SalvageItems)
														usr.vars["[Stat]"]+=O.SalvageItems[Stat]*E
													usr.Gold-=25000
													var/HtmlText="<title>Commodities Received</title><body bgcolor=black>"
													HtmlText+="<center><table bgcolor=black bordercolor=yellow border=0>"
													HtmlText+="<tr><td><center><b><font color=green>"
													HtmlText+="<font color=green size=3><b>Salvage Results for [O]<br>"
													for(var/x in O.SalvageItems)
														HtmlText+="<tr><td><b><center><font color=White font size=3>[x] amount <font color=red>[O.SalvageItems[x]*E]</font> units.<br>"
													HtmlText+="</table>"
													usr<<browse(HtmlText,"window=GenericBrowser")
													O.Discard(1)
													usr.Save()
												if("No")
													return
						if("Refine")
							switch(ShowAlert(usr,"Refining an item will increase its power, there is a chance of failure. The cost is 100000 gold or less if you are a VIP.",list("Yes","No")))
								if("No")
									return
								if("Yes")
									var/div=1
									if(usr.VIP)
										if(usr.VIP<=3)
											if(usr.Gold<100000)
												ShowAlert(usr,"You do not have enough gold.")
												return
										if(usr.VIP>=4)
											div=usr.VIP
											if(usr.Gold<(100000/usr.VIP))
												ShowAlert(usr,"You do not have enough gold.")
												return
									else
										if(usr.Gold<100000)
											ShowAlert(usr,"You do not have enough gold.")
											return
									if(usr.trading==1)
										QuestShow(usr,"Come back when you aren't Auctioning.")
										return
									var/obj/Items/Equipment/O = input("Which item would you like to Refine?") as obj in usr.Inventory
									if(O)
										switch(ShowAlert(usr,"Refine [O]?",list("Yes","No")))
											if("Yes")
												if(O.noenchant)
													usr<<"This item can not be refined."
													return
												else
													switch(ShowAlert(usr,"Refine [O]? Check Requirements first!",list("Yes","No","Requirements")))
														if("Yes")
															for(var/Required in O.SalvageItems)
																if(usr.vars["[Required]"]< O.SalvageItems[Required]*3)
																	usr<<"You do not have enough commodities to Refine [O]"
																	return
															if(O.enc<=3)
																var/E=rand(1,20)
																if(E==2 || E==10 || E==14)
																	if(usr.hassafe)
																		usr.hassafe-=1
																		usr.Gold-=100000/div
																		usr<<"<b><font color=red>Your refining attempt has failed but the item was protected by a Refine Protection!"
																		for(var/Required in O.SalvageItems)
																			usr.vars["[Required]"]-=O.SalvageItems[Required]*3
																		text2file("[time2text(world.realtime)]:[usr] failed to refine [O.name] and used 1 safery . <br>","refinelogs.html")
																		usr.Save()
																	else
																		O.enc-=1
																		O.name="[O.oname] ([O.enc])"
																		usr.Gold-=100000/div
																		usr<<"<b>Your refining attempt has failed [O.oname] to <font color=red>[O.name]</font>!"
																		for(var/Required in O.SalvageItems)
																			usr.vars["[Required]"]-=O.SalvageItems[Required]*3
																		text2file("[time2text(world.realtime)]:[usr] failed to refine [O.name] . <br>","refinelogs.html")
																		usr.Save()

																else
																	if(usr.hassafe)
																		usr.hassafe-=1
																		usr<<"<b>Refine Protection used!"
																	O.enc+=1
																	var/oldname= O.name
																	O.name="[O.oname] (+[O.enc])"
																	usr.Gold-=100000/div
																	usr<<"<b>Your refining attempt has suceeded, [O.oname] refined to <font color=red>[O.name]</font>!"
																	world<<"[ServerTag] <font color=red>[usr]</font> succesfully refined [oldname] to <font color=yellow>[O.name]</font>!"
																	for(var/Required in O.SalvageItems)
																		usr.vars["[Required]"]-=O.SalvageItems[Required]*3
																	text2file("[time2text(world.realtime)]:[usr] refined [oldname] to [O.name] (safety [usr.hassafe]). <br>","refinelogs.html")
																	usr.Save()
																	return
															if(O.enc>=4 && O.enc<=8)
																var/E=rand(1,11)
																if(E==1 || E==5 || E==11 || E==6 || E==9)
																	if(usr.hassafe)
																		usr.hassafe-=1
																		usr.Gold-=100000/div
																		usr<<"<b><font color=red>Your refining attempt has failed but the item was protected by a Refine Protection!"
																		for(var/Required in O.SalvageItems)
																			usr.vars["[Required]"]-=O.SalvageItems[Required]*3
																		text2file("[time2text(world.realtime)]:[usr] failed to refine [O.name] and used 1 safery . <br>","refinelogs.html")
																		usr.Save()
																	else
																		O.enc-=1
																		O.name="[O.oname] ([O.enc])"
																		usr.Gold-=100000/div
																		usr<<"<b>Your refining attempt has failed [O.oname] to <font color=red>[O.name]</font>!"
																		for(var/Required in O.SalvageItems)
																			usr.vars["[Required]"]-=O.SalvageItems[Required]*3
																		text2file("[time2text(world.realtime)]:[usr] failed to refine [O.name] . <br>","refinelogs.html")
																		usr.Save()

																else
																	if(usr.hassafe)
																		usr.hassafe-=1
																		usr<<"<b>Refine Protection used!"
																	O.enc+=1
																	var/oldname= O.name
																	O.name="[O.oname] (+[O.enc])"
																	usr.Gold-=100000/div
																	usr<<"<b>Your refining attempt has suceeded, [O.oname] refined to <font color=red>[O.name]</font>!"
																	world<<"[ServerTag] <font color=red>[usr]</font> succesfully refined [oldname] to <font color=yellow>[O.name]</font>!"
																	for(var/Required in O.SalvageItems)
																		usr.vars["[Required]"]-=O.SalvageItems[Required]*3
																	text2file("[time2text(world.realtime)]:[usr] refined [oldname] to [O.name] (safety [usr.hassafe]). <br>","refinelogs.html")
																	usr.Save()
																	return
															if(O.enc>=9 && O.enc<=13)
																var/E=rand(1,20)
																if(E==1 || E==5 || E==12 || E==20 || E==13 || E==18 || E==10 || E==16 || E==19 || E==2 || E==14 || E==3 || E==17)
																	if(usr.hassafe)
																		usr.hassafe-=1
																		usr.Gold-=100000/div
																		usr<<"<b><font color=red>Your refining attempt has failed but the item was protected by a Refine Protection!"
																		for(var/Required in O.SalvageItems)
																			usr.vars["[Required]"]-=O.SalvageItems[Required]*3
																		text2file("[time2text(world.realtime)]:[usr] failed to refine [O.name] and used 1 safery . <br>","refinelogs.html")
																		usr.Save()
																	else
																		O.enc-=1
																		O.name="[O.oname] ([O.enc])"
																		usr.Gold-=100000/div
																		usr<<"<b>Your refining attempt has failed [O.oname] to <font color=red>[O.name]</font>!"
																		for(var/Required in O.SalvageItems)
																			usr.vars["[Required]"]-=O.SalvageItems[Required]*3
																		text2file("[time2text(world.realtime)]:[usr] failed to refine [O.name] . <br>","refinelogs.html")
																		usr.Save()

																else
																	if(usr.hassafe)
																		usr.hassafe-=1
																		usr<<"<b>Refine Protection used!"
																	O.enc+=1
																	var/oldname= O.name
																	O.name="[O.oname] (+[O.enc])"
																	usr.Gold-=100000/div
																	usr<<"<b>Your refining attempt has suceeded, [O.oname] refined to <font color=red>[O.name]</font>!"
																	world<<"[ServerTag] <font color=red>[usr]</font> succesfully refined [oldname] to <font color=yellow>[O.name]</font>!"
																	for(var/Required in O.SalvageItems)
																		usr.vars["[Required]"]-=O.SalvageItems[Required]*3
																	text2file("[time2text(world.realtime)]:[usr] refined [oldname] to [O.name] (safety [usr.hassafe]). <br>","refinelogs.html")
																	usr.Save()
																	return

															if(O.enc>=14 && O.enc<=18)
																var/E=rand(1,20)
																if(E==1 || E==5 || E==12 || E==20 || E==13 || E==19 || E==10 || E==2 || E==3 || E==9 || E==11 || E == 13 || E== 14)
																	if(usr.hassafe)
																		usr.hassafe-=1
																		usr.Gold-=100000/div
																		usr<<"<b><font color=red>Your refining attempt has failed but the item was protected by a Refine Protection!"
																		for(var/Required in O.SalvageItems)
																			usr.vars["[Required]"]-=O.SalvageItems[Required]*3
																		text2file("[time2text(world.realtime)]:[usr] failed to refine [O.name] and used 1 safery . <br>","refinelogs.html")
																		usr.Save()
																	else
																		O.enc-=1
																		O.name="[O.oname] ([O.enc])"
																		usr.Gold-=100000/div
																		usr<<"<b>Your refining attempt has failed [O.oname] to <font color=red>[O.name]</font>!"
																		for(var/Required in O.SalvageItems)
																			usr.vars["[Required]"]-=O.SalvageItems[Required]*3
																		text2file("[time2text(world.realtime)]:[usr] failed to refine [O.name] . <br>","refinelogs.html")
																		usr.Save()

																else
																	if(usr.hassafe)
																		usr.hassafe-=1
																		usr<<"<b>Refine Protection used!"
																	O.enc+=1
																	var/oldname= O.name
																	O.name="[O.oname] (+[O.enc])"
																	usr.Gold-=100000/div
																	usr<<"<b>Your refining attempt has suceeded, [O.oname] refined to <font color=red>[O.name]</font>!"
																	world<<"[ServerTag] <font color=red>[usr]</font> succesfully refined [oldname] to <font color=yellow>[O.name]</font>!"
																	for(var/Required in O.SalvageItems)
																		usr.vars["[Required]"]-=O.SalvageItems[Required]*3
																	text2file("[time2text(world.realtime)]:[usr] refined [oldname] to [O.name] (safety [usr.hassafe]). <br>","refinelogs.html")
																	usr.Save()
																	return
															if(O.enc>=18 && O.enc<=20)
																var/E=rand(1,20)
																if(E==1 || E==5 || E==12 || E==20 || E==13 || E==19 || E==10 || E==2 || E==3 || E==9 || E==11 || E==4 || E==6 || E==8 || E==17 || E==18 || E==7)
																	if(usr.hassafe)
																		usr.hassafe-=1
																		usr.Gold-=100000/div
																		usr<<"<b><font color=red>Your refining attempt has failed but the item was protected by a Refine Protection!"
																		for(var/Required in O.SalvageItems)
																			usr.vars["[Required]"]-=O.SalvageItems[Required]*3
																		text2file("[time2text(world.realtime)]:[usr] failed to refine [O.name] and used 1 safery . <br>","refinelogs.html")
																		usr.Save()
																	else
																		O.enc-=1
																		O.name="[O.oname] ([O.enc])"
																		usr.Gold-=100000/div
																		usr<<"<b>Your refining attempt has failed [O.oname] to <font color=red>[O.name]</font>!"
																		for(var/Required in O.SalvageItems)
																			usr.vars["[Required]"]-=O.SalvageItems[Required]*3
																		text2file("[time2text(world.realtime)]:[usr] failed to refine [O.name] . <br>","refinelogs.html")
																		usr.Save()

																else
																	if(usr.hassafe)
																		usr.hassafe-=1
																		usr<<"<b>Refine Protection used!"
																	O.enc+=1
																	var/oldname= O.name
																	O.name="[O.oname] (+[O.enc])"
																	usr.Gold-=100000/div
																	usr<<"<b>Your refining attempt has suceeded, [O.oname] refined to <font color=red>[O.name]</font>!"
																	world<<"[ServerTag] <font color=red>[usr]</font> succesfully refined [oldname] to <font color=yellow>[O.name]</font>!"
																	for(var/Required in O.SalvageItems)
																		usr.vars["[Required]"]-=O.SalvageItems[Required]*3
																	text2file("[time2text(world.realtime)]:[usr] refined [oldname] to [O.name] (safety [usr.hassafe]). <br>","refinelogs.html")
																	usr.Save()
																	return
														if("Requirements")
															var/HtmlText="<title>Requirements</title><body bgcolor=black>"
															HtmlText+="<center><table bgcolor=black bordercolor=yellow border=0>"
															HtmlText+="<tr><td><center><b><font color=green>"
															HtmlText+="<font color=green size=4><b>[O] Refining requirements<br>"
															for(var/x in O.SalvageItems)
																HtmlText+="<tr><td><b><center><font color=White font size=3>[x] requires <font color=red>[O.SalvageItems[x]*3]</font> units.<br>"
															HtmlText+="</table>"
															usr<<browse(HtmlText,"window=GenericBrowser")

												if("No")
													return

/*						if("Badge")
							switch(ShowAlert(usr,"You wish to exchange 5mil honor for 1 Badge?",list("Yes","No")))
								if("No")
									return
								if("Yes")
									if(usr.Honor<5000000)
										ShowAlert(usr,"You do not have enough honor.")
										return
									else
										usr.Honor-=5000000
										usr.Badges+=1
										ShowAlert(usr,"There you go! 1 Honor badge..")
										text2file("[time2text(world.realtime)]:[usr] received 1 badge for honor. <br>","creditlogs.html")*/

	/*	Santa_Kabuto
			DblClick()
				if(src in get_step(usr,usr.dir))
					switch(ShowAlert(usr,"Welcome and Merry Christmas! > > If you have donated, you are entitled to a Christmas present, courtesy of Kabuto!.",list("Present","Cancel")))
						if("Present")
							if(!usr.Subscriber)
								ShowAlert(usr,"Ah, but you are not a Donator, your name is not on my gift list! Merry Christmas anyway!")
								return
							else
								if(usr.key in Gifted)
									ShowAlert(usr,"Looks like you've already received a Gift this year!")
								else
									usr.bank.DepositItem2(new  /obj/Items/Other/Special_Gift_Box)
									usr.gotGift=1
									Gifted.Add(usr.key)
									ShowAlert(usr,"Ah, yes, there you go! Your present is in your bank, Merry Christmas and thank you for the support!")
									SaveConfig()*/
		Lottery_Vendor
			DblClick()
				if(src in get_step(usr,usr.dir))
					switch(ShowAlert(usr,"Greetings, are you interested in a lottery ticket? 10 badges each > > There are many prizes, the top prizes are 20k badges, VIP 6, 500m gold, Fullhollow Form, Ark and more..Good luck!",list("Ticket","Cancel")))
						if("Ticket")
							LOOPIES
							var/x=rand(1,50000)
							if(TicketsHanded.Find(x))
								usr<<"Hmmm...let me try this again."
								goto LOOPIES
							else
								if(usr.Badges<10)
									ShowAlert(usr,"Come back when you have the Badges!")
									return
								else
									usr.Badges-=10
									usr.Tickets+=x
									TicketsHanded.Add(x)
									ShowAlert(usr,"Thank you, you have received Lottery Ticket number [x]!")
									saveSecurity("Lotto")
									text2file("[time2text(world.realtime)]:[usr] received Ticket [x]","gmlog.html")
									return


		Mysterious_Shinigami
			DblClick()
				if(src in get_step(usr,usr.dir))
					if(usr.Class=="Soul Reaper")
						switch(ShowAlert(usr,"Greetings, Shinigami.If you are interested, I am able to send you to Soul Society's past, only by understanding the past will you be able to venture to its present state. Are you willing?",list("Yes","No")))
							if("No")
								return
							if("Yes")
								if(usr.Level<350)
									ShowAlert(usr,"You are not strong enough, you must be at least 350.")
								else
									usr.loc=locate(100,1,21)
					else
						ShowAlert(usr,"Begone, I have no business with the likes of you.")


		Currency_Exchanger
			DblClick()
				if(src in get_step(usr,usr.dir))
					if(!BadgeCost)
						QuestShow(usr,"Badge conversions are not available at the moment!.")
						return
					switch(ShowAlert(usr,"Welcome, I can convert your badges to gold or your gold to bound badges. The rates may change at anytime!",list("Badges","Gold","Cancel")))
						if("Cancel")
							return
						if("Badges")
							var/I=input("Each badge current costs [BadgeCost] gold. How many will you buy? Type 0 if none.") as num
							if(I<=0)
								QuestShow(usr,"You decide not to purchase Badges!.")
								return
							if(usr.Gold >= I*BadgeCost)
								usr.Gold-=I*BadgeCost
								usr.bBadges+=I
								QuestShow(usr,"You have succesfully purchased [I] bound Badges!.")
								text2file("[time2text(world.realtime)]:[usr] bought [I] badges. <br>","creditlogs.html")
								usr.Save()
							else
								QuestShow(usr,"You do not have enough Gold coins!.")

						if("Gold")
							var/I=input("Each bound badge can be converted to [BadgeCost] gold. How many will you convert? Type 0 if none.") as num
							if(I<=0)
								QuestShow(usr,"You decide not to convert Badges!.")
								return
							if(usr.bBadges >= I)
								usr.Gold+=I*BadgeCost
								usr.bBadges-=I
								QuestShow(usr,"You have succesfully converted [I] bound Badges to [I*BadgeCost] gold!.")
								text2file("[time2text(world.realtime)]:[usr] converted [I] badges to [I*BadgeCost]. <br>","creditlogs.html")
								usr.Save()
							else
								QuestShow(usr,"You do not have enough bound Badges!.")


		Bank_Manager
			DblClick()
				if(src in get_step(usr,usr.dir))
					switch(ShowAlert(usr,"Welcome, I can keep your items safe for you until you need them again.",list("Bank","Cancel")))
						if("Cancel")
							return
						if("Bank")
							if(!usr.bank)
								usr.bank = new/BankClass
							switch(ShowAlert(usr,"[src.name]: Would you like to deposit or withdraw an item? Alternivately you can convert your platinum to gold! -- Amount of items stored  : [usr.bank.items.len]",list("Deposit","Withdraw","Convert")))

									/*
									For depositing and withdrawing we have to be careful to check that the player is not trying to
									enter a negative value. This would be a way to exploit the bank to getting money that the player
									does not own. We also round the player's input to avoid any unnecessary decimals.

									Notice that we use usr.bank.DepositMoney() and usr.bank.WithdrawMoney() to handle the transaction.
									usr.bank is a variable that holds a reference to the BankClass which is defined below.
									This is a pretty nifty and powerful tool to use.
									*/


										/*
										Again, for items we use the BankClass defined below. For more information on how this works,
										look at my description above the BankClass.
										*/
								if("Convert")
									var/I=input("Convert how many Platinum into Gold?") as num
									if(I<=0)
										QuestShow(usr,"You decide not to exchange!.")
										return
									if(usr.Platinum >= I)
										usr.Platinum-=I
										usr.Gold+=I*5000000
										QuestShow(usr,"You have succesfully converted [I] Platinum into Gold!.")
										usr.Save()
									else
										QuestShow(usr,"You do not have enough Platinum coins!.")
								if("Deposit")
									if(usr.trading==1)
										QuestShow(usr,"Come back when you aren't Auctioning.")
										return
									if(usr.bank.items.len>=100)
										QuestShow(usr,"Bank Full.")
										return
									var/obj/O = input("Which item would you like to deposit?") as obj in usr.Inventory
									switch(ShowAlert(usr,"Deposit [O]?",list("Yes","No")))
										if("No")
											return
										if("Yes")
											if(O)
												if(O.nobank==1)
													QuestShow(src,"You may not bank this item!.")
													return
												if(O.enc>=21)
													QuestShow(src,"You may not bank a refined item!.")
													return
												else
													usr.bank.DepositItem(O)
													QuestShow(usr,"Item deposited safely.")
													usr.SaveBank()
													usr.Save()
											else
												QuestShow(src,"You have nothing to deposit!.")
								else if("Withdraw")
									if(usr.trading==1)
										QuestShow(usr,"Come back when you aren't Auctioning.")
										return
									var/obj/O = input("Which item would you like to withdraw?") as obj in usr.bank.GetItems()
									if(!O)
										return
									switch(ShowAlert(usr,"Withdraw [O]?",list("Yes","No")))
										if("No")
											return
										if("Yes")
											if(O)
												usr.bank.WithdrawItem(O)
												QuestShow(usr,"You withdrew your [O].")
												usr.SaveBank()
												usr.Save()
											else
												QuestShow(usr,"Your bank is empty!.")







		Transporter
			var/Place="Arial"
			var/list/Places=list("Outpost","Karakura","Cancel")
			DblClick()
				if(!(src in get_step(usr,usr.dir)))	return
				if(!(src.Place in usr.TransLocs))
					usr.TransLocs+=src.Place
					ShowAlert(usr,"Your soul has been connected with the Transporter at [src.Place].  You can now transport here from nearby locations.",list("OK"))
					return
				var/list/Options=list()
				for(var/v in src.Places)	if(v in usr.TransLocs)	Options+=v
				if(!Options.len)
					ShowAlert(usr,"Your soul isn't connected to any nearby locations.  I won't be able to transport you anywhere, sorry.  You must speak with other Transporters before I can send you to them.",list("OK"))
					return
				Options+="Cancel"
				var/Place2Go=ShowAlert(usr,"We are currently at [src.Place]. > Where would you like to go?",Options)
				for(var/obj/NPC/Shopish/Transporter/T in world)
					if(T.Place==Place2Go)
						ShowEffect(usr,'Effects.dmi',"PortalFlash","",4);sleep(3);if(!usr)	return
						usr.loc=get_step(T,T.dir)
						usr.dir=get_dir(usr,T)
		Transporter2
			var/Place="New Haven"
			var/list/Places=list("Arial","Karakura","Cancel")
			DblClick()
				if(!(src in get_step(usr,usr.dir)))	return
				if(!(src.Place in usr.TransLocs))
					usr.TransLocs+=src.Place
					ShowAlert(usr,"Your soul has been connected with the Transporter at [src.Place].  You can now transport here from nearby locations.",list("OK"))
					return
				var/list/Options=list()
				for(var/v in src.Places)	if(v in usr.TransLocs)	Options+=v
				if(!Options.len)
					ShowAlert(usr,"Your soul isn't connected to any nearby locations.  I won't be able to transport you anywhere, sorry.  You must speak with other Transporters before I can send you to them.",list("OK"))
					return
				Options+="Cancel"
				var/Place2Go=ShowAlert(usr,"We are currently at [src.Place]. > Where would you like to go?",Options)
				for(var/obj/NPC/Shopish/Transporter/T in world)
					if(T.Place==Place2Go)
						ShowEffect(usr,'Effects.dmi',"PortalFlash","",4);sleep(3);if(!usr)	return
						usr.loc=get_step(T,T.dir)
						usr.dir=get_dir(usr,T)
		Spirit_Master
			DblClick()
				if(src in get_step(usr,usr.dir))
					for(var/obj/Items/Other/Progress_Cupon/C in usr.Inventory)
						switch(ShowAlert(usr,"It appears you have a Progress Cupon.  If you'd like I'll give you a Respec Cupon or a Barber Cupon in exchange for it.",list("Respec","Barber","Cancel")))
							if("Respec")
								C.Discard(1);usr.GetItem(new/obj/Items/Other/Respec_Cupon)
							if("Barber")
								C.Discard(1);usr.GetItem(new/obj/Items/Other/Barber_Cupon)
						return
					ShowText(usr,"If you bring me a Progress Cupon I'll trade you something good for it.")
		Spirit_Manager
			DblClick()
				if(src in get_step(usr,usr.dir))
					switch(ShowAlert(usr,"How can I help you?",list("Rest","Spawn","Cancel")))
						if("Rest")
							usr.STM=usr.MaxSTM
							usr.REI=usr.MaxREI
							usr.StmBar()
							usr.ReiBar()
							ShowAlert(usr,"Stamina and Reiatsu Restored!",list("OK"))
						if("Spawn")
							if(ShowAlert(usr,"Would you like to set your Respawn Point to this Location?",list("Yes","No"))=="Yes")
								usr.SetRespawn()
