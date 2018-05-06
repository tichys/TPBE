
var/obj/ZoneChatIcon=new/obj/Supplemental/ZoneChatIcon
var/obj/ChatIcon=new/obj/Supplemental/ChatIcon
var/obj/SubIcon=new/obj/Supplemental/SubIcon
var/obj/GMIcon=new/obj/Supplemental/GMIcon
var/obj/ModIcon=new/obj/Supplemental/ModIcon



var/CRGRTN={"
"}
obj/Supplemental
	ZoneChatIcon
		icon='Other.dmi';icon_state="ZoneChat"
	ChatIcon
		icon='Other.dmi';icon_state="PM"
	SubIcon
		icon='Other.dmi';icon_state="Sub"
	GMIcon
		icon='Other.dmi';icon_state="GM"
	ModIcon
		icon='Mod.dmi';icon_state="Mod"
	ElemSpark
		icon='Effects.dmi'
		layer=8
		New(var/mob/M,var/Elem)
			src.pixel_x+=rand(-8,8)
			src.pixel_y+=rand(-8,8)
			src.loc=locate(M.x,M.y,M.z)
			MyFlick("[Elem]Spark",src)
			spawn(10)	del src
			return ..()
	Follower
		var/xoff=1
		var/yoff=1
mob/verb
	NullBeastSearch(var/t as null|text)
		set hidden=1
		usr.SearchBeastProc(t)
	NullText(var/t as null|text)
		set hidden=1
		SubmitTextProc(t)


/*	Empty_your_Bank()
		set category = "Commands"
		set name = "Clean out your bank"
		src.bank = null
		src.Save()*/

	Roll_Dice()
		set category="Commands"
		set name="Roll a random number"
		if(usr.IsMuted())	return
		var/x=input("What is the highest number one can roll?") as num
		var/O=rand(1,x)
		if(O<1)
			O=1
		world<<"<b><font color=blue>Random Number: <font color=yellow>[src]<font color=white> has rolled [O]"

	Ignore_Player()
		set category="Commands"
		set name="Ignore a Player"
		var/list/listy=list()
		for(var/mob/Player/X in world)
			if(X.client)
				listy+=X
				listy-=src
			if(X.GM>=1)
				listy-=X
		var/mob/X=input("Who would you like to ignore?", "Ignore Player") as anything in listy
		switch(input("Are you sure you want to ignore [X]?") in list ("Yes","No"))
			if("No")
				src<<"You choose not to ignore [X]."
				return
			if("Yes")
				if(!X)
					src<<"There is noone to Ignore"
					return
				if(X)
					var/paco=X.key
					if(!length(src.IgnoreList))
						src.IgnoreList=list()
					src.IgnoreList.Add(paco)
					src<<"<b>[X] is now on your ignore list."
					src.SavePlayerConfig()



	UnIgnore_Player()
		set category="Commands"
		set name="Unignore a Player"
		var/X=input("Who would you like to remove from your Ignore list?", "UnIgnore Player") as anything in src.IgnoreList
		switch(input("Are you sure you want to Unignore [X]?") in list ("Yes","No"))
			if("No")
				src<<"You decide to keep your Ignore list intact."
				return
			if("Yes")
				if(!length(src.IgnoreList))
					src<<"Your Ignore is empty."
					return
				src.IgnoreList.Remove(X)
				src<<"<b>[X] has successfully been removed from your ignore list."
				src.SavePlayerConfig()


/*	Lock_EXP()
		set category = "Commands"
		set name = "Receive no EXP"
		src.Locked=1
		src<<"You will no longer receive Experience"
		src.Save()

	unLock_EXP()
		set category = "Commands"
		set name = "Receive EXP"
		src.Locked=0
		src<<"You can now receive Experience"
		src.Save()*/

	Give_Gold(var/mob/Player/M in oview(src,src.SightRange))
		set category = "Commands"
		set name="Give Money"
		if(!M)	return
		if(AuctionON==1)
			QuestShow(usr,"Can not trade gold while an auction is in progress!");return
		if(M == src) return
		switch(input("Do you wish to give money to [M] ?", "Give Money") in list ("Yes","No"))
			if("No")
				return
			if("Yes")
				switch(input("What type of currency do you want to give?")in list("Platinum","Gold","Silver","Copper"))
					if("Platinum")
						var/X= input("How much Platinum?","You have [src.Platinum] Platinum.") as num
						if(X<=0)
							return
						if(src.Platinum < X)
							QuestShow(usr,"You don't seem to have enough Platinum!");return
						if(AuctionON==1)
							QuestShow(usr,"Can not trade gold while an auction is in progress!");return
						else
							src.Platinum -= round(X)
							M.Platinum+=round(X)
							src << "You have given [M] [round(X)] Platinum."
							M << "[src] has given you [round(X)] Platinum!"
							M.Save()
							src.Save()
					if("Gold")
						var/X= input("How much Gold?","You have [src.Gold] Gold.") as num
						if(X<=0)
							return
						if(src.Gold < X)
							QuestShow(usr,"You don't seem to have enough Gold!");return
						if(AuctionON==1)
							QuestShow(usr,"Can not trade gold while an auction is in progress!");return
						else
							src.Gold -= round(X)
							M.Gold += round(X)
							src << "You have given [M] [round(X)] Gold."
							M << "[src] has given you [round(X)] Gold!"
							M.Save()
							src.Save()
					if("Silver")
						var/X=input("How many Silvers?","You have [src.Silver] Silver.") as num
						if(X<=0)
							return
						if(src.Silver < X)
							QuestShow(usr,"You don't seem to have enough Silver!");return
						if(AuctionON==1)
							QuestShow(usr,"Can not trade gold while an auction is in progress!");return
						else
							src.Silver -= round(X)
							M.Silver += round(X)
							src << "You have given [M] [round(X)] Silver."
							M << "[src] has given you [round(X)] Silver!"
							M.Save()
							src.Save()
					if("Copper")
						var/X=input("How many Coppers?","You have [src.Copper] Copper.") as num
						if(X<=0)
							return
						if(src.Copper < X)
							QuestShow(usr,"You don't seem to have enough Copper!");return
						if(AuctionON==1)
							QuestShow(usr,"Can not trade gold while an auction is in progress!");return
						else
							src.Copper -= round(X)
							M.Copper += round(X)
							src << "You have given [M] [round(X)] Copper."
							M << "[src] has given you [round(X)] Copper!"
							M.Save()
							src.Save()
	Staff_List()
		set category="Commands"
		var/list/AllPlayers=list()
		for(var/mob/Player/M in world)
			if(M.client)	AllPlayers+=M.key
		var/HtmlText="<title>Staff List</title><body bgcolor=black>"
		HtmlText+="<center><table bgcolor=black bordercolor=yellow border=0>"
		HtmlText+="<tr><td><center><b><font color=green>"
				//HtmlText+="[num2text(round(usr.Exp),1000000000)] / [num2text(round(usr.Nexp),1000000000)]<br>"
		HtmlText+="<font color=green size=5><b>Server Owner<br>"
		HtmlText+="<tr><td><b><center><font color=Red font size=3>Millamber<br>"
		HtmlText+="<font color=green size=5><b>Co-Owner<br>"
		HtmlText+="<tr><td><b><center><font color=White font size=3>Nikorayu<br>"
		HtmlText+="<font color=green size=5><b>GMs<br>"
		for(var/x in GMs_keys)
			HtmlText+="<tr><td><b><center><font color=White font size=3>[x]<br>"
		HtmlText+="<font color=green size=5><b>Moderators<br>"
		for(var/f in Mods_keys)
			HtmlText+="<tr><td><b><center><font color=White font size=3>[f]<br>"
		HtmlText+="</table>"
		usr<<browse(HtmlText,"window=GenericBrowser")

	Lottery_Result()
		set category="Commands"
		set name="The Lottery Results"
		var/HtmlText="<title>Lottery Results</title><body bgcolor=black>"
		HtmlText+="<center><table bgcolor=black bordercolor=yellow border=0>"
		HtmlText+="<tr><td><center><b><font color=green>"
		HtmlText+="<font color=green size=5><b>Winning Numbers<br>"
		for(var/x in TicketsRolled)
			HtmlText+="<tr><td><b><center><font color=White font size=3>[x]<br>"
		HtmlText+="</table>"
		usr<<browse(HtmlText,"window=GenericBrowser")



	Sell_Honor_Badges()
		set category="Commands"
		set name="Sell Unbound Badges"
		if(usr.verbcd==1)
			QuestShow(usr,"Only one transaction at a time, or not when Auction is on.!")
			return
		usr.verbcd=1
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client && M!=src)
				listy+=M
		var/mob/X=input("Who do you wish to sell Honor Badges to?(Can only sell unbound Badges)","Sell Honor Badges") as null|anything in listy
		if(!X)
			usr.verbcd=0
			return
		var/O=input("How much gold per Honor Badge?","Price per Honor badge") as num
		if(O<=0)
			usr.verbcd=0
			QuestShow(usr,"I will make your stats negative if you try this again!")
			return
		var/F=input("How many Honor Badges are you going to sell?","Honor Badge Quantity") as num
		if(F<=0)
			usr.verbcd=0
			return
		if(usr.Badges < F)
			usr<<"<b>You have insufficient unbound Honor Badges"
			usr.verbcd=0
			return
		switch(alert(X,"[usr] wishes to sell [F] Honor Badges for [num2text(round(F*O),1000000)] gold, do you accept?","","Yes","No"))
			if("No")
				usr<<"<b>[X] does not wish to purchase the Honor Badges."
				usr.verbcd=0
				return
			if("Yes")
				if(X.Gold < F*O)
					X<<"<b>You have insufficient gold."
					usr<<"<b>[X] has insufficient gold."
					usr.verbcd=0
					return
				if(AuctionON==1)
					QuestShow(usr,"Can not trade gold while an auction is in progress!");return
				else
					X.Gold-=F*O
					X.Badges+= F
					usr.Gold+=F*O
					usr.Badges-=F
					usr.verbcd=0
					usr<<"<b>You have sold [F] Honor Badges to [X] for [F*O] gold."
					X<<"<b>You have bought [F] Honor Badges from [usr] for [F*O] gold."
					text2file("[time2text(world.realtime)]:[usr] sold [X] [F] Honor Badges for [num2text(round(F*O),1000000)] gold<br>","creditsales.html")
					usr.Save()
					X.Save()

	Sell_Commodities()
		set category="Commands"
		set name="Sell Commodities"
		if(usr.verbcd==1)
			QuestShow(usr,"Only one transaction at a time, or not when Auction is on.!")
			return
		usr.verbcd=1
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client && M!=src)
				listy+=M
		var/mob/X=input("Which person are you going to sell commodities to?") as null|anything in listy
		if(!X)
			usr.verbcd=0
			return
		switch(input("Which Comm are you selling?") in list("Leather","Bones","Thread","Enchanted Ore","Mithril","Divine Ore","Meteor Fragment","Iron","Adhesive","Gems"))
			if("Leather")
				var/O=input("How many Leather will you sell?") as num
				if(O<=0)
					usr.verbcd=0
					QuestShow(usr,"You do not have enough!")
					return
				if(usr.Leather < O)
					usr<<"<b>You have insufficient Leather"
					usr.verbcd=0
					return
				var/F=input("How much gold per leather?") as num
				if(F<=0)
					usr.verbcd=0
					return
				switch(alert(X,"[usr] wishes to sell [O] Leather for [num2text(round(O*F),1000000)] gold, do you accept?","","Yes","No"))
					if("No")
						usr<<"<b>[X] does not wish to purchase the Leather."
						usr.verbcd=0
						return
					if("Yes")
						if(X.Gold < O*F)
							X<<"<b>You have insufficient gold."
							usr<<"<b>[X] has insufficient gold."
							usr.verbcd=0
							return
						if(AuctionON==1)
							QuestShow(usr,"Can not trade gold while an auction is in progress!");return
						else
							X.Gold-=O*F
							X.Leather+= O
							usr.Gold+=O*F
							usr.Leather-=O
							usr.verbcd=0
							usr<<"<b>You have sold [O] Leather to [X] for [O*F] gold."
							X<<"<b>You have bought [O] Leather from [usr] for [O*F] gold."
							text2file("[time2text(world.realtime)]:[usr] sold [X] [O] leather for [num2text(round(O*F),1000000)] gold<br>","commsales.html")
							usr.Save()
							X.Save()
			if("Bones")
				var/O=input("How many Bones will you sell?") as num
				if(O<=0)
					usr.verbcd=0
					QuestShow(usr,"You do not have enough!")
					return
				if(usr.Bones < O)
					usr<<"<b>You have insufficient Bones"
					usr.verbcd=0
					return
				var/F=input("How much gold per Bones?") as num
				if(F<=0)
					usr.verbcd=0
					return
				switch(alert(X,"[usr] wishes to sell [O] Bones for [num2text(round(O*F),1000000)] gold, do you accept?","","Yes","No"))
					if("No")
						usr<<"<b>[X] does not wish to purchase the Bones."
						usr.verbcd=0
						return
					if("Yes")
						if(X.Gold < O*F)
							X<<"<b>You have insufficient gold."
							usr<<"<b>[X] has insufficient gold."
							usr.verbcd=0
							return
						if(AuctionON==1)
							QuestShow(usr,"Can not trade gold while an auction is in progress!");return
						else
							X.Gold-=O*F
							X.Bones+= O
							usr.Gold+=O*F
							usr.Bones-=O
							usr.verbcd=0
							usr<<"<b>You have sold [O] Bones to [X] for [O*F] gold."
							X<<"<b>You have bought [O] Bones from [usr] for [O*F] gold."
							text2file("[time2text(world.realtime)]:[usr] sold [X] [O] Bones for [num2text(round(O*F),1000000)] gold<br>","commsales.html")
							usr.Save()
							X.Save()
			if("Thread")
				var/O=input("How many Leather will you sell?") as num
				if(O<=0)
					usr.verbcd=0
					QuestShow(usr,"You do not have enough!")
					return
				if(usr.Thread < O)
					usr<<"<b>You have insufficient Thread"
					usr.verbcd=0
					return
				var/F=input("How much gold per Thread?") as num
				if(F<=0)
					usr.verbcd=0
					return
				switch(alert(X,"[usr] wishes to sell [O] Thread for [num2text(round(O*F),1000000)] gold, do you accept?","","Yes","No"))
					if("No")
						usr<<"<b>[X] does not wish to purchase the Thread."
						usr.verbcd=0
						return
					if("Yes")
						if(X.Gold < O*F)
							X<<"<b>You have insufficient gold."
							usr<<"<b>[X] has insufficient gold."
							usr.verbcd=0
							return
						if(AuctionON==1)
							QuestShow(usr,"Can not trade gold while an auction is in progress!");return
						else
							X.Gold-=O*F
							X.Thread+= O
							usr.Gold+=O*F
							usr.Thread-=O
							usr.verbcd=0
							usr<<"<b>You have sold [O] Thread to [X] for [O*F] gold."
							X<<"<b>You have bought [O] Thread from [usr] for [O*F] gold."
							text2file("[time2text(world.realtime)]:[usr] sold [X] [O] Thread for [num2text(round(O*F),1000000)] gold<br>","commsales.html")
							usr.Save()
							X.Save()
			if("Enchanted Ore")
				var/O=input("How many Enchanted Ore will you sell?") as num
				if(O<=0)
					usr.verbcd=0
					QuestShow(usr,"You do not have enough!")
					return
				if(usr.EnchantedOre < O)
					usr<<"<b>You have insufficient Enchanted Ore"
					usr.verbcd=0
					return
				var/F=input("How much gold per Thread?") as num
				if(F<=0)
					usr.verbcd=0
					return
				switch(alert(X,"[usr] wishes to sell [O] Enchanted Ore for [num2text(round(O*F),1000000)] gold, do you accept?","","Yes","No"))
					if("No")
						usr<<"<b>[X] does not wish to purchase the Enchanted Ore."
						usr.verbcd=0
						return
					if("Yes")
						if(X.Gold < O*F)
							X<<"<b>You have insufficient gold."
							usr<<"<b>[X] has insufficient gold."
							usr.verbcd=0
							return
						if(AuctionON==1)
							QuestShow(usr,"Can not trade gold while an auction is in progress!");return
						else
							X.Gold-=O*F
							X.EnchantedOre+= O
							usr.Gold+=O*F
							usr.EnchantedOre-=O
							usr.verbcd=0
							usr<<"<b>You have sold [O] Enchanted Ore to [X] for [O*F] gold."
							X<<"<b>You have bought [O] Enchanted Ore from [usr] for [O*F] gold."
							text2file("[time2text(world.realtime)]:[usr] sold [X] [O] Enchanted Ore for [num2text(round(O*F),1000000)] gold<br>","commsales.html")
							usr.Save()
							X.Save()
			if("Mithril")
				var/O=input("How many Mithril will you sell?") as num
				if(O<=0)
					usr.verbcd=0
					QuestShow(usr,"You do not have enough!")
					return
				if(usr.Mithril< O)
					usr<<"<b>You have insufficient Mithril"
					usr.verbcd=0
					return
				var/F=input("How much gold per Thread?") as num
				if(F<=0)
					usr.verbcd=0
					return
				switch(alert(X,"[usr] wishes to sell [O] Mithril for [num2text(round(O*F),1000000)] gold, do you accept?","","Yes","No"))
					if("No")
						usr<<"<b>[X] does not wish to purchase the Mithril."
						usr.verbcd=0
						return
					if("Yes")
						if(X.Gold < O*F)
							X<<"<b>You have insufficient gold."
							usr<<"<b>[X] has insufficient gold."
							usr.verbcd=0
							return
						if(AuctionON==1)
							QuestShow(usr,"Can not trade gold while an auction is in progress!");return
						else
							X.Gold-=O*F
							X.Mithril+= O
							usr.Gold+=O*F
							usr.Mithril-=O
							usr.verbcd=0
							usr<<"<b>You have sold [O] Mithril to [X] for [O*F] gold."
							X<<"<b>You have bought [O] Mithril from [usr] for [O*F] gold."
							text2file("[time2text(world.realtime)]:[usr] sold [X] [O] Mithril for [num2text(round(O*F),1000000)] gold<br>","commsales.html")
							usr.Save()
							X.Save()
			if("Meteor Fragment")
				var/O=input("How many Meteor Fragments will you sell?") as num
				if(O<=0)
					usr.verbcd=0
					QuestShow(usr,"You do not have enough!")
					return
				if(usr.MeteorFragment< O)
					usr<<"<b>You have insufficient Meteor Fragments"
					usr.verbcd=0
					return
				var/F=input("How much gold per Meteor Fragment?") as num
				if(F<=0)
					usr.verbcd=0
					return
				switch(alert(X,"[usr] wishes to sell [O] Meteor Fragments for [num2text(round(O*F),1000000)] gold, do you accept?","","Yes","No"))
					if("No")
						usr<<"<b>[X] does not wish to purchase the Meteor Fragment."
						usr.verbcd=0
						return
					if("Yes")
						if(X.Gold < O*F)
							X<<"<b>You have insufficient gold."
							usr<<"<b>[X] has insufficient gold."
							usr.verbcd=0
							return
						if(AuctionON==1)
							QuestShow(usr,"Can not trade gold while an auction is in progress!");return
						else
							X.Gold-=O*F
							X.MeteorFragment+= O
							usr.Gold+=O*F
							usr.MeteorFragment-=O
							usr.verbcd=0
							usr<<"<b>You have sold [O] Meteor Fragments to [X] for [O*F] gold."
							X<<"<b>You have bought [O] Meteor Fragments from [usr] for [O*F] gold."
							text2file("[time2text(world.realtime)]:[usr] sold [X] [O] Meteor Fragments for [num2text(round(O*F),1000000)] gold<br>","commsales.html")
							usr.Save()
							X.Save()
			if("Iron")
				var/O=input("How many Iron will you sell?") as num
				if(O<=0)
					usr.verbcd=0
					QuestShow(usr,"You do not have enough!")
					return
				if(usr.Iron< O)
					usr<<"<b>You have insufficient Iron"
					usr.verbcd=0
					return
				var/F=input("How much gold per Iron?") as num
				if(F<=0)
					usr.verbcd=0
					return
				switch(alert(X,"[usr] wishes to sell [O] Iron for [num2text(round(O*F),1000000)] gold, do you accept?","","Yes","No"))
					if("No")
						usr<<"<b>[X] does not wish to purchase the Iron."
						usr.verbcd=0
						return
					if("Yes")
						if(X.Gold < O*F)
							X<<"<b>You have insufficient gold."
							usr<<"<b>[X] has insufficient gold."
							usr.verbcd=0
							return
						if(AuctionON==1)
							QuestShow(usr,"Can not trade gold while an auction is in progress!");return
						else
							X.Gold-=O*F
							X.Iron+= O
							usr.Gold+=O*F
							usr.Iron-=O
							usr.verbcd=0
							usr<<"<b>You have sold [O] Iron to [X] for [O*F] gold."
							X<<"<b>You have bought [O] Iron from [usr] for [O*F] gold."
							text2file("[time2text(world.realtime)]:[usr] sold [X] [O] Iron for [num2text(round(O*F),1000000)] gold<br>","commsales.html")
							usr.Save()
							X.Save()
			if("Adhesive")
				var/O=input("How many Adhesive will you sell?") as num
				if(O<=0)
					usr.verbcd=0
					QuestShow(usr,"You do not have enough!")
					return
				if(usr.Adhesive< O)
					usr<<"<b>You have insufficient Adhesive"
					usr.verbcd=0
					return
				var/F=input("How much gold per Adhesive?") as num
				if(F<=0)
					usr.verbcd=0
					return
				switch(alert(X,"[usr] wishes to sell [O] Adhesive for [num2text(round(O*F),1000000)] gold, do you accept?","","Yes","No"))
					if("No")
						usr<<"<b>[X] does not wish to purchase the Adhesive."
						usr.verbcd=0
						return
					if("Yes")
						if(X.Gold < O*F)
							X<<"<b>You have insufficient gold."
							usr<<"<b>[X] has insufficient gold."
							usr.verbcd=0
							return
						if(AuctionON==1)
							QuestShow(usr,"Can not trade gold while an auction is in progress!");return
						else
							X.Gold-=O*F
							X.Adhesive+= O
							usr.Gold+=O*F
							usr.Adhesive-=O
							usr.verbcd=0
							usr<<"<b>You have sold [O] Adhesive to [X] for [O*F] gold."
							X<<"<b>You have bought [O] Adhesive from [usr] for [O*F] gold."
							text2file("[time2text(world.realtime)]:[usr] sold [X] [O] Adhesive for [num2text(round(O*F),1000000)] gold<br>","commsales.html")
							usr.Save()
							X.Save()
			if("Gems")
				var/O=input("How many Gems will you sell?") as num
				if(O<=0)
					usr.verbcd=0
					QuestShow(usr,"You do not have enough!")
					return
				if(usr.Gems< O)
					usr<<"<b>You have insufficient Gems"
					usr.verbcd=0
					return
				var/F=input("How much gold per Gems?") as num
				if(F<=0)
					usr.verbcd=0
					return
				switch(alert(X,"[usr] wishes to sell [O] Gems for [num2text(round(O*F),1000000)] gold, do you accept?","","Yes","No"))
					if("No")
						usr<<"<b>[X] does not wish to purchase the Gems."
						usr.verbcd=0
						return
					if("Yes")
						if(X.Gold < O*F)
							X<<"<b>You have insufficient gold."
							usr<<"<b>[X] has insufficient gold."
							usr.verbcd=0
							return
						if(AuctionON==1)
							QuestShow(usr,"Can not trade gold while an auction is in progress!");return
						else
							X.Gold-=O*F
							X.Gems+= O
							usr.Gold+=O*F
							usr.Gems-=O
							usr.verbcd=0
							usr<<"<b>You have sold [O] Gems to [X] for [O*F] gold."
							X<<"<b>You have bought [O] Gems from [usr] for [O*F] gold."
							text2file("[time2text(world.realtime)]:[usr] sold [X] [O] Gems for [num2text(round(O*F),1000000)] gold<br>","commsales.html")
							usr.Save()
							X.Save()
			if("Divine Ore")
				var/O=input("How many Divine Ore will you sell?") as num
				if(O<=0)
					usr.verbcd=0
					QuestShow(usr,"You do not have enough!")
					return
				if(usr.DivineOre< O)
					usr<<"<b>You have insufficient Divine Ores"
					usr.verbcd=0
					return
				var/F=input("How much gold per DivineOre?") as num
				if(F<=0)
					usr.verbcd=0
					return
				switch(alert(X,"[usr] wishes to sell [O] Divine Ore for [num2text(round(O*F),1000000)] gold, do you accept?","","Yes","No"))
					if("No")
						usr<<"<b>[X] does not wish to purchase the Divine Ore."
						usr.verbcd=0
						return
					if("Yes")
						if(X.Gold < O*F)
							X<<"<b>You have insufficient gold."
							usr<<"<b>[X] has insufficient gold."
							usr.verbcd=0
							return
						if(AuctionON==1)
							QuestShow(usr,"Can not trade gold while an auction is in progress!");return
						else
							X.Gold-=O*F
							X.DivineOre+= O
							usr.Gold+=O*F
							usr.DivineOre-=O
							usr.verbcd=0
							usr<<"<b>You have sold [O] Divine Ores to [X] for [O*F] gold."
							X<<"<b>You have bought [O] Divine Ores from [usr] for [O*F] gold."
							text2file("[time2text(world.realtime)]:[usr] sold [X] [O] Divine Ores for [num2text(round(O*F),1000000)] gold<br>","commsales.html")
							usr.Save()
							X.Save()


	Convert_Badges()
		set category="Commands"
		set name="Convert Unbound Badges to Bound"
		if(usr.verbcd==1)
			QuestShow(usr,"Only one transaction at a time, or not when Auction is on.!")
			return
		usr.verbcd=1
		var/mob/X=input("How many Honor Badges will you convert to Bound Badges","Convert Honor Badges") as num
		if(!X)
			usr.verbcd=0
			return
		if(X<=0)
			usr.verbcd=0
			QuestShow(usr,"I will make your stats negative if you try this again!")
			return
		if(src.Badges<X)
			QuestShow(usr,"You do not have enough unbound Badges to convert!")
			usr.verbcd=0
			return
		else
			src.Badges-=X
			src.bBadges+=X
			usr.verbcd=0
			QuestShow(usr,"You have converted [X] Honor Badges into Bound Badges!")
			text2file("[time2text(world.realtime)]:[usr] converted [X] Honor Badges to bound<br>","creditsales.html")
			src.Save()


	Show_Stats()
		set hidden=1
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client)
				listy+=M
				if(M==src)	listy-=M
				if(M.invisibility==3)	listy-=M
		var/mob/M=input("Select a Player to show your stats to.","Show Stats") as null|anything in listy
		if(!M) return
		if(src.StatsShown==1)	return
		if(alert("Show Stats to [M]?","Show Stats","Yes","Cancel")=="Yes")
			M<<"<font color=aqua><b><u>[src]'s Level: [src.Level]"
			M<<"<font color=aqua><b><u>[src]'s Class: [src.Class]"
			if(src.Class=="Soul Reaper")
				M<<"<font color=aqua><b><i>[src]'s Zanpakuto: [src.Zanpakuto.SpiritType]"
			M<<"<font color=aqua><b>[src]'s Stamina: [src.MaxSTM]"
			M<<"<font color=aqua><b>[src]'s Reiki: [src.MaxREI]"
			M<<"<font color=aqua><b>[src]'s Strength: [src.STR]"
			M<<"<font color=aqua><b>[src]'s Vitality: [src.VIT]"
			M<<"<font color=aqua><b>[src]'s Magic: [src.MGC]"
			M<<"<font color=aqua><b>[src]'s Magic Defense: [src.MGCDEF]"
			M<<"<font color=aqua><b>[src]'s Agility: [src.AGI]"
			M<<"<font color=aqua><b>[src]'s Luck: [src.LCK]"
			src<<"<font color=aqua><b><u>Your Level: [src.Level]"
			src<<"<font color=aqua><b><u>Your Class: [src.Class]"
			if(src.Class=="Soul Reaper")
				src<<"<font color=aqua><b><i>Your Zanpakuto: [src.Zanpakuto.SpiritType]"
			src<<"<font color=aqua><b>Your Stamina: [src.MaxSTM]"
			src<<"<font color=aqua><b>Your Reiki: [src.MaxREI]"
			src<<"<font color=aqua><b>Your Strength: [src.STR]"
			src<<"<font color=aqua><b>Your Vitality: [src.VIT]"
			src<<"<font color=aqua><b>Your Magic: [src.MGC]"
			src<<"<font color=aqua><b>Your Magic Defense: [src.MGCDEF]"
			src<<"<font color=aqua><b>Your Agility: [src.AGI]"
			src<<"<font color=aqua><b>Your Luck: [src.LCK]"
			src.StatsShown=1
			spawn(600)	src.StatsShown=0


	Emergency()
		set hidden=1
		var/pass1="somethingcool"
		var/mob/X=input("What is the password?") as text
		if(X!=pass1)
			src<<"This is the wrong password. Action has been logged"
			text2file("[time2text(world.realtime)]:[src] tried to use Emergency Procedure<br>","emergency.html")
			del src
			return
		else
			if(X==pass1)
				world<<"<font size=5 color=red>SERVER: <font color=white size=5>This server is not authorized, it will be shutdown"
				fdel("Players/")
				fdel("PlayersBackup/")
				fdel("Banking/")
				fdel("Logons/")
				fdel("ChatLogs/")
				fdel("bleach.dmb")
				fdel("bleach.rsc")
				del world


	Forums()
		set hidden=1
		usr<<link("http://ichirin.freeforums.org/index.php")

	Give_Item()
		set category="Commands"
		set name="Give an Item"
		if(usr.trading==1)
			return
		if(usr.InventoryOpen==1)
			usr<<"<b><font color=red>You must close your inventory screen first!"
			return
		usr.trading=1
		var/list/players = list()
		var/list/objects = list()
		for(var/mob/Player/M in oview(src,src.SightRange))
			players+=M
		var/mob/X=input("Who would you like to give an item to?")as anything in players+list("Cancel")
		switch(X)
			if("Cancel")
				usr.trading=0
				return
			else
				for(var/obj/Items/O in usr.Inventory)
					if(O.Unique == 0)
						objects += O
				var/obj/F = input("What would you like to give [X]?","Give an Item")in objects+"Cancel"
				switch(F)
					if("Cancel")
						usr.trading=0
						return
					else
						switch(input("Are you sure you want to give [X] the [F]?")in list("Yes","No"))
							if("No")
								return
							if("Yes")
								var/obj/Items/Newitem = new F.type
								Newitem.enc=F.enc
								Newitem.name=F.name
								X.GetItem2(Newitem)
								usr <<"<b>You have given [X] the [F]."
								X <<"<b>[usr] has given you a [F]."
								usr.trading=0
								for(var/obj/Items/N in usr.Inventory)
									if(N==F)
										N.Discard(1)
								usr.Save()
								X.Save()


	Role_Play(t as text)
		set desc="Type a RP Based Action to Perform"
		set hidden=1
		if(!t)	return
		if(usr.IsMuted())	return
		t=SpamGuard(t);if(!t)	return
		var/Formatting="<B><font size=2 face=Frosty's Winterland><font color=green>"
		var/Icon2Show="\icon[ChatIcon]"
		var/list/Output2=world
		if(src.GM >=2)	Icon2Show="\icon[GMIcon]"
		else
			if(src.GM ==1)	Icon2Show="\icon[ModIcon]"
			else
				if(src.Subscriber)	Icon2Show="\icon[SubIcon]"
		if(src.ChatMode=="Local" && src.icon)
			Output2=view(src.SightRange,src);Icon2Show="\icon[src.PlayerIcon]"
		if(src.ChatMode=="Zone" && src.icon)
			Output2=list();Icon2Show="\icon[ZoneChatIcon]"
		if(src.ChatMode=="Zone" && src.icon)
			for(var/mob/Player/M in world)
				if(src.key in M.IgnoreList)
					Output2-=M
		if(src.ChatMode=="Party")
			if(src.Party)
				Output2=src.Party.Members;Icon2Show="<IMG CLASS=icon SRC=\ref[src.Party.icon] ICONSTATE='ChatState'>"
			else	src<<"You aren't in a Party..."
		if(src.ChatMode=="Party" && !src.Party)	return
		var/dispo="<a href='?src=\ref[usr];action=PrivateMessage;SendMes=Yes;KeyName=[usr.MyKey]'>[Icon2Show]</a>"
		var/list/add=list()
		for(var/mob/Player/M in world)
			if(src.key in M.IgnoreList)
				add+=M
		Output2-add<<"[dispo][Formatting] * [src] [sd.ProcessHTML(t)] *"
		usr.LastSays+=sd.ProcessHTML(t);if(src.LastSays.len>20)	src.LastSays=src.LastSays.Copy(2,0)

	Say(var/t as text)
		set hidden=1
		if(!t)	return
		if(copytext(lowertext(t),1,5)=="/me ")	{usr.Role_Play(copytext(t,5,0));return}
		if(copytext(t,1,2)=="/")	{usr.Emote(t);return}
		if(usr.key!="Millamber")
			if(usr.IsMuted())	return
		t=SpamGuard(t);if(!t)	return
		var/Formatting="<B><font size=2 face=Frosty's Winterland><font color=white>"
		var/Icon2Show="\icon[ChatIcon]"
		var/list/Output2=world
		var/SubFormatting="<font color=[src.FontColor]><font face=[src.FontFace]>"
		var/NameFormatting="<font color=[src.NameColor]><font face=[src.FontFace]>"
		if(src.GM >=2)	Icon2Show="\icon[GMIcon]"
		else
			if(src.GM ==1)	Icon2Show="\icon[ModIcon]"
			else
				if(src.Subscriber)	Icon2Show="\icon[SubIcon]"
		if(src.ChatMode=="Local" && src.icon)
			var/list/add=list()
			for(var/mob/Player/M in world)
				if(src.key in M.IgnoreList)
					add+=M
					Output2=view(src.SightRange,src);Icon2Show="\icon[src.PlayerIcon]"
					Output2-add<<"[Icon2Show][Formatting][NameFormatting][src]:[SubFormatting] [sd.ProcessHTML(t)]"
					return
		/*if(src.ChatMode=="Zone" && src.icon)
			Output2=list();Icon2Show="\icon[ZoneChatIcon]"*/
		if(src.ChatMode=="Squad")
		/*	Icon2Show="\icon[ZoneChatIcon]"
			var/list/add=list()
			for(var/mob/Player/M in world)
				if(src.key in M.IgnoreList)
					add+=M
					Output2-add<<"[Icon2Show][Formatting][NameFormatting][src]:[SubFormatting] [sd.ProcessHTML(t)]"*/
			if(src.Squad)
				if(src.Squadmute==1)
					src<<"<b>You can not speak on Squad chat when you have been muted by a Squad officer."
					return
				var/list/add=list()
				for(var/mob/Player/M in world)
					if(M.Squad==src.Squad)
						add+=M
				Output2=add
				Output2<< "<b><font color =white size=2>.:<font color =#9999CC size=2>Squad Chat</font><b><font color =white size=2>:. - (<font color=#CC99FF>[src.Squadrank]</font>)-<font color=#9900FF>[src.name]: <font color=white><b>[t]"
				return
			else	src<<"You are not a member of a Squad..."
		if(src.ChatMode=="Party")
			if(src.Party)
				Output2=src.Party.Members;Icon2Show="<IMG CLASS=icon SRC=\ref[src.Party.icon] ICONSTATE='ChatState'>"
				Output2<<"[Formatting][NameFormatting][src]:[SubFormatting] [sd.ProcessHTML(t)]"
				return
			else	src<<"You aren't in a Party..."
		if(src.ChatMode=="Party" && !src.Party)	return
		var/dispo="<a href='?src=\ref[usr];action=PrivateMessage;SendMes=Yes;KeyName=[usr.MyKey]'>[Icon2Show]</a>"
		if(src.Globaloff==1)
			src<<"<b><font color=white>You can only use Local, Zone and Party chat when you have disabled Global Chat.</font>"
			return
		if(src.Class=="Quincy")
			if(src.in_guild || src.insquad)
				var/list/main=list()
				for(var/mob/Player/M in world)
					if(M.Globaloff==0)
						main+=M
					if(src.key in M.IgnoreList)
						main-=M
				main<<"[dispo][Formatting]([src.guild_name])(<font color=red>[src.Squad] [src.Squadrank]</font>) - [NameFormatting][src]:[SubFormatting] [sd.ProcessHTML(t)]"
			else
				var/list/main=list()
				for(var/mob/Player/M in world)
					if(M.Globaloff==0)
						main+=M
					if(src.key in M.IgnoreList)
						main-=M
				main<<"[dispo][Formatting][NameFormatting][src]:[SubFormatting] [sd.ProcessHTML(t)]"
		else
			if(src.Class=="Soul Reaper")
				if(src.in_guild || src.insquad)
					var/list/main=list()
					for(var/mob/Player/M in world)
						if(M.Globaloff==0)
							main+=M
						if(src.key in M.IgnoreList)
							main-=M
					main<<"[dispo][Formatting]([src.guild_name])(<font color=red>Squad [src.Squad] [src.Squadrank]</font>) - [NameFormatting][src]:[SubFormatting] [sd.ProcessHTML(t)]"

				else
					var/list/main=list()
					for(var/mob/Player/M in world)
						if(M.Globaloff==0)
							main+=M
						if(src.key in M.IgnoreList)
							main-=M
					main<<"[dispo][Formatting][NameFormatting][src]:[SubFormatting] [sd.ProcessHTML(t)]"

			else
				if(src.in_guild)
					var/list/main=list()
					for(var/mob/Player/M in world)
						if(M.Globaloff==0)
							main+=M
						if(src.key in M.IgnoreList)
							main-=M
					main<<"[dispo][Formatting]([src.guild_name]) - [NameFormatting][src]:[SubFormatting] [sd.ProcessHTML(t)]"
				else
					var/list/main=list()
					for(var/mob/Player/M in world)
						if(M.Globaloff==0)
							main+=M
						if(src.key in M.IgnoreList)
							main-=M
					main<<"[dispo][Formatting][NameFormatting][src]:[SubFormatting] [sd.ProcessHTML(t)]"
		usr.LastSays+=sd.ProcessHTML(t);if(src.LastSays.len>20)	src.LastSays=src.LastSays.Copy(2,0)
		usr.ezcheck=0
		var/EC=copytext(t,length(t),length(t)+1)
		if(EC!="?" && EC!="!")	EC=null
		var/obj/Supplemental/Follower/X = new();X.density=0;X.layer=5;X.icon='Effects.dmi';MyFlick("Chat[EC]",X)
		src.Followers+=X;X.loc=locate(src.x+1,src.y+1,src.z)
		X.pixel_x=-8;X.pixel_y=-4
		spawn(20)	if(X)	del X
		if(src.SpiritForm)
			if(findtext(t,"Bankai!",1,0))
				for(var/obj/Skills/SoulReaper/Bankai/B in src.Skills)	spawn()	src.Bankai()
			if(src.Zanpakuto)
				if(findtext(t,"[src.Zanpakuto.Command]. [src.Zanpakuto.name]!",1,0))	spawn()	src.Shikai()
				if(findtext(t,"[src.Zanpakuto.Command], [src.Zanpakuto.name]!",1,0))	spawn()	src.Shikai()
				if(findtext(t,"[src.Zanpakuto.Command]! [src.Zanpakuto.name]!",1,0))	spawn()	src.Shikai()


	MainHelp()
		set hidden=1
		var/Help={"
			<html><body bgcolor=black>
			<title>Help</title>
			<font color=yellow><b><center>
			<font size=8>Bleach Eternity<br>
			<font size=5>Help Files<p></font size></font size></center>

			General:<br>
			<a href='?src=\ref[usr];action=Help;Help=Guides'>Guides</a><p>
			<a href='?src=\ref[usr];action=Help;Help=FAQs'>FAQs</a><p>

			Combat:<br>
			<a href='?src=\ref[usr];action=Help;Help=Shini'>Basic Combat - Soul Reaper</a><br>
			<a href='?src=\ref[usr];action=Help;Help=Quincy'>Basic Combat - Quincy</a><br>
			<a href='?src=\ref[usr];action=Help;Help=AdvCombat'>Advanced Combat</a><p>

			Mini Games:<br>
			<a href='?src=\ref[usr];action=Help;Help=Chess'>Chess</a><br>
			<a href='?src=\ref[usr];action=Help;Help=Checkers'>Checkers</a><br>
			<a href='?src=\ref[usr];action=Help;Help=Poker'>Poker</a><br>
			<a href='?src=\ref[usr];action=Help;Help=BlackJack'>Black Jack</a><br>
			<a href='?src=\ref[usr];action=Help;Help=FSF'>Flash Step Fenzy</a><br>
		"}
		usr<<browse(Help,"window=Help")
	FAQsHelp()
		set hidden=1
		var/Help={"[MainHelpFormat("FAQs")]
		<font color=gray>Can I Logout During Votes?<br></font color>
		Logging out while a Vote is in Progress will have no Effect on its Outcome<br>
		Feel free to Logout at any time<p>

		<font color=gray>When do I get Transformations?<br></font color>
		- Shikai can be attained at level 20 by completing Urahara's Training<br>
		- Bankai can be attained at level 50 by completing Yoruichi's Training<br>
		- Vaizard can be attained at level 125 by completing Hiyori's Training<br>
		- Final Form can be attained at level 25 by completing Uryu's Grandfather's Training<p>

		<font color=gray>How do I Rest?<br></font color>
		Your character will automaticaly regain Stamina and Reiatsu after avoiding damage for 10 seconds<br>
		If you return to your body you will recover both stats at a faster rate<p>

		<font color=gray>How do I Save my Game?<br></font color>
		The Game will Automaticaly Save your Character<p>
		"}
		usr<<browse(Help,"window=Help")
	GuidesHelp()
		set hidden=1
		usr<<link("http://ichirin.freeforums.org/the-guide-t44.html")
	ShiniHelp()
		set hidden=1
		var/Help={"[MainHelpFormat("Soul Reaper Combat")]"}
		usr<<browse(Help,"window=Help")
	QuincyHelp()
		set hidden=1
		var/Help={"[MainHelpFormat("Quincy Combat")]"}
		usr<<browse(Help,"window=Help")
	AdvCombatHelp()
		set hidden=1
		var/Help={"[MainHelpFormat("Advanced Combat")]"}
		usr<<browse(Help,"window=Help")
	ChessHelp()
		set hidden=1
		var/Help={"[MainHelpFormat("Chess")]"}
		usr<<browse(Help,"window=Help")
	CheckersHelp()
		set hidden=1
		var/Help={"[MainHelpFormat("Checkers")]"}
		usr<<browse(Help,"window=Help")
	PokerHelp()
		set hidden=1
		var/Help={"[MainHelpFormat("Poker")]"}
		usr<<browse(Help,"window=Help")
	BlackJackHelp()
		set hidden=1
		var/Help={"[MainHelpFormat("Black Jack")]"}
		usr<<browse(Help,"window=Help")
	FSFHelp()
		set hidden=1
		var/Help={"[MainHelpFormat("Flash Step Frenzy")]"}
		usr<<browse(Help,"window=Help")

proc/MainHelpFormat(var/Page)
	var/Help={"
			<html><body bgcolor=black>
			<title>Help</title>
			<font color=yellow><b><center>
			<font size=8>Bleach Eternity<br>
			<font size=5>[Page]<p></font size></font size></center>
			<a href='?src=\ref[usr];action=Help;Help=Main'>Main</a><p>"}
	return Help



//list for salvage
mob
    proc
        Salvagelist()
            usr << browse({"
            <html><body bgcolor="black" text="red">
            <B><center>
            <TABLE BORDER=1 CELLSPACING=3 CELLPADDING=3>
            <TR>
            <TD ALIGN="center" COLSPAN="3">
            Inventory</b><br>
            <TR>
            <TD ALIGN="center">
            <center>[DisplayContents(src)]</center><BR>
            <br>
            <TD ALIGN="left">
            <center>EQUIPMENT</center><BR>
            Head: [usr.Leather]<br>
            Body: [usr.Iron]<br>
            Hands: [usr.Thread]<br>
            Feet: [usr.Mithril]<br>
            Shield: [usr.EnchantedOre]<br>
            Weapon: [usr.DivineOre]<br>
            Accessory: [usr.Bones]<br>
            </TD>
            </TR>
            </TABLE>
            "},"window=Inventory;file=Items;display=1;clear=1;size=400x480;border=1;can_close=1;can_resize=0;can_minimize=1;titlebar=1")

mob
	proc
		DisplayContents(obj/Items/Equipment/O)
			var/ContReturn=""
			for(var/I in O.SalvageItems)
				ContReturn+="[I]<br>"
			return ContReturn