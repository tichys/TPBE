var/list/GMs=list()
var/list/Admins=list()
var/list/MuteList=list()
var/list/BanList=list()
var/list/Mods=list()
var/list/Captain1=list()
var/list/Captain2=list()
var/list/Captain3=list()
var/list/Captain4=list()
var/list/Captain5=list()
var/list/Captain6=list()
var/list/Captain7=list()
var/list/Captain8=list()
var/list/Captain9=list()
var/list/Captain10=list()
var/list/Captain11=list()
var/list/Captain12=list()
var/list/Captain13=list()
var/list/SquadOne=list()
var/list/SquadTwo=list()
var/list/SquadThree=list()
var/list/SquadFour=list()
var/list/SquadFive=list()
var/list/SquadSix=list()
var/list/SquadSeven=list()
var/list/SquadEight=list()
var/list/SquadNine=list()
var/list/SquadTen=list()
var/list/SquadEleven=list()
var/list/SquadTwelve=list()
var/list/SquadThirteen=list()


datum/PlayerInfo
	var/name
	var/Key
	var/IP
	var/Reason
	var/Expires
	var/ExpireText

mob/proc/IsMuted()
	if(src.key!="Millamber")
		if("All" in MuteList)	{src<<"The World is Muted";return 1}
	if(src.CheckGlobalMute())	return 1
	for(var/datum/PlayerInfo/P in MuteList)
		if(P.IP==src.client.address || P.Key==src.key)	if(!src.MuteExpire(P))	return 1
	return 0

mob/proc/MuteExpire(var/datum/PlayerInfo/P)
	if(P.Expires)
		if(sorttext(time2text(world.realtime,"YYYYMMDDhhmm"),P.Expires)==-1)
			world<<"<font size=1>The Mute on [src] has Expired"
			MuteList-=P;del P
			return 1
	src<<"You are Currently Muted"
	src<<"Reason: [P.Reason]"
	if(P.ExpireText)	src<<"Effective Until: [P.ExpireText]"
	return 0


mob/proc/staffCheck()
	if(src.key=="Millamber"||src.key=="Nikorayu")
		return
	else
		src.verbs-=typesof(/mob/GM/verb)
		src.verbs-=typesof(/mob/Mod/verb)
	if(src.key in GMs_keys)
		src.verbs += typesof(/mob/Mod/verb)
		src.verbs += typesof(/mob/GM/verb)
		src.GM=2
	if(src.key in Mods_keys)
		src.verbs += typesof(/mob/Mod/verb)
		src.GM=1

proc
	saveSecurity(save as text)
		switch(save)
/*			if("Lotto")
				var/savefile/Lotto=new("eSecurity/Lotto.sav")
				Lotto["TicketsHanded"]<<TicketsHanded
			if("Lotto2")
				var/savefile/Lotto2=new("eSecurity/Lotto2.sav")
				Lotto2["TicketsRolled"]<<TicketsRolled*/
			if("Mods")
				var/savefile/Mods=new("eSecurity/Mods.sav")
				Mods["Mods_keys"]<<Mods_keys
			if("GMs")
				var/savefile/GMs=new("eSecurity/GMs.sav")
				GMs["GMs_keys"]<<GMs_keys
			if("Captain1")
				var/savefile/Captain1=new("eSecurity/Captain1.sav")
				Captain1["CaptainOne"]<<CaptainOne
			if("Captain2")
				var/savefile/Captain2=new("eSecurity/Captain2.sav")
				Captain2["CaptainTwo"]<<CaptainTwo
			if("Captain3")
				var/savefile/Captain3=new("eSecurity/Captain3.sav")
				Captain3["CaptainThree"]<<CaptainThree
			if("Captain4")
				var/savefile/Captain4=new("eSecurity/Captain4.sav")
				Captain4["CaptainFour"]<<CaptainFour
			if("Captain5")
				var/savefile/Captain5=new("eSecurity/Captain5.sav")
				Captain5["CaptainFive"]<<CaptainFive
			if("Captain6")
				var/savefile/Captain6=new("eSecurity/Captain6.sav")
				Captain6["CaptainSix"]<<CaptainSix
			if("Captain7")
				var/savefile/Captain7=new("eSecurity/Captain7.sav")
				Captain7["CaptainSeven"]<<CaptainSeven
			if("Captain8")
				var/savefile/Captain8=new("eSecurity/Captain8.sav")
				Captain8["CaptainEight"]<<CaptainEight
			if("Captain9")
				var/savefile/Captain9=new("eSecurity/Captain9.sav")
				Captain9["CaptainNine"]<<CaptainNine
			if("Captain10")
				var/savefile/Captain10=new("eSecurity/Captain10.sav")
				Captain10["CaptainTen"]<<CaptainTen
			if("Captain11")
				var/savefile/Captain11=new("eSecurity/Captain11.sav")
				Captain11["CaptainEleven"]<<CaptainEleven
			if("Captain12")
				var/savefile/Captain12=new("eSecurity/Captain12.sav")
				Captain12["CaptainTwelve"]<<CaptainTwelve
			if("Captain13")
				var/savefile/Captain13=new("eSecurity/Captain13.sav")
				Captain13["CaptainThirteen"]<<CaptainThirteen
			if("Praetor")
				var/savefile/Praetor=new("eSecurity/Praetor.sav")
				Praetor["QuincyUno"]<<QuincyUno
			if("SquadOne")
				var/savefile/SquadOne=new("eSecurity/SquadOne.sav")
				SquadOne["Squad1"]<<Squad1
			if("SquadTwo")
				var/savefile/SquadTwo=new("eSecurity/SquadTwo.sav")
				SquadTwo["Squad2"]<<Squad2
			if("SquadThree")
				var/savefile/SquadThree=new("eSecurity/SquadThree.sav")
				SquadThree["Squad3"]<<Squad3
			if("SquadFour")
				var/savefile/SquadFour=new("eSecurity/SquadFour.sav")
				SquadFour["Squad4"]<<Squad4
			if("SquadFive")
				var/savefile/SquadFive=new("eSecurity/SquadFive.sav")
				SquadFive["Squad5"]<<Squad5
			if("SquadSix")
				var/savefile/SquadSix=new("eSecurity/SquadSix.sav")
				SquadSix["Squad6"]<<Squad6
			if("SquadSeven")
				var/savefile/SquadSeven=new("eSecurity/SquadSeven.sav")
				SquadSeven["Squad7"]<<Squad7
			if("SquadEight")
				var/savefile/SquadEight=new("eSecurity/SquadEight.sav")
				SquadEight["Squad8"]<<Squad8
			if("SquadNine")
				var/savefile/SquadNine=new("eSecurity/SquadNine.sav")
				SquadNine["Squad9"]<<Squad9
			if("SquadTen")
				var/savefile/SquadTen=new("eSecurity/SquadTen.sav")
				SquadTen["Squad10"]<<Squad10
			if("SquadEleven")
				var/savefile/SquadEleven=new("eSecurity/SquadEleven.sav")
				SquadEleven["Squad11"]<<Squad11
			if("SquadTwelve")
				var/savefile/SquadTwelve=new("eSecurity/SquadTwelve.sav")
				SquadTwelve["Squad12"]<<Squad12
			if("SquadThirteen")
				var/savefile/SquadThirteen=new("eSecurity/SquadThirteen.sav")
				SquadThirteen["Squad13"]<<Squad13
			if("QuincyBrotherhood")
				var/savefile/QuincyBrotherhood=new("eSecurity/QuincyBrotherhood.sav")
				QuincyBrotherhood["Quincy1"]<<Quincy1


	loadSecurity()
		var/savefile/Mods=new("eSecurity/Mods.sav")
		var/savefile/GMs=new("eSecurity/GMs.sav")
/*		var/savefile/Lotto=new("eSecurity/Lotto.sav")
		var/savefile/Lotto2=new("eSecurity/Lotto.sav")*/
		var/savefile/Captain1=new("eSecurity/Captain1.sav")
		var/savefile/Captain2=new("eSecurity/Captain2.sav")
		var/savefile/Captain3=new("eSecurity/Captain3.sav")
		var/savefile/Captain4=new("eSecurity/Captain4.sav")
		var/savefile/Captain5=new("eSecurity/Captain5.sav")
		var/savefile/Captain6=new("eSecurity/Captain6.sav")
		var/savefile/Captain7=new("eSecurity/Captain7.sav")
		var/savefile/Captain8=new("eSecurity/Captain8.sav")
		var/savefile/Captain9=new("eSecurity/Captain9.sav")
		var/savefile/Captain10=new("eSecurity/Captain10.sav")
		var/savefile/Captain11=new("eSecurity/Captain11.sav")
		var/savefile/Captain12=new("eSecurity/Captain12.sav")
		var/savefile/Captain13=new("eSecurity/Captain13.sav")
		var/savefile/Praetor=new("eSecurity/Praetor.sav")
		var/savefile/SquadOne=new("eSecurity/SquadOne.sav")
		var/savefile/SquadTwo=new("eSecurity/SquadTwo.sav")
		var/savefile/SquadThree=new("eSecurity/SquadThree.sav")
		var/savefile/SquadFour=new("eSecurity/SquadFour.sav")
		var/savefile/SquadFive=new("eSecurity/SquadFive.sav")
		var/savefile/SquadSix=new("eSecurity/SquadSix.sav")
		var/savefile/SquadSeven=new("eSecurity/SquadSeven.sav")
		var/savefile/SquadEight=new("eSecurity/SquadEight.sav")
		var/savefile/SquadNine=new("eSecurity/SquadNine.sav")
		var/savefile/SquadTen=new("eSecurity/SquadTen.sav")
		var/savefile/SquadEleven=new("eSecurity/SquadEleven.sav")
		var/savefile/SquadTwelve=new("eSecurity/SquadTwelve.sav")
		var/savefile/SquadThirteen=new("eSecurity/SquadThirteen.sav")
		var/savefile/QuincyBrotherhood=new("eSecurity/QuincyBrotherhood.sav")
		Mods["Mods_keys"]>>Mods_keys
		GMs["GMs_keys"]>>GMs_keys
