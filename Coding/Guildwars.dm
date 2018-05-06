

#define DEBUG
/var/const/
	scoreboard={""}
	scoreboardtitle={"<style type="text/css"> body { 	background-image:url("http://xs3.xoospace.com/myspace/graphics/16561.gif"); 	background-attachment:fixed; 	background-position: top left; 	background-repeat:repeat; 	}  table, tr, td { 	background-color: black; 	border: 1px; 	} table table { 	border: 1px; 	} table table table table{ 	border: 1px; 	} table table table { 	border-width: 1px; 	border-color: rgb(0,0,0); 	border-style: ridge; 	background-color: transparent; 	} table table table table { 	background-image:none; 	background-color:transparent; 	} table table table td { 	background-color: rgb(255, 255, 255); 	filter:alpha(100); 	-moz-opacity: 1; 	opacity: 1; 	-khtml-opacity: 1; 	} { 	filter:none; }<STYLE>BODY {background: white;  color: black}</STYLE><head><title>Monster Bash Scoreboard</title></head></body>"}
/Rank_Entry/
	var{Name;Key;Level;Date}
	New(mob/person)
		if(!person)return
		//if(person.GM>=2)return
		if(person.name=="")return
		Name=(person.name)
		Key=(person.key)
		Level=(person.KillPoints)
		Date=(time2text(world.realtime))
/proc/
	RankingDisplay(var/mob/person)
		var/list/levels=new()
		var/savefile/F=new("scoreboard.sav")
		F[("stuff")]>>(levels)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=red>Monster Bash Scores <br>(24th March 2013) <br><center><font color=orange size =2>(Your Score : [person.KillPoints])</font><font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!levels)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B><font color=green size=3>#</th><th><font color=green size=3>Name <I>(key)</I></th><th><font color=green size=3>Monster Kills</th><th><font color=green size=3>Date</th></tr>\n<br>"
			for(var/number in 1 to levels.len)
				var{character=(levels[(number)]);Rank_Entry/Player=(levels[(character)])}
				html+="<tr><td><u><font color=yellow>[(number)]\th</td><td></u><font color=red><center>[(Player.Name)]</center> <I><font color=yellow>(<font color=yellow>[(Player.Key)])</I></td><td><font color=yellow><center>[num2text(round(Player.Level),10000)]</center></td><td><font color=yellow>[(Player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Ranking(var/mob/Player)
		if(!Player||!Player.client)return
		//if(Player.GM>=4)return
		if(Player.Level<=250 || Player.Level>=500 )return
		var/savefile/F=new("scoreboard.sav")
		var/list/level=new()
		F[("stuff")]>>(level)
		if(!level)level=new()
		var{character="[(Player.client.ckey)]/[(Player.name)]"
			score=level.Find(character)
			Rank_Entry/newest=new(Player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(level[(character)])
			if(old.Level>=Player.KillPoints)return score
			while(score>1)
				last=level[(level[(score-1)])]
				if(last.Level>=Player.KillPoints)break
				level[(score)]=(level[(score-1)])
				level[(--score)]=(character)
				level[(level[(score+1)])]=(last)
			level[(character)]=(newest)
			F[("stuff")]<<(level)
			return score
		score=(level.len)
		if(score>=10)
			last=(level[(level[(score)])])
			if(last.Level>=Player.KillPoints)return 11
			level[(score)]=(character)
		else score=(level.len+1),level+=(character)
		while(score>1)
			last=(level[(level[(score-1)])])
			if(last.Level>=Player.KillPoints)break
			level[(score)]=(level[(score-1)])
			level[(--score)]=(character)
			level[(level[(score+1)])]=(last)
		level[(character)]=(newest)
		F[("stuff")]<<(level)
		return score

	RankingDisplay2(var/mob/person)
		var/list/levels=new()
		var/savefile/F=new("scoreboard2.sav")
		F[("stuff")]>>(levels)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=red>Monster Bash Scores <br>(24th March 2013) <br><center><font color=orange size =2>(Your Score : [person.KillPoints])</font><font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!levels)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B><font color=green size=3>#</th><th><font color=green size=3>Name <I>(key)</I></th><th><font color=green size=3>Monster Kills</th><th><font color=green size=3>Date</th></tr>\n<br>"
			for(var/number in 1 to levels.len)
				var{character=(levels[(number)]);Rank_Entry/Player=(levels[(character)])}
				html+="<tr><td><u><font color=yellow>[(number)]\th</td><td></u><font color=red><center>[(Player.Name)]</center> <I><font color=yellow>(<font color=yellow>[(Player.Key)])</I></td><td><font color=yellow><center>[num2text(round(Player.Level),10000)]</center></td><td><font color=yellow>[(Player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Ranking2(var/mob/Player)
		if(!Player||!Player.client)return
		//if(Player.GM>=4)return
		if(Player.Level>=251)return
		var/savefile/F=new("scoreboard2.sav")
		var/list/level=new()
		F[("stuff")]>>(level)
		if(!level)level=new()
		var{character="[(Player.client.ckey)]/[(Player.name)]"
			score=level.Find(character)
			Rank_Entry/newest=new(Player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(level[(character)])
			if(old.Level>=Player.KillPoints)return score
			while(score>1)
				last=level[(level[(score-1)])]
				if(last.Level>=Player.KillPoints)break
				level[(score)]=(level[(score-1)])
				level[(--score)]=(character)
				level[(level[(score+1)])]=(last)
			level[(character)]=(newest)
			F[("stuff")]<<(level)
			return score
		score=(level.len)
		if(score>=10)
			last=(level[(level[(score)])])
			if(last.Level>=Player.KillPoints)return 11
			level[(score)]=(character)
		else score=(level.len+1),level+=(character)
		while(score>1)
			last=(level[(level[(score-1)])])
			if(last.Level>=Player.KillPoints)break
			level[(score)]=(level[(score-1)])
			level[(--score)]=(character)
			level[(level[(score+1)])]=(last)
		level[(character)]=(newest)
		F[("stuff")]<<(level)
		return score

	RankingDisplay3(var/mob/person)
		var/list/levels=new()
		var/savefile/F=new("scoreboard3.sav")
		F[("stuff")]>>(levels)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=red>Monster Bash Scores <br>(24th March 2013) <br><center><font color=orange size =2>(Your Score : [person.KillPoints])</font><font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!levels)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B><font color=green size=3>#</th><th><font color=green size=3>Name <I>(key)</I></th><th><font color=green size=3>Monster Kills</th><th><font color=green size=3>Date</th></tr>\n<br>"
			for(var/number in 1 to levels.len)
				var{character=(levels[(number)]);Rank_Entry/Player=(levels[(character)])}
				html+="<tr><td><u><font color=yellow>[(number)]\th</td><td></u><font color=red><center>[(Player.Name)]</center> <I><font color=yellow>(<font color=yellow>[(Player.Key)])</I></td><td><font color=yellow><center>[num2text(round(Player.Level),10000)]</center></td><td><font color=yellow>[(Player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Ranking3(var/mob/Player)
		if(!Player||!Player.client)return
		//if(Player.GM>=4)return
		if(Player.Level<501)return
		var/savefile/F=new("scoreboard3.sav")
		var/list/level=new()
		F[("stuff")]>>(level)
		if(!level)level=new()
		var{character="[(Player.client.ckey)]/[(Player.name)]"
			score=level.Find(character)
			Rank_Entry/newest=new(Player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(level[(character)])
			if(old.Level>=Player.KillPoints)return score
			while(score>1)
				last=level[(level[(score-1)])]
				if(last.Level>=Player.KillPoints)break
				level[(score)]=(level[(score-1)])
				level[(--score)]=(character)
				level[(level[(score+1)])]=(last)
			level[(character)]=(newest)
			F[("stuff")]<<(level)
			return score
		score=(level.len)
		if(score>=10)
			last=(level[(level[(score)])])
			if(last.Level>=Player.KillPoints)return 11
			level[(score)]=(character)
		else score=(level.len+1),level+=(character)
		while(score>1)
			last=(level[(level[(score-1)])])
			if(last.Level>=Player.KillPoints)break
			level[(score)]=(level[(score-1)])
			level[(--score)]=(character)
			level[(level[(score+1)])]=(last)
		level[(character)]=(newest)
		F[("stuff")]<<(level)
		return score


mob/Event/verb/MonsterBash_Scores()
	set category = "Commands"
	set name="Monster Bash 251-500 scores"
	Ranking(src)
	RankingDisplay(src)

mob/Event/verb/MonsterBash_Scores2()
	set category = "Commands"
	set name="Monster Bash 1-250 scores"
	Ranking2(src)
	RankingDisplay2(src)

mob/Event/verb/MonsterBash_Scores3()
	set category = "Commands"
	set name="Monster Bash 501+ scores"
	Ranking3(src)
	RankingDisplay3(src)

mob/Event/verb/Lock_EXP()
		set category = "Commands"
		set name = "Receive no EXP"
		src.Locked=1
		src<<"You will no longer receive Experience"
		src.Save()

mob/Event/verb/unLock_EXP()
		set category = "Commands"
		set name = "Receive EXP"
		src.Locked=0
		src<<"You can now receive Experience"
		src.Save()

