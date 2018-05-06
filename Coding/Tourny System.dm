turf/Tournament
	Tournament_Safe_Transfer
	density = 1

/*mob/GM4
	verb
		Force_Entry(mob/M in world)
			if(Entries.Find(M))
				return
			Entries.Add(M)
			M.tourny=1
			M.loc=locate(104,90,1)
			M.safe = 1
		Check_Entries()
			var/tmp/C=0
			for(var/mob/M in Entries)
				C+=1
				usr<<M
			usr<<"[C] people in the tournament"*/

var/Tournament=0
var
	Stourny=0
	tentry=0
	tournytype=0
	stp=9
	tspot
	STS=0
	Toumin
	Toumax
var/list/Entries = list()
var/list/SEntries = list()
mob/var/tmp/tourny=0
mob/var/tmp/TournCD=0
mob/var/tmp/sfighting=0
mob/var/tmp/tarea=1
mob/var/tmp/spectating = 0
mob/var/tmp/verbcd = 0
mob/var/tmp/oldlx=0
mob/var/tmp/oldly=0
mob/var/tmp/oldlz=0
mob
	Mod
		verb
			Tournament_Begin()
				set category = "GM"
				set name = "Start Auto Tournament"
				/*if(Guildwar==1)
					QuestShow(usr,"There is a war in progress")
					return*/
				if(Tournament == 1)
					QuestShow(usr,"A Tournament is already in progress..")
					return
				if(usr.verbcd==1)
					return
				usr.verbcd = 1
				if(usr.GM >= 1)
					switch(input("Which level Tournament would you like to hold?", text) in list ("15 to 30","31 to 60","61 to 90","91 to 150","151 to 200","201 to 250","Free for all","Custom","Cancel"/*,"Big Arena"*/))
						if("15 to 30")
							tournytype="Levels 15 to 30"
							usr.verbcd = 0
							Begin()
						if("31 to 60")
							tournytype="Levels 31 to 60"
							usr.verbcd = 0
							Begin()
						if("61 to 90")
							tournytype="Levels 61 to 90"
							usr.verbcd = 0
							Begin()
						if("91 to 150")
							tournytype="Levels 91 to 150"
							usr.verbcd = 0
							Begin()
						if("151 to 200")
							tournytype="Levels 151 to 200"
							usr.verbcd = 0
							Begin()
						if("201 to 250")
							tournytype="Levels 200+"
							usr.verbcd = 0
							Begin()
						if("Free for all")
							tournytype="No Level limit"
							usr.verbcd = 0
							Begin()
						if("Custom")
							tournytype="Custom"
							var/x=input("What will the minimum level to join be?")as num
							var/f=input("What will the maximum level to join be?")as num
							Toumin= x
							Toumax = f
							usr.verbcd = 0
							switch(input("Will this be a Skill based tournament?", text) in list ("Yes","No"))
								if("Yes")
									SkillTour = 1
									Begin()
								if("No")
									Begin()
						if("Cancel")
							usr.verbcd = 0
							return

				else
					switch(input("Which level Tournament would you like to hold?", text) in list ("15 to 30","31 to 60","61 to 90","91 to 150","151 to 200","201 to 250","Free for all",,"Custom","Cancel"/*,"Big Arena"*/))
						if("15 to 30")
							tournytype="Levels 15 to 30"
							usr.verbcd = 0
							Begin()
						if("31 to 60")
							tournytype="Levels 31 to 60"
							usr.verbcd = 0
							Begin()
						if("61 to 90")
							tournytype="Levels 61 to 90"
							usr.verbcd = 0
							Begin()
						if("91 to 150")
							tournytype="Levels 91 to 150"
							usr.verbcd = 0
							Begin()
						if("151 to 200")
							tournytype="Levels 151 to 200"
							usr.verbcd = 0
							Begin()
						if("201 to 250")
							tournytype="Levels 200+"
							usr.verbcd = 0
							Begin()
						if("Free for all")
							tournytype="No Level limit"
							usr.verbcd = 0
							Begin()
						if("Custom")
							tournytype="Custom"
							var/x=input("What will the minimum level to join be?")as num
							var/f=input("What will the maximum level to join be?")as num
							Toumin= x
							Toumax = f
							usr.verbcd = 0
							switch(input("Will this be a Skill based tournament?", text) in list ("Yes","No"))
								if("Yes")
									SkillTour = 1
									Begin()
								if("No")
									Begin()
						if("Cancel")
							usr.verbcd = 0
							return