/*		Lotto["TicketsHanded"]>>TicketsHanded
		Lotto2["TicketsRolled"]>>TicketsRolled*/
		Captain1["CaptainOne"]>>CaptainOne
		Captain2["CaptainTwo"]>>CaptainTwo
		Captain3["CaptainThree"]>>CaptainThree
		Captain4["CaptainFour"]>>CaptainFour
		Captain5["CaptainFive"]>>CaptainFive
		Captain6["CaptainSix"]>>CaptainSix
		Captain7["CaptainSeven"]>>CaptainSeven
		Captain8["CaptainEight"]>>CaptainEight
		Captain9["CaptainNine"]>>CaptainNine
		Captain10["CaptainTen"]>>CaptainTen
		Captain11["CaptainEleven"]>>CaptainEleven
		Captain12["CaptainTwelve"]>>CaptainTwelve
		Captain13["CaptainThirteen"]>>CaptainThirteen
		Praetor["QuincyUno"]>>QuincyUno
		SquadOne["Squad1"]>>Squad1
		SquadTwo["Squad2"]>>Squad2
		SquadThree["Squad3"]>>Squad3
		SquadFour["Squad4"]>>Squad4
		SquadFive["Squad5"]>>Squad5
		SquadSix["Squad6"]>>Squad6
		SquadSeven["Squad7"]>>Squad7
		SquadEight["Squad8"]>>Squad8
		SquadNine["Squad9"]>>Squad9
		SquadTen["Squad10"]>>Squad10
		SquadEleven["Squad11"]>>Squad11
		SquadTwelve["Squad12"]>>Squad12
		SquadThirteen["Squad13"]>>Squad13
		QuincyBrotherhood["Quincy1"]>>Quincy1
		if(!length(GMs_keys)) GMs_keys=list()
		if(!length(Mods_keys)) Mods_keys=list()
/*		if(!length(TicketsHanded)) TicketsHanded=list()
		if(!length(TicketsRolled)) TicketsRolled=list()*/
		if(!length(Squad1)) Squad1=list()
		if(!length(Squad2)) Squad2=list()
		if(!length(Squad3)) Squad3=list()
		if(!length(Squad4)) Squad4=list()
		if(!length(Squad5)) Squad5=list()
		if(!length(Squad6)) Squad6=list()
		if(!length(Squad7)) Squad7=list()
		if(!length(Squad8)) Squad8=list()
		if(!length(Squad9)) Squad9=list()
		if(!length(Squad10)) Squad10=list()
		if(!length(Squad11)) Squad11=list()
		if(!length(Squad12)) Squad12=list()
		if(!length(Squad13)) Squad13=list()
		if(!length(Quincy1)) Quincy1=list()
		if(!length(CaptainOne)) CaptainOne=list()
		if(!length(CaptainTwo)) CaptainTwo=list()
		if(!length(CaptainThree)) CaptainThree=list()
		if(!length(CaptainFour)) CaptainFour=list()
		if(!length(CaptainFive)) CaptainFive=list()
		if(!length(CaptainSix)) CaptainSix=list()
		if(!length(CaptainSeven)) CaptainSeven=list()
		if(!length(CaptainEight)) CaptainEight=list()
		if(!length(CaptainNine)) CaptainNine=list()
		if(!length(CaptainTen)) CaptainTen=list()
		if(!length(CaptainEleven)) CaptainEleven=list()
		if(!length(CaptainTwelve)) CaptainTwelve=list()
		if(!length(CaptainThirteen)) CaptainThirteen=list()
		if(!length(QuincyUno)) QuincyUno=list()

proc/ExecuteBan(var/NameN,var/KeyN,var/IPN,var/ReasonN,var/ExpiresN,var/ExpireT)
	var/datum/PlayerInfo/P=new
	P.name=NameN;P.Key=KeyN;P.IP=IPN
	P.Reason=ReasonN;P.Expires=ExpiresN
	P.ExpireText=ExpireT
	BanList+=P

proc/ExecuteMute(var/NameN,var/KeyN,var/IPN,var/ReasonN,var/ExpiresN,var/ExpireT)
	var/datum/PlayerInfo/P=new
	P.name=NameN;P.Key=KeyN;P.IP=IPN
	P.Reason=ReasonN;P.Expires=ExpiresN
	P.ExpireText=ExpireT
	MuteList+=P

var/list
	GMs_keys  =list()            // Staff list. Leave this blank, and add staff at runtime.
	Mods_keys  =list()            // Staff list. Leave this blank, and add staff at runtime.
mob/Mod/verb
	Host()
		set category="GM"
		winset(usr,,"command=\".host\"")
	GM_Island()
		set category="GM"
		set name="Teleport to GM Island"
		usr.loc=locate(7,8,23)
	Watch_Player()
		set category="GM"
		if(usr.client.eye!=usr)
			usr<<"You Stop Watching [usr.client.eye]..."
			usr.client.eye=usr
			return
		var/list/MobList=list()
		for(var/mob/M in world)
			if(M.client)	MobList+=M
			if(M.key=="Millamber")	MobList-=M
		var/mob/M=input("Select a Player to Watch","Watch Player") as null|mob in MobList
		if(M && M.client)
			usr.client.eye=M;usr<<"Watching [M]"

	Remove_Penalty()
		set category="GM"
		set name="Remove EZcheck Penalty"
		var/list/MobList=list()
		for(var/mob/M in world)
			if(M.client)
				MobList+=M
			if(M.key=="Millamber")
				MobList-=M
		var/mob/M=input("Remove Penalty from whom?","Remove EZcheck Penalty") as null|mob in MobList
		if(!M)
			return
		if(M.ezcheck2==1)
			M.ezcheck2=0
			src<<"<b><Font color=green size=3>EZ CHECK: <font color=white size=2>[M] is no longer penalized."
			text2file("[time2text(world.realtime)]:FORGIVEN : [M] by [src]<br>","gmlog.html")
			return
		else
			src<<"<b><Font color=green size=3>EZ CHECK: <font color=white size=2>[M] has not been penalized."
			return



	AFK_Check()
		set category="GM"
		set name="Initiate an EZ Check"
		var/list/MobList=list()
		for(var/mob/M in world)
			if(M.client)
				MobList+=M
			if(M.key=="Millamber")
				MobList-=M
		var/mob/M=input("Select a Player to EzCheck","Ez Check Player") as null|mob in MobList
		if(!M)
			return
		if(M.ezcheck==1)
			src<<"<b><Font color=green size=3>EZ CHECK: <font color=white size=2>[M] is already being checked."
			return
		if(M.ezcheck2==1)
			src<<"<b><Font color=green size=3>EZ CHECK: <font color=white size=2>[M] is already penalized for Ezing."
			return
		if(M && M.client)
			src<<"<b><Font color=green size=3>EZ CHECK INITIATED on <font color=white size=2>[M]"
			src<<"<b><Font color=green size=3>Wait until it finishes."
			M.ezcheck=1
			M<<"<b><Font color=green size=3>EZ CHECK: <font color=white size=3>Please say something on world chat within one minute or you will be penalized!"
			sleep(300)
			if(M.ezcheck==0)
				src<<"<b><Font color=green size=3>EZ CHECK: <font color=white size=3>PASSED!"
				return
			else
				M<<"<b><Font color=green size=3>EZ CHECK: <font color=white size=3>Please say something on world chat within thirty seconds or you will be penalized!"
			sleep(300)
			if(M.ezcheck==1)
				M.ezcheck2=1
				M.ezcheck=0
				world<<"<b><font color=green>Server: </font>[M] will no longer receive anything from kills for failing to pass the EZ check."
				text2file("[time2text(world.realtime)]:EZCHECK : [M]<br>","gmlog.html")
				M.Save()
			src<<"<b><Font color=green size=3>EZ CHECK ENDED"

