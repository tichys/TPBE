mob
	var
		guild_name = ""
		guild_leader = 0
		guild_co_leader = 0
		guild_member = 0
		guild_rank = ""
		in_guild = 0
		guildicon
		guild_war = 0

/*obj
	guildicon
		name = "Guild Icon"
		icon = 'turf.dmi'
		verb
			Wear()
				if(src.worn)
					src.worn = 0
					usr.overlays -= src.icon
				else
					src.worn = 1
					usr.overlays += src.icon
			Delete()
				if(src.worn)
					usr<<"Not while its being worn"
				else
					del(src)*/


var
	list/
		Guilds = list()
		GMembers = list()
mob
	verb
		/*Create_Guild()
			set category = "Commands"
			if(usr.Level >= 15)
				var/list/L
				L = list("font size","span")
				if(usr.in_guild)
					usr << "<b>You are already in a guild!"
					return
				switch(alert("Are you sure that you want to create a guild? It will cost you 5 gold.","","Yes","No"))
					if("Yes")
						if(usr.Gold >= 500)
							usr.Gold -= 500
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
				usr << "<b>You must at least level 15 to own a guild!"*/

var/Inhouse = 0
mob/var/Hasicon



mob/Guild_Leader
	/*verb
		Give_Guild_Icon()
			set category = "Guild"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.guild_name == usr.guild_name)
						if(!M.Hasicon)
							Menu.Add(M)
			var/mob/A = input("Who do you want to give the icon to?","") as null | anything in Menu
			var/Guild_Icon = input("What Guild Icon do you want?") as icon
			var/obj/guildicon/B = new/obj/guildicon
			B.icon = Guild_Icon
			B.loc=A
	verb
		Declare_War()
			set category = "Guild"
			var/list/Menu = list()
			if(usr.guild_name == "")
				return
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.guild_name != usr.guild_name)
					Menu.Add(M.guild_name)
			var/mob/A = input("Which Guild Do you want to Declare War Against?","") as null | anything in Menu
			world<<"[usr.guild_name] Has declared war on [A.guild_name]"
			world<<"The Leader who delcared war was [usr]!"
			for(var/mob/X in world)
				if(X.guild_name == A)
					X.loc=locate(96,65,7)
					X.guild_war = 1
					X.safe=1
				if(usr.guild_name == X.guild_name)
					X.loc=locate(60,97,7)
					X.guild_war = 1
					X.safe=0*/
	verb
		Guild_Invite()
			set category = "Guild"
			set name="Add Member"
			var/list/Menu = list()
			for(var/mob/Player/M in world)
				if(M.name != usr.name)
					if(!M.in_guild)
						Menu.Add(M)
			var/mob/M = input("Who would you like to invite to the Guild?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				switch(alert(M,"[usr] has invited you to join [usr.guild_name]. Would you like to join?","","Yes","No"))
					if("Yes")
						M.guild_name = usr.guild_name
						M.guild_member = 1
						M.guild_rank = "Member"
						M.in_guild = 1
						M.Give_Guild_Verbs()
						//var/obj/guildicon/A = new/obj/guildicon
						//A.icon = usr.guildicon
						//A.loc=M
						SaveConfig()
						world << "<b><font color = aqua>Guild Info: [M] has joined the guild [usr.guild_name]!"
					if("No")
						usr << "[M] does not wish to join your Guild."
						return
		Guild_Boot()
			set category = "Guild"
			set name="Dismiss Member"
			var/list/Menu = list()
			for(var/mob/Player/M in world)
				if(M.name != usr.name)
					if(M.in_guild)
						if(M.guild_name == usr.guild_name)
							Menu.Add(M)
			var/mob/M = input("Which member would you like to remove from the Guild?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				if(M.guild_leader)
					alert("You can not remove the Guild Leader!")
					return
				switch(alert("Are you sure you want to remove [M] from the guild?","","Yes","No"))
					if("Yes")
						world << "<b><font color = aqua>Guild Info: [usr] has dismissed [M] from the guild [usr.guild_name]!"
						M.leaveguild()
						M.guild_name = "None"
						M.guild_leader = 0
						M.guild_co_leader = 0
						M.guild_member = 0
						M.guild_rank = ""
						M.in_guild = 0
						GMembers.Remove(M)
						SaveConfig()
					if("No")
						return
		Change_Rank()
			set category = "Guild"
			set name = "Promote Member"
			var/list/Menu = list()
			for(var/mob/Player/M in world)
				if(M.name != usr.name)
					if(M.in_guild)
						if(M.guild_name == usr.guild_name)
							Menu.Add(M)
			var/mob/M = input("Whose rank would you like to modify?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				if(M.guild_leader)
					alert("You may not change the Guild Leader's Rank.")
				switch(input("What Rank would you like to appoint [M] to?")in list("Co-Leader","Member","Cancel"))
					if("Co-Leader")
						M.guild_co_leader = 1
						M.Give_Guild_Verbs()
						M.guild_rank = "Co-Leader"
					if("Member")
						M.guild_member = 1
						M.leaveguild()
						M.Give_Guild_Verbs()
						M.guild_rank = "Member"
					if("Cancel")
						return
		New_Rank()
			set category = "Guild"
			var/list/Menu = list()
			for(var/mob/Player/M in world)
				if(M.name != usr.name)
					if(M.in_guild)
						if(M.guild_name == usr.guild_name)
							Menu.Add(M)
			var/mob/M = input("Whose rank would you like to modify?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				var/ID=input("What name would you like to set [M]'s Rank to?")as text
		  M.guild_rank=ID
		Guild_Announce(T as text)
			set category = "Guild"
			var/list/L
			L = list("font size")
			if(lentext(T) > 500)
				alert("Your message must be less than 500 characters long.")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.guild_name == usr.guild_name)
				 X << "<font size=2><font color = red><b><center>Guild Announcement by [usr]  :<center><br><font color=white><b>[T]"

mob/Guild_Verbs
	verb
		GuildSay(T as text)
			set category = "Guild"
			set name = "Guild Chat"
			var/list/L
			L = list("font size")
			if(lentext(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.guild_name == usr.guild_name)
					X << "<b><font color = Green>(<font color=white>Guild Chat</font>)[src.name]: <font color=white><b>[T]</font>"
		Guild_Who()
			set category = "Guild"
			GWhoProc()
		/*	var/tmp/C = 0
			usr << "<font size=1><b><font color=silver><center>---------------------GUILD WHO------------------------"
			for(var/mob/Player/M in world)
				if(M.in_guild)
					if(M.guild_name == usr.guild_name)
						C += 1
						usr << "<font size=1><b><font color=red>[M.name]([M.key])([M.guild_rank])-[M.Class]"
			usr << "<b><font color = red>[C] Guild Members Online!"
			usr << "<font size=1><b><font color=silver><center>---------------------GUILD WHO------------------------"*/
		Guild_Leave()
			set category = "Guild"
			switch(alert("Are you sure you want to leave the Guild [src.guild_name]?","","Yes","No"))
				if("Yes")
					if(src.guild_leader ==1)
						switch(input("If you leave the guild, it will be disbanded, are you sure?")in list("Yes","No"))
							if("Yes")
								world << "<br><font color=green>INFO:<font color=white>[src.guild_name] has been disbanded</font>"
								for(var/mob/Player/X in world)
									if(X.guild_name == src.guild_name)
										X.leaveguild(X)
								src.leaveguild()
							if("No")
								return
					else

						world << "<b><font color = aqua>Guild Info: [usr] has left the guild [usr.guild_name]!"
						src.guild_name = ""
						src.guild_leader = 0
						src.guild_co_leader = 0
						src.guild_member = 0
						src.guild_rank = ""
							/*	src.overlays -= /obj/gl
								src.overlays -= /obj/gl
								src.overlays -= /obj/gl
								src.overlays -= /obj/gl*/
						src.in_guild = 0
						src.leaveguild()
						//Guilds.Remove(src.guild_name)







mob
	proc
		Give_Guild_Verbs()
			if(src.guild_leader==1)
				src.verbs += typesof(/mob/Guild_Leader/verb)
				src.verbs += typesof(/mob/Guild_Verbs/verb)
			if(src.guild_co_leader==1)
				src.verbs += typesof(/mob/Guild_Leader/verb)
				src.verbs += typesof(/mob/Guild_Verbs/verb)
			if(src.guild_member==1)
				src.verbs += typesof(/mob/Guild_Verbs/verb)
		leaveguild()
			src.verbs -= typesof(/mob/Guild_Leader/verb)
			src.verbs -= typesof(/mob/Guild_Verbs/verb)
			src.guild_name = ""
			src.guild_leader = 0
			src.guild_co_leader = 0
			src.guild_member = 0
			src.guild_rank = ""
			src.in_guild = 0
mob/proc/GWhoProc(var/list/SortedPlayers)
	if(!SortedPlayers)
		var/list/AllPlayers=list();SortedPlayers=list()
		for(var/mob/Player/M in world)
			if(M.client && M.guild_name==usr.guild_name)	AllPlayers+=M
		while(AllPlayers.len>=1)
			var/HighestLevel=0;var/ThisMob
			for(var/mob/M in AllPlayers)
				if(M.Level>HighestLevel)	{HighestLevel=M.Level;ThisMob=M}
			AllPlayers-=ThisMob;SortedPlayers+=ThisMob
	var/LevelSort="<a href='?src=\ref[src];action=SortWho;SortBy=Level'>Level</a>"
	var/RankSort="<a href='?src=\ref[src];action=SortWho;SortBy=guild_rank'>Guild Rank</a>"
	var/TextList="<html><body bgcolor=black><b><font color=gray>"
	TextList+="<title>Guild Who List</title>"
	TextList+="<center><table border=1 bgcolor=black bordercolor=gray>"
	TextList+="<tr><td colspan=6><center><b><font color=gray>[guild_name]"
	TextList+="<tr><td><b><font color=gray>Name<td><b><font color=gray>Key"
	TextList+="<td><b><font color=gray>[LevelSort]<td><b><font color=gray>Class"
	TextList+="<td colspan=2><b><font color=gray>[RankSort]"
	var/FM="<td align=center><b><font color=gray>"
	for(var/mob/M in SortedPlayers)
	//	var/Phours=round(M.PlayTime/60/60)
	//	var/Pminutes=round(M.PlayTime/60-(60*Phours))
		var/SubStar=""
		if(M.Subscriber)	SubStar="* "
		//var/Pseconds=round(M.PlayTime-(60*Pminutes)-(60*Phours*60))
		TextList+="<tr><td><b><font color=gray><a href='?src=\ref[src];CheckPlayer=\ref[M]'>[M.name]"
		TextList+="<td><b><font color=gray>[SubStar][M.key]"
		TextList+="<td><b><font color=gray><center>[M.Level]<td><b><font color=gray>[M.Class]"
		TextList+="[FM]<font color=red>[M.guild_rank]</font>"
	TextList+="<tr><td colspan=6><b><font color=gray><center>[SortedPlayers.len] Guild Members Online"
	usr<<browse("[TextList]","window=WhoBrowser")
	winset(usr,"WhoWindow","is-visible=true")

mob/proc/
	Race_Change2()
		var/LastRace=src.Class
		if(alert("Race Change [src]?","Race Change","Yes","Cancel")=="Yes")
			if(LastRace=="Bount")
				for(var/mob/Pets/BountPets/P in src.Pets)
					src.Pets-=P;del P
			switch(alert("Which race will you make [src]?","Race Change","Bount","Soul Reaper","Quincy"))
				if("Quincy")
					src.Class="Quincy"
					src.Skills+=new/obj/Skills/Quincy/Spirit_Arrow
					src.Skills+=new/obj/Skills/Universal/Flash_Step
					src.CanShunpo=1
					src.StmRegenBonus=0
					leaveSquad2(src)
					src.Respec()
					src<<"<b><font color=red>[src] has changed your race to Quincy.</font></b>"
					text2file("[time2text(world.realtime)]:[usr] changed [src] to a Quincy. <br>","gmlog.html")
				if("Soul Reaper")
					src.Class="Soul Reaper"
					src.Skills+=new/obj/Skills/SoulReaper/Basic_Combat
					src.Skills+=new/obj/Skills/SoulReaper/Guard
					src.ComboList=list("S1","D1","F1","F2","F3")
					src.ReiRegenBonus=0
					leaveSquad2(src)
					src.Respec()
					src<<"<b><font color=red>[src] has changed your race to Soul Reaper.</font></b>"
					text2file("[time2text(world.realtime)]:[usr] changed [src] to a Soul Reaper. <br>","gmlog.html")
				if("Bount")
					src.Class="Bount"
					src.Skills+=new/obj/Skills/Bount/Summon_Pet
					src.Skills+=new/obj/Skills/Bount/Dismiss_Pet
					src.Skills+=new/obj/Skills/Bount/Heal_Pet
					src.Skills+=new/obj/Skills/Bount/Pet_Skills
					src.Pets+=new/mob/Pets/BountPets/Fly_Trap
					for(var/mob/Pets/P in usr.Pets)	P.Owner=usr
					src.GainedSun=0
					src.GainedEvoSun=0
					src.BountPetCheck()
					src.ComboList=list("F1","F2","F3")
					leaveSquad2(src)
					src.Respec()
					src<<"<b><font color=red>[src] has changed your race to Bount.</font></b>"
					text2file("[time2text(world.realtime)]:[usr] changed [src] to a Bounto. <br>","gmlog.html")