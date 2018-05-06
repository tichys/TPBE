var/list/Rewarded=list()

mob/var
	NameColor = "#FFFFFF"
	FontColor="#96CDFF"
	FontFace="Frostys Winterland"
	Bankaimsg=""
	ClothesR=0
	ClothesG=0
	ClothesB=0
	var/obj/Supplemental/ClothesOverlay/ClothesOverlay

obj/Supplemental
	ClothesOverlay
		icon='SoulReaperClothes.dmi'
		layer=FLOAT_LAYER

mob/Subscriber/verb
	Subscribe()
		set category="VIP"
		if(!SubKeyCheck(usr.key))	usr<<link("http://162.243.95.178/subscribe.html")
		else	usr.SubCheck()
	Bankai_Alert()
		set category="VIP"
		rebank
		var/list/L
		L = list("font size","span","size")
		var/X=input("Add a message the world will see when you use Bankai") as text
		for(var/O in L)
			if(findtext(X,O))
				QuestShow(usr,"You cannot change your font size!")
				goto rebank
		usr.Bankaimsg= X
	Font_Color()
		set category="VIP"
		usr.FontColor=input("Select your Font Color:","Font Color",usr.FontColor)as color
	Name_Color()
		set category="VIP"
		usr.NameColor=input("Select your Font Color:","Font Color",usr.NameColor)as color
	Font_Face()
		set category="VIP"
		//Bookman Old Style - breaks icon size
		usr.FontFace=input("Set the font face for your messages","Font Face",usr.FontFace)as text
		usr.FontFace=AsciiCheck(RemoveHTML(usr.FontFace))
		if(findtext(usr.FontFace,"Bookman Old Style"))	usr.FontFace=null
		if(!usr.FontFace)	usr.FontFace=initial(usr.FontFace)
	Dye_Clothes()
		set category="VIP"
		usr.ClothesR=max(0,min(200,input("Input Red Dye","Clothes Dye",usr.ClothesR) as num))
		usr.ClothesG=max(0,min(200,input("Input Green Dye","Clothes Dye",usr.ClothesG) as num))
		usr.ClothesB=max(0,min(200,input("Input Blue Dye","Clothes Dye",usr.ClothesB) as num))
		usr.RefreshClothes()

	/*Receive_Monthly()
		set category="Donor"
		set name="Receive monthly badges"
		if(usr.key in Rewarded)
			usr<<"<b>You have already received your monthly badges for this month."
			return
		else
			if(usr.key=="Nikorayu")
				usr.Badges+=25
				usr<<"You have received your 25 monthly badges."
				Rewarded+=usr.key
				SaveReward()
				text2file("[time2text(world.realtime)]:[usr] monthly +25. <br>","creditlogs.html")
				return
			if(usr.key=="KalikaDyrewolf")
				usr.Badges+=2
				usr<<"You have received your 2 monthly badges."
				Rewarded+=usr.key
				text2file("[time2text(world.realtime)]:[usr] monthly +2. <br>","creditlogs.html")
				SaveReward()
				return
			if(usr.key=="Firemastar")
				usr.Badges+=3
				usr<<"You have received your 3 monthly badges."
				Rewarded+=usr.key
				text2file("[time2text(world.realtime)]:[usr] monthly +3. <br>","creditlogs.html")
				SaveReward()
				return
			if(usr.key=="Jdl78")
				usr.Badges+=14
				usr<<"You have received your 14 monthly badges."
				Rewarded+=usr.key
				text2file("[time2text(world.realtime)]:[usr] monthly +14. <br>","creditlogs.html")
				SaveReward()
				return
			if(usr.key=="Jezzabelle_Cullen")
				usr.Badges+=1
				usr<<"You have received your 1 monthly badges."
				Rewarded+=usr.key
				text2file("[time2text(world.realtime)]:[usr] monthly +1. <br>","creditlogs.html")
				SaveReward()
				return
			if(usr.key=="Yosuei")
				usr.Badges+=1
				usr<<"You have received your 1 monthly badges."
				Rewarded+=usr.key
				text2file("[time2text(world.realtime)]:[usr] monthly +1. <br>","creditlogs.html")
				SaveReward()
				return
			if(usr.key=="nekokitty11")
				usr.Badges+=1
				usr<<"You have received your 1 monthly badges."
				Rewarded+=usr.key
				text2file("[time2text(world.realtime)]:[usr] monthly +1. <br>","creditlogs.html")
				SaveReward()
				return
			if(usr.key=="Mianata")
				usr.Badges+=5
				usr<<"You have received your 5 monthly badges."
				Rewarded+=usr.key
				text2file("[time2text(world.realtime)]:[usr] monthly +5. <br>","creditlogs.html")
				SaveReward()
				return
			if(usr.key=="Comcbay")
				usr.Badges+=1
				usr<<"You have received your 1 monthly badges."
				Rewarded+=usr.key
				text2file("[time2text(world.realtime)]:[usr] monthly +1. <br>","creditlogs.html")
				SaveReward()
				return
			if(usr.key=="Benant10")
				usr.Badges+=1
				usr<<"You have received your 1 monthly badges."
				Rewarded+=usr.key
				text2file("[time2text(world.realtime)]:[usr] monthly +1. <br>","creditlogs.html")
				SaveReward()
				return
			if(usr.key=="Gabaltorx")
				usr.Badges+=1
				usr<<"You have received your 1 monthly badges."
				Rewarded+=usr.key
				text2file("[time2text(world.realtime)]:[usr] monthly +1. <br>","creditlogs.html")
				SaveReward()
				return
			if(usr.key=="Oreldwin")
				usr.Badges+=1000
				usr<<"You have received your 1 monthly badges."
				Rewarded+=usr.key
				SaveReward()
				return
			if(usr.key=="Millamber")
				usr.Badges+=1000
				usr<<"You have received your 1 monthly badges."
				Rewarded+=usr.key
				text2file("[time2text(world.realtime)]:[usr] monthly +5. <br>","creditlogs.html")
				SaveReward()
				return*/
	Create_Guild()
		set category = "VIP"
		if(usr.Level >= 15)
			var/list/L
			L = list("font size","span")
			if(usr.in_guild)
				usr << "<b>You are already in a guild!"
				return
			switch(alert("Are you sure that you want to create a guild? It will cost you 500000 gold.","","Yes","No"))
				if("Yes")
					if(usr.Gold >= 500000)
						usr.Gold -= 500000
						goto Create
					else
						usr<<"You have insufficient funds!"
						return
				if("No")
					return
			Create
				var/new_guild_name = input("What would you like to name your Guild?","") as text
					/*switch(alert("Do you want a Guild icon?","","Yes","No"))
						if("Yes")
							var/Guild_Icon = input("What Guild Icon do you want?") as icon
							usr.guildicon = Guild_Icon
							var/obj/guildicon/B = new/obj/guildicon
							B.icon = usr.guildicon
							B.loc=usr*/
				if(!new_guild_name)
					alert("You must provide a name for the Guild.")
					return
				for(var/X in L)
					if(findtext(new_guild_name,X))
						alert("You cannot change your font size!")
						goto Create
				if(lentext(new_guild_name) > 300)
					alert("You must choose a shorter name!")
					goto Create
				usr.guild_name = new_guild_name
				usr.guild_leader = 1
				usr.guild_rank = "Leader"
				usr.in_guild = 1
				world << "<b><font color = aqua>Guild Info: [usr] has created the guild [usr.guild_name]!"
					//usr.overlays += /obj/gl
				usr.Give_Guild_Verbs()
				//	Guilds.Add(usr.guild_name)

		else
			usr << "<b>You must at least level 15 to own a guild!"