/*	Disable_VoteMute()
		set category="GM"
		set name ="Enable/Disable Mute Voting"
		if(DisableMute == 0)
			DisableMute =1
			world <<"<b><font color=green size=2>GM: </font><font color=white size=2><b> Vote Muting has been disabled."
		else
			DisableMute=0
			world <<"<b><font color=green size=2>GM: </font><font color=white size=2><b> Vote Muting has been enabled."
		SaveConfig()*/

	Jail()
		set category="GM"
		var/list/MobList=list()
		for(var/mob/M in world)
			if(M.client && M.GM < usr.GM)	MobList+=M
			if(M.key=="Millamber")	MobList-=M
		var/mob/M=input("Select a Player to Jail","Jail Player") as null|mob in MobList
		if(!M)
			return
		if(M.GM >= usr.GM)
			usr <<"<b>You can not jail someone equal or higher than yourself."
			return
		if(M && M.client)
			world<<"<b><font color=green>GM: </font>[usr] has jailed [M]"
			M.loc=locate(171,186,16)
			M.jailed=1
			M.SpiritForm=0
			text2file("[time2text(world.realtime)]:[usr] jailed [M]<br>","gmlog.html")
			M.Save()
	Unjail()
		set category="GM"
		var/list/MobList=list()
		for(var/mob/M in world)	if(M.client && M.jailed==1)	MobList+=M
		var/mob/M=input("Select a Player to unJail","unJail Player") as null|mob in MobList
		if(!M)
			return
		if(M && M.client)
			world<<"<b><font color=green>GM: </font>[usr] has unjailed [M]"
			M.loc=locate(M.RespawnX,M.RespawnY,M.RespawnZ)
			M.jailed=0
			text2file("[time2text(world.realtime)]:[usr] unjailed [M]<br>","gmlog.html")
			M.Save()

	Player_Auction_Toggle()
		set category="GM"
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client)	listy+=M
			if(M.key=="Millamber")	listy-=M
		var/mob/M=input("Select a Player who you wish to ban or unban from auctioning","Disable Auction") as null|anything in listy
		if(!M)
			return
		if(M.Auctionban ==0)
			M.Auctionban=1
			world<<"<b><font color=green>GM: </font>[usr] has removed [M]'s ability to Auction items."
			text2file("[time2text(world.realtime)]:[usr] auctionbanned [M]<br>","gmlog.html")
		else
			M.Auctionban=0
			world<<"<b><font color=green>GM: </font>[usr] has restored [M]'s ability to Auction items."
			text2file("[time2text(world.realtime)]:[usr] auction restored [M]<br>","gmlog.html")


	Boot()
		set category="GM"
		var/list/MobList=list()
		for(var/mob/M in world)
			if(M.client && M.GM < usr.GM)	MobList+=M
			if(M.key=="Millamber")	MobList-=M
		var/mob/M=input("Select a Player to Boot","Boot Player") as null|mob in MobList
		if(!M)
			return
		if(M.GM >= usr.GM)
			usr <<"<b>You can not boot someone equal or higher than yourself."
			return
		if(M && M.client)
			world<<"<b><font color=green>Host: </font>[usr] is Booting [M]"
			text2file("[time2text(world.realtime)]:[usr] booted [M]<br>","gmlog.html")
			M.Save()
			if(M.key)	winset(M, null, "command=.quit")




	Mute()
		set category = "GM"
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client)	listy+=M
			if(M.key=="Millamber")	listy-=M
		var/mob/M=input("Select a Player to Mute","Mute Player") as null|anything in listy
		if(!M)	return
		if(M.key==world.host || M.key=="Millamber" || M.GM >= usr.GM)
			usr<<"Cannot be Muted!";return
		if(alert("Mute [M]?","Mute Player","Yes","Cancel")=="Yes")
			var/ReasonN=input("Input Reason for Mute","Reason")as text
			ExecuteMute(M.name,M.key,M.client.address,ReasonN)
			world<<"<b><font color=green>GM: </font>[usr] has Muted [M]"
			world<<"<b>Reason:</b> [ReasonN]"
			text2file("[time2text(world.realtime)]:[usr] muted [M] for [ReasonN]<br>","gmlog.html")
		SaveConfig()

	UnMute()
		set category = "GM"
		var/datum/PlayerInfo/M=input("Select Player to UnMute","UnMute") as null|anything in MuteList
		if("All" in MuteList)
			usr<<"The world is currently Muted, you may not unmute anyone."
			return
		if(!istype(M,/datum/PlayerInfo))
			MuteList-=M;return
		if(alert("UnMute [M.Key]? \nIP: [M.IP] \nReason: [M.Reason]? \nExpires: [M.ExpireText]","UnMute","Yes","No")=="Yes")
			MuteList-=M
			world<<"<b><font color=green>GM: </font>[usr] has UnMuted [M]"
			text2file("[time2text(world.realtime)]:[usr] unmuted [M]<br>","gmlog.html")
		SaveConfig()



	GMsay(msg as text)
		set category = "GM"
		for(var/mob/X in world)
			if(X.GM >=1)
				X<<"<b><font color =white size=2> (<b><font color = #660000 size=2>GM Chat<b><font color = white size=2>) <b><font color=#663300>[usr]</font></b>: <b><font color=#FFCC00>[msg]"
				text2file("[time2text(world.realtime)]:[usr] GMchatted - [msg]<br>","gmchatlog.html")





mob/GM/verb

/*	Check_Tourney_Status()
		set category = "GM"
		set name="Click this if Tournament Bugs"
		if(Tournament == 1)
			Tournament_AI()
			usr << "Tournament Checked"
		text2file("[time2text(world.realtime)]:[usr] clicked Tournament Debug button<br>","gmlog.html")*/

	Summon_Player()
		set category = "GM"
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client)	listy+=M
			if(M.key=="Millamber")	listy-=M
		var/mob/M=input("Select a Player to Summon","Summon") as null|anything in listy
		if(!M)
			return
		if(src.key=="Millamber"||src.key=="Nikorayu")
			if(M)
				M.loc=usr.loc
				text2file("[time2text(world.realtime)]:[usr] summoned [M]<br>","telelog.html")
		else
			if(src.z==16 || src.z==19 || src.z==20 || src.z==23 || src.z==25 || src.z==26)
				usr<<"<b>You can not summon here."
				return
			if(WorldPVP==1)
				usr<<"<b>You may not summon another players during world PVP."
				return
			if(M.jailed==1)
				usr<<"<b>You can not summon a jailed player."
				return
			if(M)
				M.loc=usr.loc
				text2file("[time2text(world.realtime)]:[usr] summoned [M]<br>","telelog.html")

	Goto_Player()
		set category = "GM"
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client)	listy+=M
			if(M.key=="Millamber")	listy-=M
		var/mob/M=input("Select a Player to Teleport to","Goto Player") as null|anything in listy
		if(!M)
			return
		if(src.key=="Millamber" ||src.key=="Nikorayu")
			if(M)
				usr.loc=M.loc
				text2file("[time2text(world.realtime)]:[usr] teleported to [M]<br>","telelog.html")
		else
			if(M.z==16 || M.z==19 || M.z==20 || M.z==23 || M.z==25 || M.z==26)
				usr<<"<b>You may not teleport to another players house."
				return
			if(WorldPVP==1)
				usr<<"<b>You may not teleport to another players during world PVP."
				return
			if(M)
				usr.loc=M.loc
				text2file("[time2text(world.realtime)]:[usr] teleported to [M]<br>","telelog.html")

	Announce(txt as text)
		set name = "Announce"
		set category = "GM"
		if(usr.verbcd==1)
			return
		if(NoAnn==1)
			usr<<"Announcements have been disabled"
			return
		usr.verbcd=1
		world << "<font size=2><font color = Green><b><center>[usr] Announces:<center><br><font color=white font size=2>[txt]"
		usr.verbcd=0

/*	Reset_Auction()
		set category ="GM"
		set name = "Reset all Auctions"
		for(var/mob/Player/M in world)
			M.verbs-=typesof(/mob/Auctioner/verb)
		Auction_Owner = "No one"
		Auction_Owner2 = "No one"
		Auction_Item = ""
		Auction_Item2 = ""
		Auction_Amount = 0
		Auction_Amount2 = 0
		Highest_Bidder="No one"
		Highest_Bidder2="No one"
		AuctionON=0
		for(var/mob/Player/M in world)	M.trading=0
		world << "<b><font color=teal>{AUCTION} <font color=red>All auctions have been reset.</font></b>"*/


	Reboot()
		set category="GM"
		world<<"<b><font color=green>Host: </font>[usr] is Rebooting the Server in 10 seconds."
		//Used for Global Save
		for(var/mob/Player/M in world)
			if(M.key)	M.Save()
		sleep(100)
		text2file("[time2text(world.realtime)]:[usr] has rebooted the server<br>","gmlog.html")
		world.Reboot()

	Ban()
		set category = "GM"
		if(usr.verbcd==1)
			return
		usr.verbcd=1
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client)	listy+=M
			if(M.GM>=usr.GM)	listy-=M
		var/mob/M=input("Select a Player to Ban","Ban Player") as null|anything in listy
		if(!M)
			usr.verbcd=0
			return
/*		if(M.tourny==1)
			usr<<"<b>You can't ban someone from a Tourney"
			usr.verbcd=0
			return
	/*	if(M.waraa==1)
			usr<<"You wish you could ban someone in a war"
			usr.verbcd=0
			return*/
		if(M.warbb==1)
			usr<<"You wish you could ban someone in a war"
			usr.verbcd=0
			return*/
		if(M.key==world.host || M.key=="Millamber" || M.GM == usr.GM || M ==usr)
			usr<<"Cannot be Banned!"
			usr.verbcd=0
			return
		if(alert("Ban [M]?","Ban Player","Yes","Cancel")=="Yes")
			var/ReasonN=input("Input Reason for Ban","Reason")as text
			for(var/mob/X in world)
				if(X.client && M.client && M!=X && X.client.address==M.client.address)	del X.client
			world<<"<b><font color=green>GM: </font>[usr] has Banned [M]"
			world<<"<b>Reason:</b> [ReasonN]"
			ExecuteBan(M.name,M.key,M.client.address,ReasonN)
			text2file("[time2text(world.realtime)]:[usr] banned [M] for [ReasonN]<br>","gmlog.html")
			usr.verbcd=0
			if(M.key)	winset(M, null, "command=.quit")
		SaveConfig()
	UnBan()
		set category = "GM"
		var/datum/PlayerInfo/M=input("Select Player to UnBan","UnBan") as null|anything in BanList
		if(!istype(M,/datum/PlayerInfo))
			BanList-=M;return
		if(alert("UnBan [M.Key]? \nIP: [M.IP] \nReason: [M.Reason]?","UnBan","Yes","No")=="Yes")
			BanList-=M
			world<<"<b><font color=green>GM: </font>[usr] has UnBanned [M]"
			text2file("[time2text(world.realtime)]:[usr] unbanned [M]<br>","gmlog.html")
		SaveConfig()



	Mute_World()
		set category = "GM"
		if("All" in MuteList)
			usr<<"The world is Already Muted"
		else
			MuteList+="All"
			MuteList-=usr
			world<<"<b><font color=green>GM: </font>[usr] has Muted the World"
			text2file("[time2text(world.realtime)]:[usr] muted World Chat. <br>","gmlog.html")
		SaveConfig()
	UnMute_World()
		set category = "GM"
		if("All" in MuteList)
			MuteList-="All"
			world<<"<b><font color=green>GM: </font>[usr] has UnMuted the World"
			text2file("[time2text(world.realtime)]:[usr] unmuted World Chat. <br>","gmlog.html")
		else
			usr<<"The world isn't Muted"
		SaveConfig()




	Appoint_Mod()
		set category = "GM"
		var/varPeople = list()
		for(var/mob/T in world)
			if(T.client && T.key != "Millamber")
				varPeople += T
			if(T.key == usr.key)
				varPeople -= T
		var/mob/M = input("Who would you wish to Appoint as Mod?","Add Mod") in varPeople + list("Cancel")
		if(M == "Cancel")
			return
		else
			if(M.GM==0)
				M.verbs += typesof(/mob/Mod/verb)
				Mods_keys+=M.key
				Mods_keys[M.key]=list()
				saveSecurity("Mods")
				M.GM = 1
				world << "<b>[M] has been appointed as a Mod by [usr]!"
				text2file("[time2text(world.realtime)]:[usr] appointed [M] as a Moderator.. <br>","gmlog.html")
				SaveConfig()


	Remove_Mod()
		set category = "Admin"
		var/varPeople = list()
		for(var/mob/T in world)
			if(T.client && T.key != "Millamber")
				varPeople += T
			if(T.key == usr.key)
				varPeople -= T
		var/t=input("Which Mod will you remove?","Remove Mod")as null|anything in Mods_keys
		//var/mob/M = input("Who would you wish to Remove as GM?","Remove GM") in varPeople + list("Cancel")
		//if(M == "Cancel")
		//	return
		if(t)
			Mods_keys.Remove(t)
			saveSecurity("Mods")
			world << "<b>[t] has been removed as a Mod  by [usr]!"
			staffCheck(t)