proc
	Begin()
		if(Tournament == 1)
			return
		spawn(1)
			Tournament=1
			tentry = 1
			for(var/mob/M in world)
				if(M.client)
					M.verbs+=typesof(/mob/tournyverb/verb)
					//if(tournytype == "Big Arena")
			if(tournytype =="Custom" && SkillTour == 1)		//	M.verbs+=typesof(/mob/stournyverb/verb)
				world<<"<center><font color=green size=3><B>A lvl [Toumin] to [Toumax] Skill Based Tournament Has Been Started!</center></b>"
				sleep(600)
			else
				if(tournytype =="Custom" && SkillTour == 0)		//	M.verbs+=typesof(/mob/stournyverb/verb)
					world<<"<center><font color=green size=3><B>A lvl [Toumin] to [Toumax] Tournament Has Been Started!</center></b>"
					sleep(300)
				else
					world<<"<center><font color=green size=3><B>A [tournytype] Tournament Has Been Started!</center></b>"
					sleep(300)
			if(Tournament==0)
			 return
			if(Entries.len<=1)
				for(var/mob/P in world)
					if(P.client)
						P.verbs-=typesof(/mob/tournyverb/verb)
				world<<"<center><font color=green><B>Insufficient Participants , Tournament cancelled.</center></B>"
				Tournament = 0
				for(var/mob/P in Entries)
					P.loc=locate(P.oldlx,P.oldly,P.oldlz)
					Entries.Remove(P)
				return
			world<<"<center><font color=green><B>Tournament Entries are now over. Tournament commencing.</center></B>"
			tentry = 0
			for(var/mob/K in world)
				if(K.client)
					K.verbs-=/mob/tournyverb/verb/Join
					K.verbs-=/mob/tournyverb/verb/Leave
			Tournament_AI()
			//spawn(18000)
			//	Begin()