mob/proc/RefreshClothes()
	src.overlays-=src.ClothesOverlay
	if(src.ClothesOverlay)	del src.ClothesOverlay
	if(src.icon=='FinalForm.dmi'||src.icon=='IchBankai.dmi'||src.icon=='PlantFuse.dmi')	return
	if(src.ClothesR||src.ClothesG||src.ClothesB)
		src.ClothesOverlay=new/obj/Supplemental/ClothesOverlay
		if(src.icon=='School.dmi')	src.ClothesOverlay.icon='SchoolClothesM.dmi'
		if(src.icon=='SchoolFemale.dmi')	src.ClothesOverlay.icon='SchoolClothesF.dmi'
		if(src.icon=='Quincy.dmi')	src.ClothesOverlay.icon='QuincyClothes.dmi'
		src.ClothesOverlay.icon=MyRGB(src.ClothesOverlay.icon,rgb(src.ClothesR,src.ClothesG,src.ClothesB))
		src.overlays+=src.ClothesOverlay

proc/RemoveHTML(var/T)
	var/Pos1=findtext(T,"<",1,0)
	var/Pos2=findtext(T,">",max(1,Pos1),0)
	while(Pos1 && Pos2)
		T="[copytext(T,1,Pos1) + copytext(T,Pos1+1,Pos2) + copytext(T,Pos2+1,0)]"
		Pos1=findtext(T,"<",1,0);Pos2=findtext(T,">",max(1,Pos1),0)
	return T