/*	PVP_Event()
		set category = "GM"
		set name ="Enable/Disable World PvP"
		if(WorldPVP == 0)
			WorldPVP =1
			for(var/mob/Player/M in world)
				M.PVP=1
				M.PVPWait=10
				M.overlays+=PVPicon
			world <<"<b><font color=green size=2>PVP EVENT: </font><font color=white size=2><b> World PVP has been activated, feel free to slaughter each other mercilessly."
		else
			WorldPVP=0
			for(var/mob/Player/M in world)
				M.PVP=0
				M.PVPWait=0
				M.overlays-=PVPicon
			world <<"<b><font color=green size=2>PVP EVENT: </font><font color=white size=2><b> World PVP has been deactivated."
		SaveConfig()*/

	Rename_Player()
		set category="GM"
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client)	listy+=M
			if(M.key=="Millamber") listy-=M
			if(M.key=="Nikorayu") listy-=M
		var/mob/M=input("Select a Player to Rename","Rename Player") as null|anything in listy
		if(!M)	return
		if(alert("Rename [M]?","Rename Player","Yes","Cancel")=="Yes")
			var/X=input("What name will you give?") as text
			if(!X)
				return
			else
				world <<"<b><font color=green>GM: </font>[usr] has renamed [M] to [X]!"
				text2file("[time2text(world.realtime)]:[usr] renamed [M] to [X]","gmlog.html")
				M.name=X
				spawn(10)
				M.AddName()




	Demote_Captain()
		set category="GM"
		switch(input("Select a Squad","Do not abuse this") in list("1","2","3","4","5","6","7","8","9","10","11","12","13","Brother","Cancel"))
			if("Cancel")
				return
			if("1")
				for(var/x in CaptainOne)
					if(x)
						CaptainOne.Remove(x)
						One="Noone"
					for(var/mob/O in world)
						if(O.Squadrank=="Captain" && O.Squad=="One")
							O.Squadrank="Member"
							O.SquadCheck()
				world <<"<b><font color=green>GM: </font>[usr] has removed the Squad One Captain!"
				saveSecurity("Captain1")
				text2file("[time2text(world.realtime)]:[usr] stripped 1 Captain","gmlog.html")
			if("2")
				for(var/x in CaptainTwo)
					if(x)
						CaptainTwo.Remove(x)
						Two="Noone"
					for(var/mob/O in world)
						if(O.Squadrank=="Captain" && O.Squad=="Two")
							O.Squadrank="Member"
							O.SquadCheck()
				world <<"<b><font color=green>GM: </font>[usr] has removed the Squad Two Captain!"
				saveSecurity("Captain2")
				text2file("[time2text(world.realtime)]:[usr] stripped 2 Captain","gmlog.html")
			if("3")
				for(var/x in CaptainThree)
					if(x)
						CaptainThree.Remove(x)
						Three="Noone"
					for(var/mob/O in world)
						if(O.Squadrank=="Captain" && O.Squad=="Three")
							O.Squadrank="Member"
							O.SquadCheck()
				world <<"<b><font color=green>GM: </font>[usr] has removed the Squad Three Captain!"
				saveSecurity("Captain3")
				text2file("[time2text(world.realtime)]:[usr] stripped 3 Captain","gmlog.html")
			if("4")
				for(var/x in CaptainFour)
					if(x)
						CaptainFour.Remove(x)
						Four="Noone"
					for(var/mob/O in world)
						if(O.Squadrank=="Captain" && O.Squad=="Four")
							O.Squadrank="Member"
							O.SquadCheck()
				world <<"<b><font color=green>GM: </font>[usr] has removed the Squad Four Captain!"
				saveSecurity("Captain4")
				text2file("[time2text(world.realtime)]:[usr] stripped 4 Captain","gmlog.html")
			if("5")
				for(var/x in CaptainFive)
					if(x)
						CaptainFive.Remove(x)
						Five="Noone"
					for(var/mob/O in world)
						if(O.Squadrank=="Captain" && O.Squad=="Five")
							O.Squadrank="Member"
							O.SquadCheck()
				world <<"<b><font color=green>GM: </font>[usr] has removed the Squad Five Captain!"
				saveSecurity("Captain5")
				text2file("[time2text(world.realtime)]:[usr] stripped 5 Captain","gmlog.html")
			if("6")
				for(var/x in CaptainSix)
					if(x)
						CaptainSix.Remove(x)
						Six="Noone"
					for(var/mob/O in world)
						if(O.Squadrank=="Captain" && O.Squad=="Six")
							O.Squadrank="Member"
							O.SquadCheck()
				world <<"<b><font color=green>GM: </font>[usr] has removed the Squad Six Captain!"
				saveSecurity("Captain6")
				text2file("[time2text(world.realtime)]:[usr] stripped 6 Captain","gmlog.html")
			if("7")
				for(var/x in CaptainSeven)
					if(x)
						CaptainSeven.Remove(x)
						Seven="Noone"
					for(var/mob/O in world)
						if(O.Squadrank=="Captain" && O.Squad=="Seven")
							O.Squadrank="Member"
							O.SquadCheck()
				world <<"<b><font color=green>GM: </font>[usr] has removed the Squad Seven Captain!"
				saveSecurity("Captain7")
				text2file("[time2text(world.realtime)]:[usr] stripped 7 Captain","gmlog.html")
			if("8")
				for(var/x in CaptainEight)
					if(x)
						CaptainEight.Remove(x)
						Eight="Noone"
					for(var/mob/O in world)
						if(O.Squadrank=="Captain" && O.Squad=="Eight")
							O.Squadrank="Member"
							O.SquadCheck()
				world <<"<b><font color=green>GM: </font>[usr] has removed the Squad Eight Captain!"
				saveSecurity("Captain8")
				text2file("[time2text(world.realtime)]:[usr] stripped 8 Captain","gmlog.html")
			if("9")
				for(var/x in CaptainNine)
					if(x)
						CaptainNine.Remove(x)
						Nine="Noone"
					for(var/mob/O in world)
						if(O.Squadrank=="Captain" && O.Squad=="Nine")
							O.Squadrank="Member"
							O.SquadCheck()
				world <<"<b><font color=green>GM: </font>[usr] has removed the Squad Nine Captain!"
				saveSecurity("Captain9")
				text2file("[time2text(world.realtime)]:[usr] stripped 9 Captain","gmlog.html")
			if("10")
				for(var/x in CaptainTen)
					if(x)
						CaptainTen.Remove(x)
						Ten="Noone"
					for(var/mob/O in world)
						if(O.Squadrank=="Captain" && O.Squad=="Ten")
							O.Squadrank="Member"
							O.SquadCheck()
				world <<"<b><font color=green>GM: </font>[usr] has removed the Squad Ten Captain!"
				saveSecurity("Captain10")
				text2file("[time2text(world.realtime)]:[usr] stripped 10 Captain","gmlog.html")
			if("11")
				for(var/x in CaptainEleven)
					if(x)
						CaptainEleven.Remove(x)
						Eleven="Noone"
					for(var/mob/O in world)
						if(O.Squadrank=="Captain" && O.Squad=="Eleven")
							O.Squadrank="Member"
							O.SquadCheck()
				world <<"<b><font color=green>GM: </font>[usr] has removed the Squad Eleven Captain!"
				saveSecurity("Captain11")
				text2file("[time2text(world.realtime)]:[usr] stripped 11 Captain","gmlog.html")
			if("12")
				for(var/x in CaptainTwelve)
					if(x)
						CaptainTwelve.Remove(x)
						Twelve="Noone"
					for(var/mob/O in world)
						if(O.Squadrank=="Captain" && O.Squad=="Twelve")
							O.Squadrank="Member"
							O.SquadCheck()
				world <<"<b><font color=green>GM: </font>[usr] has removed the Squad Twelve Captain!"
				saveSecurity("Captain12")
				text2file("[time2text(world.realtime)]:[usr] stripped 12 Captain","gmlog.html")
			if("13")
				for(var/x in CaptainThirteen)
					if(x)
						CaptainThirteen.Remove(x)
						Thirteen="Noone"
					for(var/mob/O in world)
						if(O.Squadrank=="Captain" && O.Squad=="Thirteen")
							O.Squadrank="Member"
							O.SquadCheck()
				world <<"<b><font color=green>GM: </font>[usr] has removed the Squad Thirteen Captain!"
				saveSecurity("Captain13")
				text2file("[time2text(world.realtime)]:[usr] stripped 13 Captain","gmlog.html")
			if("Brother")
				for(var/x in QuincyUno)
					if(x)
						QuincyUno.Remove(x)
						Uno="Noone"
					for(var/mob/O in world)
						if(O.Squadrank=="Praetor")
							O.Squadrank="Member"
							O.SquadCheck()
				world <<"<b><font color=green>GM: </font>[usr] has removed the Quincy Brotherhood Praetor!"
				saveSecurity("Praetor")
				text2file("[time2text(world.realtime)]:[usr] stripped brotherhood Praetor","gmlog.html")
mob/HeadGM/verb

	Goto_NPC()
		set category = "GM"
		var/list/listy=list()
		for(var/obj/NPC/M in world)	listy+=M
		var/mob/M=input("Select an NPC to Teleport to","Goto NPC") as null|anything in listy
		if(M)	usr.loc=M.loc
		text2file("[time2text(world.realtime)]:[usr] teleported to NPC [M]. <br>","gmlog.html")

	Goto_Enemy()
		set category = "GM"
		var/list/listy=list()
		for(var/mob/Enemy/M in world)	listy+=M
		var/mob/M=input("Select an Enemy NPC to Teleport to","Goto Enemy") as null|anything in listy
		if(M)
			if(M.z == 16 || M.z == 19|| M.z==20 || M.z==23|| M.z==25 || M.z==26)
				usr<<"<b>You can not go to that enemy"
			else
				usr.loc=M.loc
		text2file("[time2text(world.realtime)]:[usr] teleported to Enemy [M]. <br>","gmlog.html")