mob
	tournyverb
		verb
			Join()
				set category="Tournament"
				if(SkillTour==1)
					var/o =0
					for(var/obj/Items/E in usr.EquipmentList)
						o++
					if(o >=1)
						usr <<"<font color=yellow> <b>You must unequip everything to join a skill based Tournament.</b>"
						return
				if(Stourny)
					if(usr.tourny)
						usr<<"<b>You're already in the tournament!"
						return
					if(usr.jailed==1)
						usr<<"<b>Sorry, you must serve your time in Jail first!"
						return
					if(usr.TournCD==1)
						QuestShow(usr,"You won the previous Tournament - You must wait 15 minutes to join another..")
						return
					if(usr.InventoryOpen==1)
						QuestShow(usr,"You must close your Inventory.")
						return
					usr.oldlx=usr.x
					usr.oldly=usr.y
					usr.oldlz=usr.z
					Entries.Add(usr)
					usr.tourny=1
					usr<<"<b>You entered the tournament!"
					usr.loc=locate(16,197,13)
					usr.PVP = 0
					usr.STM = usr.MaxSTM
					usr.REI = usr.MaxREI
				else
					if(usr.jailed==1)
						usr<<"<b>Sorry, you must serve your time in Jail first!"
						return
					if(usr.tourny)
						usr<<"You're already in the tournament!"
						return
					if(usr.TournCD==1)
						QuestShow(usr,"You won the previous Tournament - You must wait 15 minutes to join another..")
						return
					if(tournytype=="Levels 15 to 30"&&usr.Level>=31 || tournytype=="Levels 15 to 30"&&usr.Level < 15)
						usr<<"This tournament is for Levels 15 to 30 only!"
						return
					if(tournytype=="Levels 31 to 60"&&usr.Level < 31||tournytype=="Levels 31 to 60"&&usr.Level>60)
						usr<<"This tournament is for Levels 31 to 60 only!"
						return
					if(tournytype=="Levels 61 to 90"&&usr.Level< 61||tournytype=="Levels 61 to 90"&&usr.Level> 90)
						usr<<"This tournament is for Levels 61 to 90 only!"
						return
					if(tournytype=="Levels 91 to 150"&&usr.Level< 91||tournytype=="Levels 91 to 150"&&usr.Level> 150)
						usr<<"This tournament is for Levels 91 to 150 only!"
						return
					if(tournytype=="Levels 151 to 200"&&usr.Level< 151||tournytype=="Levels 151 to 200"&&usr.Level> 200)
						usr<<"This tournament is for Levels 150 to 200 only!"
						return
					if(tournytype=="Levels 200+"&&usr.Level< 200)
						usr<<"This tournament is for Levels 200 and above only!"
						return
					if(tournytype=="Custom"&&usr.Level< Toumin||tournytype=="Custom"&&usr.Level> Toumax)
						usr<<"This tournament is for Levels [Toumin] and [Toumax]!"
						return
					Entries.Add(usr)
					usr.oldlx=usr.x
					usr.oldly=usr.y
					usr.oldlz=usr.z
					usr.tourny=1
					usr<<"<b>You have entered the Tournament!"
					usr.loc=locate(16,197,13)
					//usr.safe = 1
					//usr.invisibility=0
					//usr.see_invisible=0
					usr.STM = usr.MaxSTM
					usr.REI = usr.MaxREI
			Leave()
				set category="Tournament"
				if(!usr.tourny)
					usr<<"<b>You are not currently in any Tournament!"
					return
				Entries.Remove(usr)
				usr.tourny=0
				//usr.safe=1
				usr.STM = usr.MaxSTM
				usr.loc=locate(usr.oldlx,usr.oldly,usr.oldlz)
				//usr.loc=locate(158,22,3)

			Spectate(M in Entries)
				set category="Tournament"
				set name="Watch Combatant"
				if(usr.OnLevelScreen==1)
					return
				usr.client.perspective = EYE_PERSPECTIVE
				usr.client.eye = M
				usr.spectating = 1
				usr<<"<b>You are now spectating [M]"


			Unspectate()
				set category="Tournament"
				set name="Stop Watching"
				usr.client.perspective = EYE_PERSPECTIVE
				usr.client.eye = usr
				usr.spectating = 0
				usr<<"<b>You have stopped spectating."