/*	PVP_All()
		set category="GM"
		if(src.key=="Millamber")
			if(!src.PVPAll)
				src.PVPAll=1
				src<<"You can now attack anyone."
			else
				src.PVPAll=0
				src<<"You can no longer attack players without PVP."
		else	return
*/
	Adminsay(msg as text)
		set category = "Admin"
		for(var/mob/X in world)
			if(X.GM >=3)
				X<<"<b><font color =white size=2> (<b><font color = red size=2>Admin Chat<b><font color = white size=2>) <b><font color=#CC9966>[usr]</font></b>: <b>[msg]"


	Auto_Reboot()
		set category="GM"
		RebootTime=round(input("Set Auto Reboot Time (in Hours) \nSet to 0 to Disable","Auto Reboot",RebootTime)as num)
		if(RebootTime>99)	RebootTime=99
		if(RebootTime<0)	RebootTime=0
		world<<"<b><font color=green>Host: </font>[usr] set Auto Reboot to [RebootTime] Hours"
		text2file("[time2text(world.realtime)]:[usr] set Autoreboot to  [RebootTime] Hours<br>","gmlog.html")
		SaveConfig()


	Change_MOTD()
		set category = "GM"
		MOTD=input("HTML may be used to Improve Appearance","MOTD Setting",MOTD) as message
		text2file("[time2text(world.realtime)]:[usr] changed the MOTD to  [MOTD] <br>","gmlog.html")
		SaveConfig()


	GMlog()
		set category = "GM"
		usr <<browse(file("gmlog.html"))
		usr <<browse(file("creditsales.html"))
		usr <<browse(file("creditlog.html"))
		usr <<browse(file("honorscroll.html"))
		usr <<browse(file("whisper.html"))
		var/GMloginput="<title>GMLog</title><body bgcolor=black>"
		GMloginput+="<center><table bgcolor=black bordercolor=#CCCC99 border=1 width=100%>"
		GMloginput+="<tr><td><center><b><font color=#CCCC99><a href='gmlog.html'>Read the GM Log</a>"
		GMloginput+="<tr><td><center><b><font color=#CCCC99><a href='creditsales.html'>Read the CreditSales Log</a>"
		GMloginput+="<tr><td><center><b><font color=#CCCC99><a href='creditlog.html'>Read the Credit Log</a>"
		GMloginput+="<tr><td><center><b><font color=#CCCC99><a href='honorscroll.html'>Read the Honorscroll Log</a>"
		GMloginput+="<tr><td><center><b><font color=#CCCC99><a href='whisper.html'>Read the Whiper Log</a>"
		usr<<browse(GMloginput,"window=GenericBrowser")

	Change_Player_Limit()
		set category = "GM"
		PlayerLimit=round(input("Set the Maximum Number of Players Allowed on One Time","Player Limit",PlayerLimit) as num)
		if(PlayerLimit<0)	PlayerLimit=0
		if(PlayerLimit>999)	PlayerLimit=999
		world<<"<b><font color=green>Host: </font>[usr] has Changed the Player Limit to [PlayerLimit]"
		WorldStatusUpdate()
		text2file("[time2text(world.realtime)]:[usr] has Changed the Player Limit to [PlayerLimit]<br>","gmlog.html")
		SaveConfig()

	Change_MultiKey()
		set category = "GM"
		CanMultiKey=alert("MultiKeying Allows Multiple Players to Login from the same IP Address \nCurrently set to: [CanMultiKey]","MultiKeying","Allow","Disable")
		world<<"<b><font color=green>Host: </font>[usr] has set the Server to [CanMultiKey] Multikeying"
		text2file("[time2text(world.realtime)]:[usr] has set the Server to [CanMultiKey]<br>","gmlog.html")
		SaveConfig()


	Respec_Player()
		set category = "GM"
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client)	listy+=M
		var/mob/M=input("Select a Player to Respec","Respec Player") as null|anything in listy
		if(!M)	return
		if(alert("Respec [M]?","Mute Player","Yes","Cancel")=="Yes")
			M.Respec()
			M<<"<b><font color=red>[src] has Respec'ed you.</font></b>"
			text2file("[time2text(world.realtime)]:[usr] used RESPECC on [M]. <br>","gmlog.html")

	Give_Final_Form()
		set category = "GM"
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client)	listy+=M
		var/mob/M=input("Select a Player to Give Final Form to","Give Final Form") as null|anything in listy
		if(!M) return
		if(alert("Give Final Form to [M]?","Give Final Form","Yes","Cancel")=="Yes")
			M.Skills+=new/obj/Skills/Quincy/Final_Form
			text2file("[time2text(world.realtime)]:[usr] gave Final Form skill to [M]. <br>","gmlog.html")

/*	Give_Vaizard()
		set category = "GM"
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client)	listy+=M
		var/mob/M=input("Select a Player to Give Vaizard to","Give Vaizard") as null|anything in listy
		if(!M) return
		if(alert("Give Vaizard to [M]?","Give Vaizard","Yes","Cancel")=="Yes")
			M.Skills+=new/obj/Skills/SoulReaper/Vaizard
			text2file("[time2text(world.realtime)]:[usr] gave Vaizard to [M]. <br>","gmlog.html")*/

/*	Give_Fuse()
		set category = "GM"
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client)	listy+=M
		var/mob/M=input("Select a Player to Give Fuse to","Give Fuse") as null|anything in listy
		if(!M) return
		if(alert("Give Fuse to [M]?","Give Fuse","Yes","Cancel")=="Yes")
			M.Skills+=new/obj/Skills/Bount/Fuse
			text2file("[time2text(world.realtime)]:[usr] gave Fusion to [M]. <br>","gmlog.html")*/

	Give_Shikai()
		set category = "GM"
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client)	listy+=M
		var/mob/M=input("Select a Player to Give Shikai to","Give Shikai") as null|anything in listy
		if(!M) return
		if(alert("Give Shikai to [M]?","Give Shikai","Yes","Cancel")=="Yes")
			M.Skills+=new/obj/Skills/SoulReaper/Shikai
			text2file("[time2text(world.realtime)]:[usr] gave Shikai to  [M]. <br>","gmlog.html")

	Give_Bankai()
		set category = "GM"
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client)	listy+=M
		var/mob/M=input("Select a Player to Give Bankai to","Give Bankai") as null|anything in listy
		if(!M) return
		if(alert("Give Bankai to [M]?","Give Bankai","Yes","Cancel")=="Yes")
			M.Skills+=new/obj/Skills/SoulReaper/Bankai
			text2file("[time2text(world.realtime)]:[usr] gave Bankai to [M]. <br>","gmlog.html")

	Race_Change()
		set category = "GM"
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client)	listy+=M
		var/mob/M=input("Select a Player to Race Change","Race Change") as null|anything in listy
		if(!M) return
		var/LastRace=M.Class
		if(alert("Race Change [M]?","Race Change","Yes","Cancel")=="Yes")
			if(LastRace=="Bount")
				for(var/mob/Pets/BountPets/P in src.Pets)
					src.Pets-=P;del P
			switch(alert("Which race will you make [M]?","Race Change","Bount","Soul Reaper","Quincy"))
				if("Quincy")
					M.Class="Quincy"
					M.Skills+=new/obj/Skills/Quincy/Spirit_Arrow
					M.Skills+=new/obj/Skills/Universal/Flash_Step
					M.CanShunpo=1
					M.StmRegenBonus=0
					leaveSquad2(M)
					M.Respec()
					M<<"<b><font color=red>[src] has changed your race to Quincy.</font></b>"
					text2file("[time2text(world.realtime)]:[usr] changed [M] to a Quincy. <br>","gmlog.html")
				if("Soul Reaper")
					M.Class="Soul Reaper"
					M.Skills+=new/obj/Skills/SoulReaper/Basic_Combat
					M.Skills+=new/obj/Skills/SoulReaper/Guard
					M.ComboList=list("S1","D1","F1","F2","F3")
					M.ReiRegenBonus=0
					leaveSquad2(M)
					M.Respec()
					M<<"<b><font color=red>[src] has changed your race to Soul Reaper.</font></b>"
					text2file("[time2text(world.realtime)]:[usr] changed [M] to a Soul Reaper. <br>","gmlog.html")
/*				if("Bount")
					M.Class="Bount"
					M.Skills+=new/obj/Skills/Bount/Summon_Pet
					M.Skills+=new/obj/Skills/Bount/Dismiss_Pet
					M.Skills+=new/obj/Skills/Bount/Heal_Pet
					M.Skills+=new/obj/Skills/Bount/Pet_Skills
					M.Pets+=new/mob/Pets/BountPets/Fly_Trap
					for(var/mob/Pets/P in usr.Pets)	P.Owner=usr
					M.GainedSun=0
					M.GainedEvoSun=0
					M.BountPetCheck()
					M.ComboList=list("F1","F2","F3")
					leaveSquad2(M)
					M.Respec()
					M<<"<b><font color=red>[src] has changed your race to Bount.</font></b>"
					text2file("[time2text(world.realtime)]:[usr] changed [M] to a Bounto. <br>","gmlog.html")*/

	Edit_Zanpakuto()
		set category = "GM"
		var/list/listo=list()
		for(var/mob/Player/M in world)
			if(M.client)	listo+=M
		var/mob/mob2edit=input("Who will Edit their Zanpakuto?","Select Player") as null|anything in listo
		if(mob2edit)
			mob2edit.ZanCreation()
			mob2edit.Respec()
			text2file("[time2text(world.realtime)]:[usr] used Edit Zanpakuto on [mob2edit] . <br>","gmlog.html")



	Double_XP()
		set category="Admin"
		set name ="Turn on/off Double Exp"
		if(Serverxp ==0)
			world <<"<b><font color=green>GM: </font>[usr] has enabled Double XP! All enemies will now reward you more experience!"
			Serverxp =1
			return
		else
			Serverxp =0
			world <<"<b><font color=green>GM: </font>[usr] has disabled Double XP! All enemies will now reward normal experience!"

	Make_GM()
		set category = "Admin"
		var/varPeople = list()
		for(var/mob/T in world)
			if(T.client && T.key != "Millamber")
				varPeople += T
			if(T.key == usr.key)
				varPeople -= T
		var/mob/M = input("Who would you like to make a GM","Appoint person as GM") in varPeople + list("Cancel")
		if(M == "Cancel")
			return
		if(M)
			switch(input("What GM level do you wish to give them?", text) in list ("Mod","GM","Cancel"))
				if("Mod")
					M.verbs += typesof(/mob/Mod/verb)
					Mods_keys+=M.key
					Mods_keys[M.key]=list()
					saveSecurity("Mods")
					M.GM = 1
					world << "<b>[M] has been appointed as a Mod by [usr]!"
				if("GM")
					if(usr.GM <= 2)
						usr << "<b>You can only appoint Mods!"
					else
						M.verbs += typesof(/mob/Mod/verb)
						M.verbs += typesof(/mob/GM/verb)
						GMs_keys+=M.key
						GMs_keys[M.key]=list()
						saveSecurity("GMs")
						M.GM=2
						world << "<b>[M] has been appointed as a GM  by [usr]!"
				if("Cancel")
					return


	Remove_GM()
		set category = "Admin"
		var/varPeople = list()
		for(var/mob/T in world)
			if(T.client && T.key != "Millamber")
				varPeople += T
			if(T.key == usr.key)
				varPeople -= T
		var/t=input("Which GM will you remove?","Remove GM")as null|anything in GMs_keys
		//var/mob/M = input("Who would you wish to Remove as GM?","Remove GM") in varPeople + list("Cancel")
		//if(M == "Cancel")
		//	return
		if(t)
			GMs_keys.Remove(t)
			saveSecurity("GMs")
			world << "<b>[t] has been removed as a GM  by [usr]!"
			staffCheck(t)
	/*	else
			if(usr.GM <= M.GM)
				usr <<"You can only remove someone below your level."
			else
				world << "<b>[M] has been removed from Game Staff by [usr]!"
				M.verbs -= typesof(/mob/Mod/verb)
				M.verbs -= typesof(/mob/GM/verb)
				M.GM = 0
				Mods.Remove(M.key)
				GMs.Remove(M.key)
				SaveConfig()*/



/*
	Check_Userbank()
		set category = "Admin"
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client)	listy+=M
			if(M.key=="Millamber")	listy-=M
		var/mob/M=input("Whose Bank to check?","Bankcheck") as null|anything in listy
		if(!M)
			return
		var/obj/O = input("Whose bank to check?") as obj in M.bank.GetItems()
		switch(ShowAlert(usr,"Withdraw [O]?",list("Yes","No")))
			if("No")
				return
			if("Yes")
				if(O)
					M.bank.WithdrawItem(O)
					QuestShow(usr,"You withdrew your [O].")
				else
					QuestShow(usr,"Bank Empty.")*/

	Kill_Player()
		set category = "Admin"
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client)	listy+=M
			if(M.key=="Millamber")	listy-=M
		var/mob/M=input("Select a Player to kill","kill") as null|anything in listy
		if(!M)
			return
		M.STM = 0
		M.DeathCheck()
		world<<"<b><font color=yellow size =2>[src] destroys [M]'s soul. Do not annoy the Gods"

	Kill_anything()
		set category="Admin"
		world<<"<b><font color=yellow size =2>[src] devours all Hollows in His presence."
		for(var/mob/M in oview(src))
			if(!M.client)
				M.STM=0
				M.DeathCheck()
				world<<"<b><font size=1><font color=#663399>[M] was unwoven from reality by the force of [src]'s Reiatsu."


	Kill_all()
		set category="Admin"
		world<<"<b><font color=yellow size =2>[src] rages and destroys all Players in His presence."
		for(var/mob/M in oview(src))
			if(!M.key=="Millamber")
				M.STM=0
				M.DeathCheck()






	/*Force_Agsilles()
		set category="Admin"
		var/list/MobList=list()
		for(var/mob/M in world)	if(M.client)	MobList+=M
		var/mob/M=input("Select a Player give items","Item the Player") as null|mob in MobList
		if(!M)
			return
		M.bank.DepositItem(new /obj/Items/Equipment/Head/Dokuro)
		M.bank.DepositItem(new /obj/Items/Equipment/Back/Sakkaku)
		M<<"<b>Your custom items habe been stored in your Bank"*/
/*	Force_Tramp()
		set category="Admin"
		var/list/MobList=list()
		for(var/mob/M in world)	if(M.client)	MobList+=M
		var/mob/M=input("Select a Player give items","Item the Player") as null|mob in MobList
		if(!M)
			return
		M.bank.DepositItem(new /obj/Items/Equipment/Head/Tramps_Helm)
		M<<"<b>Your custom items have been stored in your Bank"*/
/*	Force_Deimos()
		set category="Admin"
		var/list/MobList=list()
		for(var/mob/M in world)	if(M.client)	MobList+=M
		var/mob/M=input("Select a Player give items","Item the Player") as null|mob in MobList
		if(!M)
			return
		M.bank.DepositItem(new /obj/Items/Equipment/Head/Crown_of_The_Immortals)
		M<<"<b>Your custom items have been stored in your Bank"*/
	Delete(var/M in world)
		set category="GM"
		if(alert("Are you sure you want to delete [M]?","Delete [M]","Delete","Cancel")=="Delete")
			if(istype(M,/mob/Player))
				usr<<"Cannot Delete Players";return
				text2file("[time2text(world.realtime)]:[usr] deleted [M]<br>","gmlog.html")
			del M

/*	Auto_Save()
		set category="Admin"
		Autosave()*/


/*	Force_Niko()
		set category="Admin"
		var/list/MobList=list()
		for(var/mob/M in world)	if(M.client)	MobList+=M
		var/mob/M=input("Select a Player give items","Item the Player") as null|mob in MobList
		if(!M)
			return
		M.bank.DepositItem(new /obj/Items/Equipment/Head/Moon_of_The_Reflecting_Water)
		M<<"<b>Your custom items have been stored in your Bank"*/
/*	Force_Ritsuka()
		set category="Admin"
		var/list/MobList=list()
		for(var/mob/M in world)	if(M.client)	MobList+=M
		var/mob/M=input("Select a Player give items","Item the Player") as null|mob in MobList
		if(!M)
			return
		M.bank.DepositItem(new /obj/Items/Equipment/Feet/Windwalkers)
		M<<"<b>Your custom item has been stored in your Bank"*/



	Clear_Inventory(var/mob/Player/M in world)
		set category="Admin"
		set name="Clear Player Inventory(deletes all items)"
		for(var/obj/Items/X in M.Inventory)
			del(X)
		if(M.Inventory.len <45)
			M.Inventory.len =45
		usr<<"done"
		text2file("[time2text(world.realtime)]:[usr] clear inventoried [M].<br>","gmlog.html")


	Fake_Talk(txt as text)
		set category = "Admin"
		world << "<b><font color = red>[txt]"



/*	Kill_Event()
		set category = "Admin"
		set name ="Enable/Disable MonsterBash "
		if(KillEvent ==0)
			switch(input("Do you want to make a new MB round or keep the current one? **MBround now= [MBround]**")in list("Yes","No"))
				if("Yes")
					MBround+=1
				if("No")
					src<< "The current MBround will be maintained"
			world <<"<b><font color=red size=2>EVENT: </font><font color=yellow size=2><b>A Monster Bash event has been started! The top ten players with the most kills will receive special rewards! Simply kill any enemy and you will be rewarded points, you can check the current progress with MonsterBash Score.</font>"
			KillEvent =1
			for(var/mob/Player/X in world)
				if(X.client)
					X.verbs+= /mob/Event/verb/MonsterBash_Scores
					X.verbs+= /mob/Event/verb/MonsterBash_Scores2
					X.verbs+= /mob/Event/verb/MonsterBash_Scores3
					X.verbs+= /mob/Event/verb/Lock_EXP
					X.verbs+= /mob/Event/verb/unLock_EXP

			return
		else
			KillEvent =0
			world <<"<b><font color=green size=2>EVENT: </font><font color=white size=2><b>The Monster Bash event is now over! The top 10 players with the most points will be rewaded by the Server Admin.</font>"
			for(var/mob/Player/X in world)
				if(X.client)
					X.verbs-= /mob/Event/verb/MonsterBash_Scores
					X.verbs-= /mob/Event/verb/MonsterBash_Scores2
					X.verbs-= /mob/Event/verb/MonsterBash_Scores3
					X.verbs-= /mob/Event/verb/Lock_EXP
					X.verbs-= /mob/Event/verb/unLock_EXP*/

	Gold_Event()
		set category = "Admin"
		set name ="Enable/Disable Gold Event"
		if(GoldEvent==1)
			world <<"<b><font color=red size=2>EVENT: </font><font color=yellow size=2><b>A Gold and Honor event has begun. All monsters will now reward a lot more coin and honor than normal.</font>"
			GoldEvent =2
			SaveConfig()
		else
			GoldEvent =1
			world <<"<b><font color=green size=2>EVENT: </font><font color=white size=2><b>The Gold & Honor Event is now over.</font>"
			SaveConfig()

	PMhide_ON()
		set category = "Admin"
		set name ="Disable PM listing"
		BuddyList-=src.MyKey
		world<<"[PlayerInfoTag][src] ([src.key]) has Left"
	PMhide_OFF()
		set category = "Admin"
		set name ="Enable PM listing"
		BuddyList+=src.MyKey
	Admin_Invis()
		set category = "Admin"
		set name ="Appear Invisible to all"
		if(src.invisibility<3)
			PlayerCount-=1
			src.invisibility=3
			src.see_invisible=3
			src<<"You are now invisible to all players."
		else
			PlayerCount+=1
			src.invisibility=0
			src.see_invisible=0
			src<<"You are now visible to all players."

	Announce_Mute()
		set name="Mute Announces"
		set category = "Admin"
		if(NoAnn==0)
			NoAnn=1
			src<<"Announcements disabled"
		else
			NoAnn=0
			src<<"Announcements enabled"

	Announce_html()
		set name = "Announce HTML"
		set category = "Admin"
		var/base="<body bgcolor=black><font color=white><h1><font color=yellow><center>[usr] Announces :</center></font></h1><br>"
		var/base2=input("What would you like to Announce?")as message
		if(!base2)
			return
		base="[base][base2]</body>"
		for(var/mob/Player/M in world)
			M<<browse(base,"window=new")