proc
	Tournament_AI()
		if(Entries.len==1)
			Tournament = 0
			SkillTour = 0
			world<<"<center><B><font color=green>The Tournament has ended!The winner is:<center></b>"
			for(var/mob/K in Entries)
				world<<"<center><b><font color=red>[K]<font color=green>!!</center></b>"
				world<<"<center><b><font color=green>[K] <font color=green>has received a prize of [K.Level*20] Honor and [K.Level*5] gold and [K.Level*1000] exp! Congratulations!</center></b>"
				K<<"<font color=yellow><b>You have received [K.Level*50] honor and [K.Level*5] gold and [K.Level*5000] exp!!"
				var/O = rand(1,50)
				if(O==50)
					K.Badges+=1
					world<<"<center><b><font color=green>[K] <font color=green>has received one Honor Badge for winning the Tournament! Congratulations!</center></b>"
				K.tourny = 0
				K.loc=locate(K.oldlx,K.oldly,K.oldlz)
				K.Honor += K.Level*50
				K.Gold += K.Level*5
				K.Exp += K.Level*5000
				K.TournCD=1
				//K.safe = 1
				/*spawn(3000)
					K.loc=locate(44,186,1)
					K<<"<center><b> Staff: Times Up</center></b>"
					K.ownertraining = 0*/
				Entries.Remove(K)
				spawn(18000)
				if(K)
					K.TournCD=0
			for(var/mob/M in world)
				if(M.client)
					if(M.spectating == 1)
						M.client.perspective = EYE_PERSPECTIVE
						M.client.eye = M
						M.tourny=0
						M.verbs-=typesof(/mob/tournyverb/verb)
						M.spectating = 0
					else
						M.tourny=0
						M.verbs-=typesof(/mob/tournyverb/verb)
			return

		doit
			for(var/mob/Player/M in Entries)
				//	if(M in Entries)
				var/A=pick(Entries)
				var/B=pick(Entries)
				if(A==B)
					goto doit
				sleep(10)
				for(var/mob/Player/X in Entries)
					X<<"<center><B><font color=green>Combatants prepare! The matches will now commence.</center></B>"
				sleep(20)
				for(var/mob/Player/X in Entries)
					X<<"<center><B><font color=green>The next match will be....</center></B>"
				sleep(30)
				for(var/mob/Player/X in Entries)
					X<<"<center><B><font color=green>[A] .VS. [B]!</center></B>"
				B:loc=locate(37,154,13)
				A:loc=locate(1,156,13)
				Fight(A,B)
				B:dir=WEST
				A:dir=EAST
				B:STM=B:MaxSTM
				B:REI=B:MaxREI
				A:STM=A:MaxSTM
				A:REI=A:MaxREI
				B:CanMove=0
				A:CanMove=0
				for(var/mob/Player/X in Entries)
					M<<"<center><B><font color=green>3</center></B>"
				sleep(10)
				for(var/mob/Player/X in Entries)
					M<<"<center><B><font color=green>2</center></B>"
				sleep(10)
				for(var/mob/Player/X in Entries)
					M<<"<center><B><font color=green>1</center></B>"
				sleep(10)
				for(var/mob/Player/X in Entries)
					M<<"<center><B><font color=green>Let the match commence!</center></B>"
						//B:safe = 0
						//A:safe = 0
				B:CanMove=1
				A:CanMove=1
				B:STM=B:MaxSTM
				B:REI=B:MaxREI
				A:STM=A:MaxSTM
				A:REI=A:MaxREI
				A:SpiritForm = 1
				B:SpiritForm = 1
				B:PVP=1
				A:PVP=1
				return

proc
	Fight(mob/A,mob/B)
		begin
			if(A.z != 13)
				B.Honor += 10
				//Entries.Remove(A)
				//world<<"<b><font color=green>Tournament Info : [B]<font color=white><b> has won against [A]!<center> [B] has received 10 Honor."
				//B.loc=locate(16,197,13)
				//Tournament_AI()
				return
			if(B.z != 13)
				//world<<"<b><font color=green>Tournament Info : [A]<font color=white><b> has won against [B]!<center> [A] has received 10 Honor."
				A.Honor += 10
				//Entries.Remove(B)
				//A.loc=locate(16,197,13)
				//Tournament_AI()
				//A.safe = 1
				//B.loc=locate(158,22,3)
				return
			else
				spawn(1)
					goto begin

mob/Mod
	verb
		End_Auto_Tourny()
			set category = "GM"
			if(usr.key=="XXXxJokerxXXX")
				usr<<"Fuck you Raven"
				return
			Entries -= Entries
			SEntries -= SEntries
			for(var/mob/Player/M in world)
				if(M.tourny)
					Entries.Remove(M)
					SEntries.Remove(M)
					Tournament = 0
					M.tourny = 0
					M.sfighting = 0
					M.loc=locate(M.oldlx,M.oldly,M.oldlz)
					M.PVP=0
					tspot=0
					STS=0
					M.verbs-=typesof(/mob/tournyverb/verb)
				else
					M.verbs-=typesof(/mob/tournyverb/verb)
			Tournament = 0
			SkillTour=0
			world<<"<center><B><font color=red>The Tournament has been cancelled by [usr]<center></b>"





/*mob/Logout()
	//src.verbs-=typesof(/mob/tournyverb/verb)
	if(src.tourny)
		Entries.Remove(src)
		world << "<center><font size=2><font color = red><b><center> [src] logged off and has therefore been disqualified."*/