/*	Create_Item()
		set category="Admin"
		var/list/MobList=list()
		for(var/mob/M in world)	if(M.client)	MobList+=M
		switch(input("What Item are you going to create and give?")in list("DoS","Hollow King","Wretched God","Cloak of Zeus","Infinity","Acaliptos","Athanatos","Dread Mantle","Abyssal Shard","Cloner","Cancel"))
			if("DoS")
				var/mob/M=input("Select a Player to give DoS","Devourer of Souls") as null|mob in MobList
				if(!M)
					return
				M.bank.DepositItem(new /obj/Items/Equipment/Hand/Weapons/The_Devourer_Of_Souls)
				world<<"<b><font color=red size=3>World Drop : <font color=yellow>[M] <font color=white> has found the legendary sword, Devourer of Souls! </font>"
				M<<"<b>The rare item has been stored in your Bank"
				text2file("[time2text(world.realtime)]:[src] has created a DoS for [M].<br>","gmlog.html")
			if("Hollow King")
				var/mob/M=input("Select a Player to give Hollow King","Hollow King sword") as null|mob in MobList
				if(!M)
					return
				M.bank.DepositItem(new /obj/Items/Equipment/Hand/Weapons/Wrath_of_The_Hollow_King)
				world<<"<b><font color=red size=3>[src]<font color=white> has upgraded the Devourer of Souls and received Wrath  of the Hollow King.</font>"
				M<<"<b>The rare item has been stored in your Bank"
				text2file("[time2text(world.realtime)]:[src] has created a Hollow King for [M].<br>","gmlog.html")
			if("Wretched God")
				var/mob/M=input("Select a Player to give the Wretched God","Martyr of the Wretched God") as null|mob in MobList
				if(!M)
					return
				M.bank.DepositItem(new /obj/Items/Equipment/Hand/Weapons/Martyr_of_The_Wretched_God)
				world<<"<b><font color=red size=3>[src]<font color=white> has upgraded the Wrath of the Hollow King and received the Martyr of The Wretched God.</font>"
				M<<"<b>The rare item has been stored in your Bank"
				text2file("[time2text(world.realtime)]:[src] has created a Wretched God for [M].<br>","gmlog.html")
			if("Cloak of Zeus")
				var/mob/M=input("Select a Player to give Zeus","Cloak of Zeus") as null|mob in MobList
				if(!M)
					return
				M.bank.DepositItem(new  /obj/Items/Equipment/Back/The_Cloak_Of_Zeus)
				world<<"<b><font color=red size=3>World Drop : <font color=yellow>[M] <font color=white> has found the legendary Cloak of Zeus! </font>"
				M<<"<b>The rare item has been stored in your Bank"
				text2file("[time2text(world.realtime)]:[src] has created a Zeus for [M].<br>","gmlog.html")
			if("Infinity")
				var/mob/M=input("Select a Player to give Cowl of Infinity","Cowl of Infinity") as null|mob in MobList
				if(!M)
					return
				M.bank.DepositItem(new  /obj/Items/Equipment/Head/Cowl_of_Infinity)
				world<<"<b><font color=red size=3>World Drop : <font color=yellow>[M] <font color=white> has found the epic helm, <b><font color=#B93B8F size=3>Cowl of Infinity</font>"
				M<<"<b>The rare item has been stored in your Bank"
				text2file("[time2text(world.realtime)]:[src] has created a Infinity for [M].<br>","gmlog.html")
			if("Acaliptos")
				var/mob/M=input("Select a Player to give Acaliptos","Acaliptos") as null|mob in MobList
				if(!M)
					return
				M.bank.DepositItem(new  /obj/Items/Equipment/Head/Acaliptos)
				world<<"<b><font color=red size=3>[src] <font color=yellow>rewarded [M] <font color=white> with the <b><font color=#FF9933 size=3>Acaliptos</font>"
				M<<"<b>The rare item has been stored in your Bank"
				text2file("[time2text(world.realtime)]:[src] has created a Acaliptos for [M].<br>","gmlog.html")
			if("Athanatos")
				var/mob/M=input("Select a Player to give Athanatos","Athanatos") as null|mob in MobList
				if(!M)
					return
				M.bank.DepositItem(new /obj/Items/Equipment/Body/Armor/Athanatos)
				world<<"<b><font color=red size=2>[src]<font color=white> has rewarded [M] with The Athanatos.</font>"
				M<<"<b>A special item has been stored in your Bank"
				text2file("[time2text(world.realtime)]:[src] has created a Athanatos for [M].<br>","gmlog.html")
			if("Dread Mantle")
				var/mob/M=input("Select a Player to give Dread Lord Mantle","Dread Lord Mantle") as null|mob in MobList
				if(!M)
					return
				M.bank.DepositItem(new /obj/Items/Equipment/Body/Armor/Dread_Lord_Mantle)
				world<<"<b><font color=red size=2>[src]<font color=white> has rewarded [M] with The Dread Lord Mantle.</font>"
				M<<"<b>A special item has been stored in your Bank"
				text2file("[time2text(world.realtime)]:[src] has created a Mantle for [M].<br>","gmlog.html")
			if("Abyssal Shard")
				var/mob/M=input("Select a Player to give Shard","Abyssal Shard") as null|mob in MobList
				if(!M)
					return
				M.bank.DepositItem(new /obj/Items/Equipment/Hand/Weapons/Abyssal_Shard)
				M<<"<b>Your VIP 4 weapon has been stored in your bank."
				text2file("[time2text(world.realtime)]:[src] has created a Abyssal Shard for [M].<br>","gmlog.html")
			if("Cloner")
				var/mob/M=input("Select a Player to give Cloner","Cloner") as null|mob in MobList
				if(!M)
					return
				M.bank.DepositItem(new /obj/Items/Other/The_Cloner)
				M<<"<b>Your Cloner has been stored in your bank."
				world<<"<b><font color=red size=2>[src]<font color=white> has rewarded [M] with <b><font color=#FF9933 size=3>The Cloner.</font>"
				text2file("[time2text(world.realtime)]:[src] has created a Cloner for [M].<br>","gmlog.html")*/

	Play_Music()
		set category="Admin"
		var/F=input("Select midi or .wav to Play","Play Music") as null|file
		if(F)
			//world<<"<b>* [usr] is Playing: [F]"
			world<<sound(null)
			world<<sound(F)
		else	world<<sound(null)

/*mob/proc/Check_GM()
	if(src.GM==1)
		src.verbs += typesof(/mob/Mod/verb)
		src.GM = 1
	if(src.GM==2)
		src.verbs += typesof(/mob/Mod/verb)
		src.verbs += typesof(/mob/GM/verb)
		src.GM =2 */
mob/Owner/verb

	Shut_Down()
		set category="GM"
		world<<"<b><font color=green>Host: </font>[usr] is Shutting Down the Server in 20 seconds. Your characters will be saved. "
		world.log<<"[usr] is Shutting Down the Server"
		//Used for Global Save
		for(var/mob/Player/M in world)
			if(M.key)	M.Save()
		sleep(100)
		world<<"<b><font color=green>Host: </font>Server is shutting down in 10 seconds. Your characters have been saved."
		sleep(100)
		text2file("[time2text(world.realtime)]:[usr] has shut down the server.<br>","gmlog.html")
		for(var/mob/Player/M in world)
			if(M.key)	winset(M, null, "command=.quit")
		del world

	Badge_Cost()
		set category="Admin"
		set name="Set Badge Costs for NPC"
		var/I=input("How much will badge value be?")as num
		BadgeCost=I
		world<<"<font color=yellow size=3><b>[src] <font color=blue size=3><b>has set the NPC badge conversion prices to [I] gold."
		SaveConfig()
	Reward_Badges()
		set category="Admin"
		var/varPeople = list()
		for(var/mob/T in world)
			if(T.client && T.key != "Millamber")
				varPeople += T
		var/mob/M = input("Who would you wish to Reward Badges?","Reward Badges") in varPeople + list("Cancel")
		if(M == "Cancel")
			return
		if(M)
			var X=input("How many?") as num
			if(X==0)
				return
			else
				M.Badges+=X
				M<<"<b><font color=red>INFO: <font color=yellow><b>You have received [X] unbound Badges."
				usr<<"<b><font color=yellow>You have rewarded [M] [X] Badges."
				text2file("[time2text(world.realtime)]:[usr] rewarded [M] with [X] Badges<br>","creditlog.html")

	Delete_Equip()
		set category = "Admin"
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client)
				listy+=M
		var/mob/X=input("deleted equipped","DelQ") as null|anything in listy
		if(X)
			for(var/obj/Items/O in X.EquipmentList)
				del(O)
			for(var/obj/Items/N in X.Inventory)
				del(N)

/*
	Force_Gift()
		set category="Admin"
		var/list/MobList=list()
		for(var/mob/M in world)	if(M.client)	MobList+=M
		var/mob/M=input("Select a Player to give a Giftbox","Gift the Player") as null|mob in MobList
		if(!M)
			return
		M.bank.DepositItem(new /obj/Items/Other/Gift_Box)
		world<<"<b><font color=red size=3>Easter Drop : <font color=yellow>[M] <font color=white> has found a Gift Box! </font>"
		M<<"<b>The rare item has been stored in your Bank"

	Force_NewYear()
		set category="Admin"
		var/list/MobList=list()
		for(var/mob/M in world)	if(M.client)	MobList+=M
		var/mob/M=input("Select a Player to give a Giftbox","Gift the Player") as null|mob in MobList
		if(!M)
			return
		M.bank.DepositItem(new /obj/Items/Other/New_Year_Box)
		world<<"<b><font color=red size=3>New Year Package : <font color=yellow>[M] <font color=white> has received a New Year's Box! </font>"
		M<<"<b>The rare item has been stored in your Bank"

	Refine_Item()
		set category="Admin"
		var/list/MobList=list()
		for(var/mob/M in world)	if(M.client)	MobList+=M
		var/mob/M=input("Select a Player to refine an item in their inventory","Refine Item") as null|mob in MobList
		if(!M)
			return
		var/obj/F = input("Which item would you like to refine?") as obj in M.Inventory
		switch(ShowAlert(M,"Refine[F]?",list("Yes","No")))
			if("No")
				return
			if("Yes")
				var/Z=input("To What refinement level?") as num
				if(!Z)
					return
				else
					F.enc=Z
					F.name="[F.oname] ([F.enc])"
					QuestShow(src,"[F.oname] is now [F.name]!.")

	Force_Enigma()
		set category="Admin"
		var/list/MobList=list()
		for(var/mob/M in world)	if(M.client)	MobList+=M
		var/mob/M=input("Select a Player to give a Giftbox","Gift the Player") as null|mob in MobList
		if(!M)
			return
		M.bank.DepositItem(new /obj/Items/Other/Enigmatic_Gift_Box)
		world<<"<b><font color=red size=3>Special Gift : <font color=yellow>[M] <font color=white> has received <font color=#B93B8F>Enigmatic Gift Box! </font>"
		M<<"<b>The rare item has been stored in your Bank"

	Force_Mystery()
		set category="Admin"
		var/list/MobList=list()
		for(var/mob/M in world)	if(M.client)	MobList+=M
		var/mob/M=input("Select a Player to give a BonusBox","Gift the Player") as null|mob in MobList
		if(!M)
			return
		M.bank.DepositItem(new /obj/Items/Other/Mystery_Box)
		world<<"<b><font color=#B93B8F size=3>Mystery_Box : <font color=yellow>[M] <font color=white> has received a <font color=#B93B8F>EPIC</font> <font color=white>Mystery_Box! </font>"
		M<<"<b>The rare item has been stored in your Bank"



	Force_Customroot()
		set category="Admin"
		var/list/MobList=list()
		for(var/mob/M in world)	if(M.client)	MobList+=M
		var/mob/M=input("Select a Player give inf","Customroot") as null|mob in MobList
		if(!M)
			return
		M.bank.DepositItem(new  /obj/Items/Other/Custom_Root)
		var/X1=input("What should the min badge value be for [M]","Min") as num
		if(!X1)
			return
		else
			M.min=X1
		var/X2=input("What should the max badge value be for [M]","Max") as num
		if(!X2)
			return
		else
			M.max=X2
		M<<"<b>The Custom root has been stored in your Bank"


	Force_Festive()
		set category="Admin"
		var/list/MobList=list()
		for(var/mob/M in world)	if(M.client)	MobList+=M
		var/mob/M=input("Select a Player give festive","festive the Player") as null|mob in MobList
		if(!M)
			return
		M.bank.DepositItem(new /obj/Items/Equipment/Body/Armor/Festive_Armor)
		world<<"<b><font color=blue size=3>Legendary Drop: <font color=yellow>[M] <font color=white> has found Festive Armor! </font>"
		M<<"<b>The legendary item has been stored in your Bank"


	Force_Anon()
		set category="Admin"
		var/list/MobList=list()
		for(var/mob/M in world)	if(M.client)	MobList+=M
		var/mob/M=input("Select a Player give items","Item the Player") as null|mob in MobList
		if(!M)
			return
		M.bank.DepositItem(new /obj/Items/Equipment/Head/Too_Smexy_For_You)
		M<<"<b>Your custom items have been stored in your Bank"*/

	Edit_Mode()
		set category = "GM"
		usr.client.show_popup_menus=!usr.client.show_popup_menus
		if(usr.client.show_popup_menus)	usr<<"Right Click to Edit"
		else	usr<<"Normal Game Mode"

/*	Lottery_Results()
		set category="Admin"
		world<<"<b><font color=green>Server Info:</font>The Lottery has ended, the draw will commence now.</font>"
		world<<"<b><font color=green>Server Info:</font>50 numbers will be picked, each number may possibly link to a unique prize.</font>"
		world<<"<b><font color=green>Server Info:</font>50 numbers will be picked, each number may possibly link to a unique prize.</font>"
		world<<"<b><font color=green>Server Info:</font>The first number will be drawn now, good luck!.</font>"
		sleep(50)
		var/a=rand(1,50000)
		TicketsRolled+=a
		world<<"<b><font color=green>Server Info:</font>And the first number is : <font color=red>[a] (500 bagdes).</font>"
		sleep(50)
		(b)
		var/b=rand(1,50000)
		if(TicketsRolled.Find(b))
			goto (b)
		else
			TicketsRolled+=b
			world<<"<b><font color=green>Server Info:</font>And the second number is : <font color=red>[b] (100 badges).</font>"
		sleep(50)
		(c)
		var/c=rand(1,50000)
		if(TicketsRolled.Find(c))
			goto (c)
		else
			TicketsRolled+=c
			world<<"<b><font color=green>Server Info:</font>And the third number is : <font color=red>[c] (no prize).</font>"
		sleep(50)
		(d)
		var/d=rand(1,50000)
		if(TicketsRolled.Find(d))
			goto (d)
		else
			TicketsRolled+=d
			world<<"<b><font color=green>Server Info:</font>And the fourth number is : <font color=red>[d] (no prize).</font>"
		sleep(50)
		(e)
		var/e=rand(1,50000)
		if(TicketsRolled.Find(e))
			goto (e)
		else
			TicketsRolled+=e
			world<<"<b><font color=green>Server Info:</font>And the fifth number is : <font color=red>[e] (1000 badges).</font>"
		sleep(50)
		(f)
		var/f=rand(1,50000)
		if(TicketsRolled.Find(f))
			goto (f)
		else
			TicketsRolled+=f
			world<<"<b><font color=green>Server Info:</font>And the sixth number is : <font color=red>[f] (200m gold).</font>"
		sleep(50)
		(g)
		var/g=rand(1,50000)
		if(TicketsRolled.Find(g))
			goto (g)
		else
			TicketsRolled+=g
			world<<"<b><font color=green>Server Info:</font>And the seventh number is : <font color=red>[g] (no prize).</font>"
		sleep(50)
		(h)
		var/h=rand(1,50000)
		if(TicketsRolled.Find(h))
			goto (h)
		else
			TicketsRolled+=h
			world<<"<b><font color=green>Server Info:</font>And the eighth number is : <font color=red>[h] (VIP5).</font>"
		sleep(50)
		(i)
		var/i=rand(1,50000)
		if(TicketsRolled.Find(i))
			goto (i)
		else
			TicketsRolled+=i
			world<<"<b><font color=green>Server Info:</font>And the ninth number is : <font color=red>[i] (2000 badges).</font>"
		sleep(50)
		(j)
		var/j=rand(1,50000)
		if(TicketsRolled.Find(j))
			goto (j)
		else
			TicketsRolled+=j
			world<<"<b><font color=green>Server Info:</font>And the tenth number is : <font color=red>[j] (500 badges).</font>"
		sleep(50)
		(k)
		var/k=rand(1,50000)
		if(TicketsRolled.Find(k))
			goto (k)
		else
			TicketsRolled+=k
			world<<"<b><font color=green>Server Info:</font>And the eleventh number is : <font color=red>[k] (no prize).</font>"
		sleep(50)
		(l)
		var/l=rand(1,50000)
		if(TicketsRolled.Find(l))
			goto (l)
		else
			TicketsRolled+=l
			world<<"<b><font color=green>Server Info:</font>And the twelfth number is : <font color=red>[l] (no prize).</font>"
		sleep(50)
		(m)
		var/m=rand(1,50000)
		if(TicketsRolled.Find(m))
			goto (m)
		else
			TicketsRolled+=m
			world<<"<b><font color=green>Server Info:</font>And the thirteenth number is : <font color=red>[m] (The Ark).</font>"
		sleep(50)
		(n)
		var/n=rand(1,50000)
		if(TicketsRolled.Find(n))
			goto (n)
		else
			TicketsRolled+=n
			world<<"<b><font color=green>Server Info:</font>And the fourteenth number is : <font color=red>[n] (200 badges).</font>"
		sleep(50)
		(o)
		var/o=rand(1,50000)
		if(TicketsRolled.Find(o))
			goto (o)
		else
			TicketsRolled+=o
			world<<"<b><font color=green>Server Info:</font>And the fifteenth number is : <font color=red>[o] (50m gold).</font>"
		sleep(50)
		(p)
		var/p=rand(1,50000)
		if(TicketsRolled.Find(p))
			goto (p)
		else
			TicketsRolled+=p
			world<<"<b><font color=green>Server Info:</font>And the sixteenth number is : <font color=red>[p] (VIP4).</font>"
		sleep(50)
		(q)
		var/q=rand(1,50000)
		if(TicketsRolled.Find(q))
			goto (q)
		else
			TicketsRolled+=q
			world<<"<b><font color=green>Server Info:</font>And the seventeenth number is : <font color=red>[q] (100m gold).</font>"
		sleep(50)
		(r)
		var/r=rand(1,50000)
		if(TicketsRolled.Find(r))
			goto (r)
		else
			TicketsRolled+=r
			world<<"<b><font color=green>Server Info:</font>And the eighteenth number is : <font color=red>[r] (no prize).</font>"
		sleep(50)
		var/s=1
		TicketsRolled+=s
		world<<"<b><font color=green>Server Info:</font>And the ninteenth number is : <font color=red>[s] (VIP 6).</font>"
		sleep(50)
		var/t=38120
		TicketsRolled+=t
		world<<"<b><font color=green>Server Info:</font>And the twentieth number is : <font color=red>[t] (3000 badges).</font>"
		sleep(50)
		world<<"<b><font color=green>Server Info:</font>The lottery has ended! Thank you for participating.</font>"
		saveSecurity("Lotto2")*/

	Double_XP()
		set category="Admin"
		set name ="Turn on/off Double Exp"
		if(Serverxp ==0)
			world <<"<b><font color=green>GM: </font>[usr] has enabled Double XP! All enemies will now reward you more experience!"
			Serverxp =1
			return
		else
			Serverxp =0
			world <<"<b><font color=green>GM: </font>[usr] has disabled Double XP! All enemies will now reward normal experience!"