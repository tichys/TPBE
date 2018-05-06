proc/GetBuyPrices(var/obj/Items/O,var/Amt)
	//var/StackPercnt=O.CurStack
	var/FullCost="[O.CoprValue]";while(length(FullCost)<2)	FullCost="0[FullCost]"
	FullCost="[O.SilvValue][FullCost]";while(length(FullCost)<4)	FullCost="0[FullCost]"
	FullCost="[O.GoldValue][FullCost]";while(length(FullCost)<6)	FullCost="0[FullCost]"
	FullCost=text2num(FullCost)//;FullCost-=FullCost*StackPercnt/100
	if(FullCost<5)	FullCost=0
	var/SaleGold=0;var/SaleSilv=0
	while(FullCost>=10000)	{FullCost-=10000;SaleGold+=1}
	while(FullCost>=100)	{FullCost-=100;SaleSilv+=1}
	SaleGold*=Amt;SaleSilv*=Amt;FullCost=round(FullCost*Amt,1)
	while(FullCost>=100)	{FullCost-=100;SaleSilv+=1}
	while(SaleSilv>=100)	{SaleSilv-=100;SaleGold+=1}
	return list(SaleGold,SaleSilv,FullCost)

proc/GetSalePrices(var/obj/Items/O,var/obj/NPC/Shops/ShopKeep)
	if(!O || !ShopKeep)	return
	/*var/StackPercnt=0;*/var/Amt=O.CurStack
	//for(var/obj/Items/I in ShopKeep.Stock)	if(I.type==O.type)	StackPercnt=I.CurStack
	var/FullCost="[O.CoprValue]";while(length(FullCost)<2)	FullCost="0[FullCost]"
	FullCost="[O.SilvValue][FullCost]";while(length(FullCost)<4)	FullCost="0[FullCost]"
	FullCost="[O.GoldValue][FullCost]";while(length(FullCost)<6)	FullCost="0[FullCost]"
	FullCost=text2num(FullCost);FullCost/=4
	//FullCost-=FullCost*StackPercnt/100
	if(FullCost<1)	FullCost=1
	var/SaleGold=0;var/SaleSilv=0
	while(FullCost>=10000)	{FullCost-=10000;SaleGold+=1}
	while(FullCost>=100)	{FullCost-=100;SaleSilv+=1}
	SaleGold*=Amt;SaleSilv*=Amt;FullCost=round(FullCost*Amt,1)
	while(FullCost>=100)	{FullCost-=100;SaleSilv+=1}
	while(SaleSilv>=100)	{SaleSilv-=100;SaleGold+=1}
	return list(SaleGold,SaleSilv,FullCost)



obj/Items
	mouse_opacity=2
	mouse_over_pointer="MouseHand"
	var/ScreenX;var/ScreenY
	var/InvSlot;layer=20
	var/CurStack=1
	var/MaxStack=9
	var/Unique=0
	var/Epic=0
	var/noauc=0
	var/GoldValue=0
	var/SilvValue=0
	var/CoprValue=0
	var/PlatValue=0
	var/BadgesValue=0
	var/HasUse=1
	New(var/Amt=1)
		src.CurStack=Amt
		if(src.CurStack!=1)	src.UpdateCount()
		return ..()
	proc/Use(var/mob/M)
		QuestShow(M,"[src.name] Used!  No Effect...")
		return "Failed"
	proc/Show()
		var/list/MobList=list()
		for(var/mob/M in world)
			if(M.client)	MobList+=M
			if(M.invisibility==3)	MobList-=M
		var/mob/M=input("Select a Player to Show the Item Stats","Show Item") as null|mob in MobList
		if(M)
			var/TextList="<html><body bgcolor=black><b><font color=gray>"
			var/FM="<td><center><b><font color=white>"
			TextList+="<title>[src.name]</title><center>"
			TextList+="<table border=0 bgcolor=black bordercolor=gray width=100%><br>"
			TextList+="<tr>[FM][src.desc2]"
			M<<browse("[TextList]","window=DetailBrowser")
	proc/Show2()
		var/TextList="<html><body bgcolor=black><b><font color=gray>"
		var/FM="<td><center><b><font color=white>"
		TextList+="<title>[src.name]</title><center>"
		TextList+="<table border=0 bgcolor=black bordercolor=gray width=100%><br>"
		TextList+="<tr>[FM][src.desc2]"
		usr<<browse("[TextList]","window=DetailBrowser")
	proc/Buy(var/mob/M,var/Amt=1)
		Amt=min(25,Amt,src.CurStack)
		var/Itemize=0
		if(Amt<=0)	{QuestShow(M,"Currently Sold Out!");return}
		if(!src.GoldValue && !src.SilvValue && !src.CoprValue &&!src.BadgesValue&&!src.PlatValue)
			QuestShow(M,"They wont sell that Item!");return
		var/list/BuyPrices=GetBuyPrices(src,Amt)
		if(!CheckGold(TrueValue(M),TrueValue(BuyPrices[1],BuyPrices[2],BuyPrices[3])))
			if(M.Platinum>=1)
				M.Gold=4999999
				M.Platinum-=1
			else
				QuestShow(M,"You can't afford that");return//check to see if they can afford what they want
		if(M.bBadges < src.BadgesValue)
			QuestShow(M,"You can't afford that");return
		if(M.Platinum < src.PlatValue)
			QuestShow(M,"You can't afford that");return
		for(var/obj/Items/O in M.Inventory)
			Itemize+=1
			if(!M.Subscriber &&Itemize>25)
				QuestShow(M,"Inventory Full")
				return
			if(M.Subscriber&&Itemize>=45)
				QuestShow(M,"Inventory Full")
				return
		var/obj/Items/NewItem=new src.type(Amt)
		BuyPrices=GetBuyPrices(src,Amt)	//reCalculate on how many they actualy got
		src.CurStack-=Amt;src.UpdateCount()
		M.bBadges -= src.BadgesValue
		M.Platinum-=src.PlatValue
		M.TakeGold(BuyPrices[1],BuyPrices[2],BuyPrices[3])
		if(M.Gold< 0)	M.Gold = 0
		Amt=M.GetItem2(NewItem)

	proc/Sell(var/mob/M)
		if(src.Epic)
			QuestShow(M,"They wont buy that Item!");return
		if(!src.GoldValue && !src.SilvValue && !src.CoprValue &&!src.BadgesValue&&!src.PlatValue)
			QuestShow(M,"They wont buy that Item!");return
		var/list/SalePrices=GetSalePrices(src,M.Selling)
		if(!SalePrices)	return
		M.GiveGold(SalePrices[1],SalePrices[2],SalePrices[3])
		M.Platinum+=src.PlatValue
		M.Selling.StockItem(src)
		del src
	proc/Discard(var/Amt=1)
		src.CurStack-=Amt
		if(src.CurStack<=0)	del src
		else	src.UpdateCount()
	Click(location,control,params)
		if(usr.Chatting)	return
		var/listy[]=params2list(params)
		if(listy["left"])
			if(usr.Shopping)
				var/list/SalePrices=GetBuyPrices(src,1)
				var/SalePriceTag="> Sale Price: "
				if(!src.GoldValue && !src.SilvValue && !src.CoprValue &&!src.BadgesValue&&!src.PlatValue)	SalePriceTag="> No Sale Price"
				else
					if(BadgesValue)	SalePriceTag+="[BadgesValue] Badges"
					if(SalePrices[1])	SalePriceTag+="[SalePrices[1]]ô  "
					if(SalePrices[2])	SalePriceTag+="[SalePrices[2]]ö  "
					if(SalePrices[3])	SalePriceTag+="[SalePrices[3]]ò"
					if(PlatValue)	SalePriceTag+="[PlatValue]Plat"
				if(CustAlert(usr,"[src.name] > > [src.desc] > [SalePriceTag]",list("Buy","Close"),ScreenX,ScreenY-6,ScreenX+5,ScreenY-2)=="Buy")
					if(CustAlert(usr,"Are you certain you want to buy [src.name]?",list("Yes","No"),ScreenX,ScreenY-6,ScreenX+5,ScreenY-2)=="Yes")
						src.Buy(usr,1)
				return
			if(usr.Selling)
				var/list/SalePrices=GetSalePrices(src,usr.Selling)
				if(!SalePrices)	return
				var/SalePriceTag="> Sale Price: "
				if(!src.GoldValue && !src.SilvValue && !src.CoprValue&&!src.PlatValue)	SalePriceTag="> No Sale Price"
				else
					if(SalePrices[1])	SalePriceTag+="[SalePrices[1]]ô  "
					if(SalePrices[2])	SalePriceTag+="[SalePrices[2]]ö  "
					if(SalePrices[3])	SalePriceTag+="[SalePrices[3]]ò"
					if(PlatValue)	SalePriceTag+="[PlatValue]Plat"
				if(CustAlert(usr,"[src.name] > > [src.desc] > [SalePriceTag]",list("Sell","Close"),ScreenX,ScreenY-6,ScreenX+5,ScreenY-2)=="Sell")
					src.Sell(usr)
				return
			var/list/ChoiceList=list("Use","Show","Close")
			if(!src.HasUse)	ChoiceList-="Use"
			if(CustAlert(usr,"[src.name]> > [src.desc]",ChoiceList,ScreenX,ScreenY-6,ScreenX+5,ScreenY-2)=="Use")
				src.Use(usr)
			if(CustAlert(usr,"[src.name]> > [src.desc]",ChoiceList,ScreenX,ScreenY-6,ScreenX+5,ScreenY-2)=="Show")
				src.Show(usr)
		if(listy["right"])
			src.Show2(usr)
	Other
		icon='OtherItems.dmi'
		MaxStack=25
		Hollow_Bait
			GoldValue=0;SilvValue=4;CoprValue=0
			noenchant=1
			noauc=1
			icon_state="Hollow Bait";mouse_drag_pointer="Hollow Bait"
			desc="Taunts all nearby enemies into attacking you"
			desc2="Taunts all nearby enemies into attacking you. 1 use left."
			Use(var/mob/M)
				M.ClearInventory()
				M.Taunt(M.SightRange);src.Discard(1)
		Beastiary
			MaxStack=1
			noenchant=1
			GoldValue=10;SilvValue=0;CoprValue=0
			noauc=1
			icon_state="Beastiary";mouse_drag_pointer="Beastiary"
			desc="Stores data on the enemies you have defeated"
			desc2="Stores data on the enemies you have defeated"
			Use(var/mob/M)
				M.SearchBeastProc()
				winset(M,"BeastiaryWindow","is-visible=true;pos=100,100")
		Recall_Scroll
			GoldValue=0;SilvValue=1;CoprValue=0
			icon_state="Recall Scroll";mouse_drag_pointer="Recall Scroll"
			noauc=1
			noenchant=1
			desc="Can be used at any time to return to your current Respawn Point"
			desc2="Can be used at any time to return to your current Respawn Point"
			Use(var/mob/M)
				if(M.z==8)	{QuestShow(M,"Cannot be Used inside the Arena");return "Failed"}
				M.loc=locate(M.RespawnX,M.RespawnY,M.RespawnZ);src.Discard(1)
		Honor_Scroll
			GoldValue=0;SilvValue=1;CoprValue=1;BadgesValue=6
			icon_state="Recall Scroll";mouse_drag_pointer="Recall Scroll"
			noauc=1
			noenchant=1
			desc="Using this item permanently increases honor per kill by 0.2. Works from level 1 too!"
			desc2="Using this item permanently increases honor per kill by 0.2. Works from level 1 too!"
			Use(var/mob/M)
				if(M.HonorBonus>=100)
					M<<"You can not raise your honor bonus beyond 100"
					return
				else
					M.HonorBonus+=0.2
					src.Discard(1)
					M.Save()
					text2file("[time2text(world.realtime)]:[M] bought an honor scroll<br>","honorscroll.html")
		Advanced_Honor_Scroll
			GoldValue=1;SilvValue=1;CoprValue=1;BadgesValue=30
			icon_state="Recall Scroll";mouse_drag_pointer="Recall Scroll"
			noauc=1
			noenchant=1
			desc="Using this item permanently increases honor per kill by 1. Works from level 1 too!"
			desc2="Using this item permanently increases honor per kill by 1. Works from level 1 too!"
			Use(var/mob/M)
				if(M.HonorBonus>=100)
					M<<"You can not raise your honor bonus beyond 100"
					return
				else
					M.HonorBonus+=1
					src.Discard(1)
					M.Save()
					text2file("[time2text(world.realtime)]:[M] bought an advanced honor scroll<br>","honorscroll.html")
		Race_Changer
			GoldValue=1;SilvValue=1;CoprValue=1;BadgesValue=100
			icon_state="OtherCupon";mouse_drag_pointer="OtherCupon"
			noauc=1
			noenchant=1
			desc="Using this item permanently changes your race. The item is not lost on use!"
			desc2="Using this item permanently changes your race. The item is not lost on use!"
			Use(var/mob/M)
				M.Race_Change2()
				text2file("[time2text(world.realtime)]:[M] bought an advanced honor scroll<br>","honorscroll.html")
		Super_Stat_Pack
			GoldValue=1;SilvValue=1;CoprValue=1;BadgesValue=18
			icon_state="CuponBase";mouse_drag_pointer="CuponBase"
			desc="Using this item permanently permanently grants between 1000 stat points and a chance for some trait points!"
			desc2="Using this item permanently permanently grants between 1000 stat points and a chance for some trait points!!"
			noenchant=1
			Use(var/mob/M)
				M.StatPoints+=1000
				M.boughtstats+=1000
				src.Discard(1)
				M.Save()
				M<<"You have received 1000 stat points and 0 trait points!"
				text2file("[time2text(world.realtime)]:[M] bought 1000 stats<br>","honorscroll.html")
		Major_Stat_Pack
			GoldValue=1;SilvValue=1;CoprValue=1;BadgesValue=9
			icon_state="CuponBase";mouse_drag_pointer="CuponBase"
			desc="Using this item permanently permanently grants between 450 stat points"
			desc2="Using this item permanently permanently grants between 450 stat points!"
			noenchant=1
			Use(var/mob/M)
				M.StatPoints+=450
				M.boughtstats+=450
				src.Discard(1)
				M.Save()
				M<<"You have received 450 stat points!"
				text2file("[time2text(world.realtime)]:[M] bought 450 stats<br>","honorscroll.html")
		Mini_Stat_Pack
			GoldValue=1;SilvValue=1;CoprValue=1;BadgesValue=5
			icon_state="CuponBase";mouse_drag_pointer="CuponBase"
			desc="Using this item permanently permanently grants between 250 stat points"
			desc2="Using this item permanently permanently grants between 250 stat points!"
			noenchant=1
			Use(var/mob/M)
				M.StatPoints+=220
				M.boughtstats+=220
				M<<"You have received 220 stat points!"
				src.Discard(1)
				M.Save()
				text2file("[time2text(world.realtime)]:[M] bought 250 stats<br>","honorscroll.html")

		Honor_Prize_Ticket
			GoldValue=1;SilvValue=1;CoprValue=1
			icon_state="Recall Scroll";mouse_drag_pointer="Recall Scroll"
			noenchant=1
			noauc=1
			desc="Using this item will reward you a random gift which may be rare weapons, Badges, honor scrolls, gold or more.."
			desc2="Using this item will reward you a random gift which may be rare weapons, Badges, honor scrolls, gold or more.."
			Use(var/mob/M)
				M.Credited+=1
				var/R = rand(1,100)
				if(R==34)
					M.bank.DepositItem2(new /obj/Items/Equipment/Hand/Weapons/The_Devourer_Of_Souls)
					world<<"<b><font color=red size=3>Honor Prize : <font color=yellow>[M] <font color=white> has received the legendary sword, Devourer of Souls! </font>"
					M<<"<b>The rare item has been stored in your Bank"
					text2file("[time2text(world.realtime)]:[M] honor prize received Devourer<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==2)
					M.bank.DepositItem2(new /obj/Items/Other/Honor_Scroll)
					world<<"<b><font color=red size=3>Honor Prize : <font color=yellow>[M] <font color=white> has received an Honor Scroll! </font>"
					M<<"<b>The rare item has been stored in your Bank"
					text2file("[time2text(world.realtime)]:[M] honor prize received Honor Scroll<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==3)
					M.bank.DepositItem2(new /obj/Items/Other/Advanced_Honor_Scroll)
					world<<"<b><font color=red size=3>Honor Prize : <font color=yellow>[M] <font color=white> has received an Advanced Honor Scroll! </font>"
					M<<"<b>The rare item has been stored in your Bank"
					text2file("[time2text(world.realtime)]:[M] honor prize received Advanced Honor Scroll<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				/*if(R==4)
					M.bank.DepositItem2(new /obj/Items/Equipment/Hand/Weapons/Wrath_of_The_Hollow_King)
					world<<"<b><font color=red size=3>Honor Prize : <font color=yellow>[M] <font color=white> has received a Wrath_of_The_Hollow_King! </font>"
					M<<"<b>The rare item has been stored in your Bank"
					text2file("[time2text(world.realtime)]:[M] honor prize received Wrath_of_The_Hollow King<br>","gmlog.html")
					src.Discard(1)*/
				if(R==4)
					M.bank.DepositItem2(new /obj/Items/Other/Equipment_Upgrade)
					world<<"<b><font color=red size=3>Honor Prize : <font color=yellow>[M] <font color=white> has received an Equipment Upgrade scroll! </font>"
					M<<"<b>The rare item has been stored in your Bank"
					text2file("[time2text(world.realtime)]:[M] honor prize received Equipment_Upgrade<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==5)
					M.Badges +=1
					world<<"<b><font color=red size=3>Honor Prize : <font color=yellow>[M] <font color=white> has received 1 Badge! </font>"
					M<<"<bYou are now 1 Badges richer."
					text2file("[time2text(world.realtime)]:[M] honor prize received 1 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==6)
					M.bank.DepositItem2(new /obj/Items/Other/Honor_Scroll)
					world<<"<b><font color=red size=3>Honor Prize : <font color=yellow>[M] <font color=white> has received an Honor Scroll! </font>"
					M<<"<b>The rare item has been stored in your Bank"
					text2file("[time2text(world.realtime)]:[M] honor prize received Honor Scroll<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R >=7)
					var/X=rand(100000,250000)
					M.Gold+=X
					world<<"<b><font color=red size=3>Honor Prize : <font color=yellow>[M] <font color=white> has received [X] gold! </font>"
					M<<"<b>You are now [X] of gold richer."
					text2file("[time2text(world.realtime)]:[M] honor prize received Honor Scroll<br>","gmlog.html")
					src.Discard(1)
					M.Save()
		Reward_scroll
			GoldValue=1;SilvValue=1;CoprValue=1
			icon_state="Recall Scroll";mouse_drag_pointer="Recall Scroll"
			noenchant=1
			noauc=1
			desc="Using this item will reward you a random gift.."
			desc2="Using this item will reward you a random gift.."
			Use(var/mob/M)
				var/R = rand(1,5)
				if(R ==1)
					M.Gold+=50000
					M<<"<b>You are now 50k gold richer."
					text2file("[time2text(world.realtime)]:[M] ultima prize received 50k<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R ==2)
					M.Gold+=100000
					M<<"<b>You are now 100k gold richer."
					text2file("[time2text(world.realtime)]:[M] ultima prize received 100k<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R ==3)
					M.Honor+=20000
					M<<"<b>You have received 20k Honor."
					text2file("[time2text(world.realtime)]:[M] ultima prize received 20k Honor<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R ==4)
					M.Honor+=50000
					M<<"<b>You have received 50k Honor."
					text2file("[time2text(world.realtime)]:[M] ultima prize received 50k Honor<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R ==5)
					M.Badges+=1
					M<<"<b>You have received 1 Honour Badge."
					text2file("[time2text(world.realtime)]:[M] ultima prize received 1 Badge<br>","gmlog.html")
					src.Discard(1)
					M.Save()
		Minor_Exp_Orb
			GoldValue=1;SilvValue=1;CoprValue=1;BadgesValue=1
			icon_state="exporb";mouse_drag_pointer="exporb"
			noenchant=1
			noauc=1
			Unique=1
			desc="This item will boost you experience gain by 15%. You can only have one Experience boost active."
			desc2="This item will boost you experience gain by 15%. You can only have one Experience boost active."
			Use(var/mob/M)
				M.Expboost=1.15
				M.got20=1
				M<<"font color=red>You will now benefit from 15% additional experience!"
				text2file("[time2text(world.realtime)]:[M] boosted himself by 15%","honorscroll.html")
				src.Discard(1)
				M.Save()
		Medium_Exp_Orb
			GoldValue=1;SilvValue=1;CoprValue=1;BadgesValue=3
			icon_state="exporb";mouse_drag_pointer="exporb"
			noenchant=1
			noauc=1
			Unique=1
			desc="This item will boost you experience gain by 30%. You can only have one Experience boost active"
			desc2="This item will boost you experience gain by 30%. You can only have one Experience boost active."
			Use(var/mob/M)
				M.Expboost=1.3
				M.got40=1
				M<<"font color=red>You will now benefit from 30% additional experience!"
				text2file("[time2text(world.realtime)]:[M] boosted himself by 30%","honorscroll.html")
				src.Discard(1)
				M.Save()
		Large_Exp_Orb
			GoldValue=1;SilvValue=1;CoprValue=1;BadgesValue=6
			icon_state="exporb";mouse_drag_pointer="exporb"
			noenchant=1
			noauc=1
			Unique=1
			desc="This item will boost you experience gain by 45%. You can only have one Experience boost active"
			desc2="This item will boost you experience gain by 45%. You can only have one Experience boost active."
			Use(var/mob/M)
				M.Expboost=1.45
				M.got60=1
				M<<"font color=red>You will now benefit from 45% additional experience!"
				text2file("[time2text(world.realtime)]:[M] boosted himself by 45%","honorscroll.html")
				src.Discard(1)
				M.Save()
		Super_Exp_Orb
			GoldValue=1;SilvValue=1;CoprValue=1;BadgesValue=10
			icon_state="exporb";mouse_drag_pointer="exporb"
			noenchant=1
			noauc=1
			Unique=1
			desc="This item will boost you experience gain by 60%. You can only have one Experience boost active"
			desc2="This item will boost you experience gain by 60%. You can only have one Experience boost active."
			Use(var/mob/M)
				M.Expboost=1.6
				M.got80=1
				M<<"font color=red>You will now benefit from 60% additional experience!"
				text2file("[time2text(world.realtime)]:[M] boosted himself by 60%","honorscroll.html")
				src.Discard(1)
				M.Save()
		Supreme_Exp_Orb
			GoldValue=1;SilvValue=1;CoprValue=1;BadgesValue=50
			icon_state="exporb";mouse_drag_pointer="exporb"
			noenchant=1
			noauc=1
			Unique=1
			desc="This item will boost you experience gain by 100%. This boost can be stacked with other Supreme Exp orbs."
			desc2="This item will boost you experience gain by 100%. This boost can be stacked with other Supreme Exp orbs."
			Use(var/mob/M)
				M.Expboost+=1
				M.got100+=1
				M<<"font color=red>You will now benefit from 100% additional experience and 20% world drop increase!"
				text2file("[time2text(world.realtime)]:[M] boosted himself by 100%","honorscroll.html")
				src.Discard(1)
				M.Save()
		Custom_Root
			GoldValue=1;SilvValue=1;CoprValue=1;BadgesValue=100
			icon_state="Stemie";mouse_drag_pointer="Stemie"
			noenchant=1
			noauc=1
			Unique=1
			nobank=1
			noenchant=1
			desc="This item can be used once a day to reward the owner with a random 9 to 12 badges forever.(Can be made into a House ornament granting visitors 1 badge a day)"
			desc2="This item can be used once a day to reward the owner with a random 9 to 12 badges forever.(Can be made into a House ornament granting visitors 1 badge a day)"
			Use(var/mob/M)
				src.checkcdexp()
				if(src.actionlock==1)
					M << "<font color=white>Item is still on cooldown. (Expires in 24 hours)"
					return
				else
					var/E=rand(M.min,M.max)
					M.Badges+=E
					M<<"<font color=red>You have received [E] Badges as a gift from the Super Root"
					text2file("[time2text(world.realtime)]:[M] [E] badges sapling","honorscroll.html")
					src.actionlock=1
					src.timestarted=text2num(time2text(world.realtime,"hh"))+24
					src.timestarted=text2num(time2text(world.realtime,"hh"))+59
					if(src.timestarted>23)
						src.timestarted=23
						src.timestarted2=59
					if(src.timestarted2>59)
						src.timestarted2=59
					src.objexpiretext=time2text(world.realtime,"[src.timestarted]:[src.timestarted2], MMM, DD YYYY")
					src.objexpires=time2text(world.realtime,"YYYYMMDD[src.timestarted][src.timestarted2]")
					M.Save()
					return
		Super_Root
			GoldValue=1;SilvValue=1;CoprValue=1;BadgesValue=100
			icon_state="Stemie";mouse_drag_pointer="Stemie"
			noenchant=1
			noauc=1
			Unique=1
			nobank=1
			noenchant=1
			desc="This item can be used once a day to reward the owner with a random 9 to 12 badges forever.(Can be made into a House ornament granting visitors 1 badge a day)"
			desc2="This item can be used once a day to reward the owner with a random 9 to 12 badges forever.(Can be made into a House ornament granting visitors 1 badge a day)"
			Use(var/mob/M)
				src.checkcdexp()
				if(src.actionlock==1)
					M << "<font color=white>Item is still on cooldown. (Expires in 24 hours)"
					return
				else
					var/E=rand(9,12)
					M.Badges+=E
					M<<"<font color=red>You have received [E] Badges as a gift from the Super Root"
					text2file("[time2text(world.realtime)]:[M] [E] badges sapling","honorscroll.html")
					src.actionlock=1
					src.timestarted=text2num(time2text(world.realtime,"hh"))+24
					src.timestarted=text2num(time2text(world.realtime,"hh"))+59
					if(src.timestarted>23)
						src.timestarted=23
						src.timestarted2=59
					if(src.timestarted2>59)
						src.timestarted2=59
					src.objexpiretext=time2text(world.realtime,"[src.timestarted]:[src.timestarted2], MMM, DD YYYY")
					src.objexpires=time2text(world.realtime,"YYYYMMDD[src.timestarted][src.timestarted2]")
					M.Save()
					return
		Sapling_Of_Wealth
			GoldValue=1;SilvValue=1;CoprValue=1;BadgesValue=100
			icon_state="Stemie";mouse_drag_pointer="Stemie"
			noenchant=1
			noauc=1
			Unique=1
			nobank=1
			desc="This item can be used once a day to reward the owner with a random 1 to 3 badges forever.(Can be made into a House ornament granting visitors 1 badge a day)"
			desc2="This item can be used once a day to reward the owner with a random 1 to 3 badges forever.(Can be made into a House ornament granting visitors 1 badge a day)"
			Use(var/mob/M)
				src.checkcdexp()
				if(src.actionlock==1)
					M << "<font color=white>Item is still on cooldown. (Expires in 24 hours)"
					return
				else
					var/E=rand(1,3)
					M.Badges+=E
					M<<"<font color=red>You have received [E] Badges as a gift from the Sapling of Wealth"
					text2file("[time2text(world.realtime)]:[M] [E] badges sapling","honorscroll.html")
					src.actionlock=1
					src.timestarted=text2num(time2text(world.realtime,"hh"))+24
					src.timestarted=text2num(time2text(world.realtime,"hh"))+59
					if(src.timestarted>23)
						src.timestarted=23
						src.timestarted2=59
					if(src.timestarted2>59)
						src.timestarted2=59
					src.objexpiretext=time2text(world.realtime,"[src.timestarted]:[src.timestarted2], MMM, DD YYYY")
					src.objexpires=time2text(world.realtime,"YYYYMMDD[src.timestarted][src.timestarted2]")
					M.Save()
					return
		Root_Of_Wealth
			GoldValue=1;SilvValue=1;CoprValue=1;BadgesValue=200
			icon_state="Stemie";mouse_drag_pointer="Stemie"
			noenchant=1
			noauc=1
			Unique=1
			nobank=1
			desc="This item can be used once a day to reward the owner with a random 3 badges forever.(Can be made into a House ornament granting visitors 1 badge a day)"
			desc2="This item can be used once a day to reward the owner with a random 3 badges forever.(Can be made into a House ornament granting visitors 1 badge a day)"
			Use(var/mob/M)
				src.checkcdexp()
				if(src.actionlock==1)
					M << "<font color=white>Item is still on cooldown. (Expires in 24 hours)"
					return
				else
					M.Badges+=3
					M<<"<font color=red>You have received 3 Badges as a gift from the Root of Wealth"
					text2file("[time2text(world.realtime)]:[M] 3 badges Root","honorscroll.html")
					src.actionlock=1
					src.timestarted=text2num(time2text(world.realtime,"hh"))+24
					src.timestarted=text2num(time2text(world.realtime,"hh"))+59
					if(src.timestarted>23)
						src.timestarted=23
						src.timestarted2=59
					if(src.timestarted2>59)
						src.timestarted2=59
					src.objexpiretext=time2text(world.realtime,"[src.timestarted]:[src.timestarted2], MMM, DD YYYY")
					src.objexpires=time2text(world.realtime,"YYYYMMDD[src.timestarted][src.timestarted2]")
					M.Save()
					return
		New_Year_Box
			GoldValue=1;SilvValue=1;CoprValue=1
			icon_state="gift";mouse_drag_pointer="gift"
			noenchant=1
			noauc=1
			Unique=1
			desc="Special New Year's Donate only package!"
			Use(var/mob/M)
				var/R=rand(1,12)
				if(R==1)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won the The Midnight COMPLETE set! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received Midnight full<br>","gmlog.html")
				if(R==2)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won VIP 6! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received VIP 6<br>","gmlog.html")
				if(R==3)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won VIP 5! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received VIP 5<br>","gmlog.html")
				if(R==4)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won 2000 badges! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received 2000 badges<br>","gmlog.html")
				if(R==5)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won 5000 badges! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received 5000 badges<br>","gmlog.html")
				if(R==6)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has 5000 of each commodity! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received 5000 ea comm<br>","gmlog.html")
				if(R==7)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won 100m gold </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received 100m gold<br>","gmlog.html")
				if(R==8)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won the Ark </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received Ark<br>","gmlog.html")
				if(R==9)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won Twilight Armor set! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received Twilight set<br>","gmlog.html")
				if(R==10)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won +20 refinement to Armor set and Weapon! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received +20 refine<br>","gmlog.html")
				if(R==11)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won 5000 bonus stats! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received 5000 stats<br>","gmlog.html")
				if(R==12)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won The Illusionist! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received Illusionist<br>","gmlog.html")
				var/N = rand(1,12)
				if(N ==1)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won the The Midnight COMPLETE set! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received Midnight full<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(N ==2)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won VIP 6! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received VIP 6<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(N ==3)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won VIP 5! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received VIP 5<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(N ==4)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won 2000 badges! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received 2000 badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(N ==5)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won 5000 badges! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received 5000 badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(N ==6)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has 5000 of each commodity! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received 5000 ea comm<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(N ==7)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won 100m gold </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received 100m gold<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(N ==8)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won the Ark </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received Ark<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(N ==9)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won Twilight Armor set! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received Twilight set<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(N ==10)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won +20 refinement to Armor set and Weapon! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received +20 refine<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(N ==11)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won 5000 bonus stats! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received 5000 stats<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(N ==12)
					world<<"<b><font color=red size=3>New Year Prize : <font color=yellow>[M] <font color=white> has won The Illusionist! </font>"
					text2file("[time2text(world.realtime)]:[M] New Year Prize received Illusionist<br>","gmlog.html")
					src.Discard(1)
					M.Save()
		Gift_Box
			GoldValue=1;SilvValue=1;CoprValue=1
			icon_state="gift";mouse_drag_pointer="gift"
			noenchant=1
			noauc=1
			Unique=1
			desc="A special gift box with a random reward inside!"
			Use(var/mob/M)
				var/R = rand(1,100)
				if(R==34)
					M.bank.DepositItem2(new /obj/Items/Equipment/Hand/Weapons/The_Devourer_Of_Souls)
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received the legendary sword, Devourer of Souls! </font>"
					M<<"<b>The rare item has been stored in your Bank.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received Devourer<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==2)
					M.bank.DepositItem2(new /obj/Items/Other/Honor_Scroll)
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received an Honor Scroll! </font>"
					M<<"<b>The rare item has been stored in your Bank.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received Honor Scroll<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==3)
					M.bank.DepositItem2(new /obj/Items/Other/Advanced_Honor_Scroll)
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received an Advanced Honor Scroll! </font>"
					M<<"<b>The rare item has been stored in your Bank.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received Advanced Honor Scroll<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==59)
					M.bank.DepositItem2(new /obj/Items/Equipment/Hand/Weapons/Wrath_of_The_Hollow_King)
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received a Wrath_of_The_Hollow_King! </font>"
					M<<"<b>The rare item has been stored in your Bank.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received Wrath_of_The_Hollow King<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==5)
					M.bank.DepositItem2(new /obj/Items/Other/Equipment_Upgrade)
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received an Equipment Upgrade scroll! </font>"
					M<<"<b>The rare item has been stored in your Bank. Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received Equipment_Upgrade<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==6)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<bYou are now 2 Badges richer!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==4)
					M.Badges +=3
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 3 Badges! </font>"
					M<<"<bYou are now 3 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 3 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==7)
					M.Badges +=1
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 1 Badges! </font>"
					M<<"<b>You are now 1 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 1 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==8)
					M.Badges +=5
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 5 Badges! </font>"
					M<<"<b>You are now 5 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 5 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==9)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==10)
					M.HonorBonus+=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received an extra 2 honor points per kill! </font>"
					M<<"<b>You will now gain an extra 2 honor per kill.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 honor per kill<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==11)
					M.Gold+=500000
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 500000 gold! </font>"
					M<<"<b>You are now 500000 gold richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 500000 gold<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==12)
					M.Gold+=250000
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 250000 gold! </font>"
					M<<"<b>You are now 250000 gold richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 250000 gold<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==13)
					M.Badges+=5
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 5 Badges! </font>"
					M<<"<b>You are now 5 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 5 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==14)
					M.Badges+=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 3 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==15)
					M.Badges+=3
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 3 Badges! </font>"
					M<<"<b>You are now 3 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 3 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==16)
					M.Badges+=3
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 3 Badges! </font>"
					M<<"<b>You are now 3 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 3 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==17)
					M.Badges+=3
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 3 Badges! </font>"
					M<<"<b>You are now 3 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 3 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==21)
					M.Badges +=4
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 4 Badges! </font>"
					M<<"<bYou are now 4 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 4 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==18)
					M.Badges +=6
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 6 Badges! </font>"
					M<<"<b>You are now 6 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 6 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==19)
					M.Badges +=7
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 7 Badges! </font>"
					M<<"<b>You are now 7 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 7 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==20)
					M.Badges +=8
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 8 Badges! </font>"
					M<<"<b>You are now 8 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 8 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==22)
					M.bank.DepositItem2(new /obj/Items/Other/Comm_Pack_Ticket)
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received a Commodity Pack! </font>"
					M<<"<b>The ticket has been stored in your Bank.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received commpack<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==23)
					M.Gold+=400000
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 400000 gold! </font>"
					M<<"<b>You are now 400000 gold richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 250000 gold<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==24)
					M.Badges +=5
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 5 Badges! </font>"
					M<<"<bYou are now 5 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 5 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==25)
					M.Badges +=5
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 5 Badges! </font>"
					M<<"<bYou are now 5 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 5 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==26)
					M.Badges +=4
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 4 Badges! </font>"
					M<<"<b>You are now 4 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 4 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==27)
					M.Badges +=4
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 4 Badges! </font>"
					M<<"<b>You are now 4 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 4 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==28)
					M.Badges +=4
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 4 Badges! </font>"
					M<<"<b>You are now 4 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 4 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==29)
					M.Badges +=4
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 4 Badges! </font>"
					M<<"<b>You are now 4 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 4 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==30)
					M.Badges +=4
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 4 Badges! </font>"
					M<<"<b>You are now 4 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 4 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==31)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==32)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==33)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==1)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==35)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==36)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==37)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==38)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==39)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==40)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==41)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==42)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==43)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==44)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==45)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==46)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==47)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==48)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==49)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==50)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 50 Badges richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==51)
					M.Gold +=300000
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 300000 gold! </font>"
					M<<"<b>You are now 300k richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 300000 gold<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==52)
					M.Gold +=300000
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 300000 gold! </font>"
					M<<"<b>You are now 300k richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 300g<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==53)
					M.Gold +=300000
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 300000 gold! </font>"
					M<<"<b>You are now 300k richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 300g<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==54)
					M.Gold +=300000
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 300000 gold! </font>"
					M<<"<b>You are now 300k richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 300g<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==55)
					M.Gold +=300000
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 300000 gold! </font>"
					M<<"<b>You are now 300k richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 300g<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==56)
					M.Gold +=300000
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 300000 gold! </font>"
					M<<"<b>You are now 300k richer.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 300g<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==57)
					M.bank.DepositItem2(new /obj/Items/Equipment/Body/Armor/ExoSkeleton)
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received an ExoSkeleton! </font>"
					M<<"<b>The rare item has been stored in your Bank.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received an ExoSkeleton<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==58)
					M.bank.DepositItem2(new /obj/Items/Equipment/Head/Festive_Helmet)
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received a Festive Helmet! </font>"
					M<<"<b>The rare item has been stored in your Bank.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received Festive Helmet<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==60)
					M.bank.DepositItem2(new /obj/Items/Other/Comm_Pack_Ticket)
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received a Commodity Pack! </font>"
					M<<"<b>The ticket has been stored in your Bank.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received commpack<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==61)
					M.bank.DepositItem2(new /obj/Items/Other/Super_Exp_Orb)
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received a Super Exp Orb! </font>"
					M<<"<b>The rare item has been stored in your Bank."
					text2file("[time2text(world.realtime)]:[M] Enigma received super exp orb set<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==62)
					M.bank.DepositItem2(new /obj/Items/Other/Refine_Protection)
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received a Refine Protection scroll! </font>"
					M<<"<b>The scroll has been stored in your Bank.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received refine p<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==63)
					M.bank.DepositItem2(new /obj/Items/Other/Refine_Protection)
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received a Refine Protection scroll! </font>"
					M<<"<b>The scroll has been stored in your Bank.Happy Holidays!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received refine p<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R>=64)
					M.Badges +=2
					world<<"<b><font color=red size=3>Holiday Prize : <font color=yellow>[M] <font color=white> has received 2 Badges! </font>"
					M<<"<b>You are now 2 Badges richer. Happy Easter"
					text2file("[time2text(world.realtime)]:[M] honor prize received 2 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()

		The_Cloner
			GoldValue=1;SilvValue=1;CoprValue=1
			icon_state="Cloner";mouse_drag_pointer="Cloner"
			noenchant=1
			Unique=1
			Use(var/mob/M)
				var/obj/O = input("Which item would you like to clone ((Source Item original Refine level will be lost!))?") as obj in M.Inventory
				switch(ShowAlert(M,"Transfer [O]'s refine level??",list("Yes","No")))
					if("No")
						return
					if("Yes")
						if(O)
							if(O.enc<=0 || !O.enc || O.noenchant)
								QuestShow(M,"The chosen item has no refinement level to clone!.")
								return
							else
								var/obj/F = input("Which item would you like to refine to [O.enc] ((Source Item original Refine level will be lost!))?") as obj in M.Inventory
								switch(ShowAlert(M,"Are you sure you want to remove [O]'s refine level and transfer it to [F]?",list("Yes","No")))
									if("No")
										return
									if("Yes")
										if(F)
											if(F.enc==20 || F.noenchant)
												QuestShow(M,"The chosen item is already at max refinement level or can not be enchanted!.")
												return
											else
												F.enc=O.enc
												O.enc=0
												F.name="[F.oname] ([F.enc])"
												O.name=O.oname
												QuestShow(M,"[F.oname] is now [F.name]!.")
												text2file("[time2text(world.realtime)]:[M] disenchanted [O] into [F]<br>","gmlog.html")
												return



		Enigmatic_Gift_Box
			GoldValue=1;SilvValue=1;CoprValue=1
			icon_state="gift";mouse_drag_pointer="gift"
			noenchant=1
			noauc=1
			Unique=1
			noenchant=1
			desc="A special gift box with a random reward inside!"
			Use(var/mob/M)
				var/R = rand(1,6)
				if(R==1)
					M.bank.DepositItem2(new /obj/Items/Other/Advanced_Honor_Scroll)
					M.bank.DepositItem2(new /obj/Items/Other/Advanced_Honor_Scroll)
					world<<"<b><font color=red size=3>Special Gift : <font color=yellow>[M] <font color=white> has received two Advanced Honor Scrolls! </font>"
					M<<"<b>The rare items have been stored in your Bank!"
					text2file("[time2text(world.realtime)]:[M] Holiday Prize received 2x Advanced Honor Scroll<br>","gmlog.html")
					src.Discard(1)
				if(R==2)
					M.bank.DepositItem2(new /obj/Items/Other/Equipment_Upgrade)
					M.bank.DepositItem2(new /obj/Items/Other/Equipment_Upgrade)
					M.bank.DepositItem2(new /obj/Items/Other/Equipment_Upgrade)
					world<<"<b><font color=red size=3>Special Gift : <font color=yellow>[M] <font color=white> has received three Equipment Upgrade scrolls! </font>"
					M<<"<b>The rare item has been stored in your Bank."
					text2file("[time2text(world.realtime)]:[M] Enigma Prize received 3 x Equipment_Upgrade<br>","gmlog.html")
					src.Discard(1)
				if(R==3)
					M.Badges +=50
					world<<"<b><font color=red size=3>Special Gift : <font color=yellow>[M] <font color=white> has received 50 Badges! </font>"
					M<<"<bYou are now 2 Badges richer."
					text2file("[time2text(world.realtime)]:[M] Enigma Prize received 50 Badges<br>","gmlog.html")
					src.Discard(1)
				if(R==4)
					M.Badges +=30
					world<<"<b><font color=red size=3>Special Gift : <font color=yellow>[M] <font color=white> has received 30 Badges! </font>"
					M<<"<bYou are now 30 Badges richer."
					text2file("[time2text(world.realtime)]:[M] Enigma Prize received 30 Badges<br>","gmlog.html")
					src.Discard(1)
				if(R==5)
					world<<"<b><font color=red size=3>Special Gift : <font color=yellow>[M] <font color=white> has received one piece of the Midnight Set! </font>"
					M<<"<b>You can claim one piece from Kabuto!"
					text2file("[time2text(world.realtime)]:[M] Enigma received midnight set<br>","gmlog.html")
					src.Discard(1)
				if(R==6)
					M.bank.DepositItem2(new /obj/Items/Other/Super_Exp_Orb)
					world<<"<b><font color=red size=3>Special Gift : <font color=yellow>[M] <font color=white> has received a Super Exp Orb! </font>"
					M<<"<b>The rare item has been stored in your Bank."
					text2file("[time2text(world.realtime)]:[M] Enigma received super exp orb set<br>","gmlog.html")
					src.Discard(1)


	/*	Special_Gift_Box
			GoldValue=1;SilvValue=1;CoprValue=1
			icon_state="RareGift";mouse_drag_pointer="RareGift"
			noauc=1
			Unique=1
			desc="This is a special christmas gift from Father Kabuto!"
			desc2="This is a special christmas gift from Father Kabuto!"
			Use(var/mob/M)
				var/R = rand(1,20)
				if(R==1)
					M.bank.DepositItem2(new /obj/Items/Equipment/Hand/Weapons/Martyr_of_The_Wretched_God)
					world<<"<b><font color=red size=3>Rare Xmas Gift : <font color=yellow>[M] <font color=white> has received the legendary sword, Martyr of The Wretched God! </font>"
					M<<"<b>The rare item has been stored in your Bank.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received Wretched<br>","gmlog.html")
					src.Discard(1)
				if(R==2)
					M.bank.DepositItem2(new /obj/Items/Other/Advanced_Honor_Scroll)
					M.bank.DepositItem2(new /obj/Items/Other/Advanced_Honor_Scroll)
					world<<"<b><font color=red size=3>Rare Xmas Gift : <font color=yellow>[M] <font color=white> has received two Advanced Honor Scrolls! </font>"
					M<<"<b>The rare item has been stored in your Bank.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received 2xAdvanced Honor Scroll<br>","gmlog.html")
					src.Discard(1)
				if(R==3)
					M.bank.DepositItem2(new /obj/Items/Equipment/Body/Armor/ExoSkeleton)
					world<<"<b><font color=red size=3>Rare Xmas Gift  : <font color=yellow>[M] <font color=white> has received an ExoSkeleton! </font>"
					M<<"<b>The rare item has been stored in your Bank.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received an ExoSkeleton<br>","gmlog.html")
					src.Discard(1)
				if(R==4)
					M.bank.DepositItem2(new /obj/Items/Equipment/Head/Festive_Helmet)
					world<<"<b><font color=red size=3>Rare Xmas Gift : <font color=yellow>[M] <font color=white> has received a Festive Helmet! </font>"
					M<<"<b>The rare item has been stored in your Bank.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received Festive Helmet<br>","gmlog.html")
					src.Discard(1)
				if(R==5)
					M.Badges +=3500
					world<<"<b><font color=red size=3>Rare Xmas Gift : <font color=yellow>[M] <font color=white> has received 3500 Badges! </font>"
					M<<"<b>You are now 3500 Badges richer.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received 500 Badges<br>","gmlog.html")
					src.Discard(1)
				if(R==6)
					M.Badges +=2600
					world<<"<b><font color=red size=3>Rare Xmas Gift : <font color=yellow>[M] <font color=white> has received 2600 Badges! </font>"
					M<<"<b>You are now 2600 Badges richer.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received 2600 Badges<br>","gmlog.html")
					src.Discard(1)
				if(R==7)
					M.Badges +=2700
					world<<"<b><font color=red size=3>Rare Xmas Gift : <font color=yellow>[M] <font color=white> has received 2700 Badges! </font>"
					M<<"<b>You are now 700 Badges richer.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received 2700 Badges<br>","gmlog.html")
					src.Discard(1)
				if(R==8)
					M.Badges +=2800
					world<<"<b><font color=red size=3>Rare Xmas Gift : <font color=yellow>[M] <font color=white> has received 2800 Badges! </font>"
					M<<"<b>You are now 800 Badges richer.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received 2800 Badges<br>","gmlog.html")
					src.Discard(1)
				if(R==9)
					M.Badges +=2900
					world<<"<b><font color=red size=3>Rare Xmas Gift : <font color=yellow>[M] <font color=white> has received 2900 Badges! </font>"
					M<<"<b>You are now 2900 Badges richer.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received 900 Badges<br>","gmlog.html")
					src.Discard(1)
				if(R==10)
					M.Badges +=3000
					world<<"<b><font color=red size=3>Rare Xmas Gift : <font color=yellow>[M] <font color=white> has received 3000 Badges! </font>"
					M<<"<b>You are now 3000 Badges richer.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received 1000 Badges<br>","gmlog.html")
					src.Discard(1)
				if(R==11)
					M.Badges +=2100
					world<<"<b><font color=red size=3>Rare Xmas Gift : <font color=yellow>[M] <font color=white> has received 2100 Badges! </font>"
					M<<"<b>You are now 2100 Badges richer.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received 2100 Badges<br>","gmlog.html")
					src.Discard(1)
				if(R==12)
					M.Badges +=2200
					world<<"<b><font color=red size=3>Rare Xmas Gift : <font color=yellow>[M] <font color=white> has received 2200 Badges! </font>"
					M<<"<b>You are now 2200 Badges richer.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received 2200 Badges<br>","gmlog.html")
					src.Discard(1)
				if(R==13)
					M.Badges +=2300
					world<<"<b><font color=red size=3>Rare Xmas Gift : <font color=yellow>[M] <font color=white> has received 2300 Badges! </font>"
					M<<"<b>You are now 2300 Badges richer.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received 2300 Badges<br>","gmlog.html")
					src.Discard(1)
				if(R==14)
					M.Badges +=2400
					world<<"<b><font color=red size=3>Rare Xmas Gift : <font color=yellow>[M] <font color=white> has received 2400 Badges! </font>"
					M<<"<b>You are now 2400 Badges richer.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received 2400 Badges<br>","gmlog.html")
					src.Discard(1)
				if(R==15)
					M.Badges +=2500
					world<<"<b><font color=red size=3>Rare Xmas Gift : <font color=yellow>[M] <font color=white> has received 2500 Badges! </font>"
					M<<"<b>You are now 2500 Badges richer.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received 2500 Badges<br>","gmlog.html")
					src.Discard(1)
				if(R==16)
					M.bank.DepositItem2(new /obj/Items/Equipment/Hand/Weapons/Martyr_of_The_Wretched_God)
					world<<"<b><font color=red size=3>Rare Xmas Gift : <font color=yellow>[M] <font color=white> has received the legendary sword, Martyr of The Wretched God! </font>"
					M<<"<b>The rare item has been stored in your Bank.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received Wretched<br>","gmlog.html")
					src.Discard(1)
				if(R==17)
					M.bank.DepositItem2(new /obj/Items/Equipment/Hand/Weapons/Wrath_of_The_Hollow_King)
					world<<"<b><font color=red size=3>Rare Xmas Gift : <font color=yellow>[M] <font color=white> has received the legendary sword, Wrath of The Hollow King! </font>"
					M<<"<b>The rare item has been stored in your Bank.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received Wretched<br>","gmlog.html")
					src.Discard(1)
				if(R==18)
					M.bank.DepositItem2(new /obj/Items/Equipment/Body/Armor/Dread_Lord_Mantle)
					world<<"<b><font color=red size=3>Rare Xmas Gift : <font color=yellow>[M] <font color=white> has received a Dread Lord Mantle! </font>"
					M<<"<b>The rare item has been stored in your Bank.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received an Dread<br>","gmlog.html")
					src.Discard(1)
				if(R==19)
					M.Gold +=600000
					M.Badges+=2000
					world<<"<b><font color=red size=3>Rare Xmas Gift : <font color=yellow>[M] <font color=white> has received 600000  amd 2000 Badges.! </font>"
					M<<"<b>You are now 600k and 2000 Badges richer.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received 600k gold +2k cr<br>","gmlog.html")
					src.Discard(1)
				if(R==20)
					M.Badges +=1500
					world<<"<b><font color=red size=3>Rare Xmas Gift : <font color=yellow>[M] <font color=white> has received 1500 Badges! </font>"
					M<<"<b>You are now 1500 Badges richer.Merry Christmas!"
					text2file("[time2text(world.realtime)]:[M] Xmas Gift received 500 Badges<br>","gmlog.html")
					src.Discard(1)*/


		Mystery_Box
			GoldValue=1;SilvValue=1;CoprValue=1;BadgesValue=100
			icon_state="EpicGift";mouse_drag_pointer="EpicGift"
			noenchant=1
			noauc=1
			Unique=1
			desc="The Mystery box can contain many gifts like complete midnight sets, decimator, roots, or even the ability to use Custom Icons,personal spawn, your own Custom Skill(attack or buff),roots/saplings  and more!!"
			desc2="The Mystery box can contain many gifts like complete midnight sets, or even the ability to use Custom Icons,personal Spawn, your own Custom Skill(attack or buff),roots/saplings and more!!!!"
			Use(var/mob/M)
				var/R = rand(1,10)
				if(M.Giftcd==1)
					R=rand(2,8)
				if(R==1)
					M.Badges +=300
					world<<"<b><font color=red size=3>Mystery Reward : <font color=yellow>[M] <font color=white> has received 300 Badges! </font>"
					M<<"<b>You are now 300 Badges richer!"
					text2file("[time2text(world.realtime)]:[M] Bonus received 300 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==2)
					M.Badges +=50
					world<<"<b><font color=red size=3>Mystery Reward : <font color=yellow>[M] <font color=white> has received 50 Badges! </font>"
					M<<"<b>You are now 50 Badges richer!"
					text2file("[time2text(world.realtime)]:[M] Bonus received 10 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==3)
					M.Badges +=40
					world<<"<b><font color=red size=3>Mystery Reward : <font color=yellow>[M] <font color=white> has received 40 Badges! </font>"
					M<<"<b>You are now 40 Badges richer!"
					text2file("[time2text(world.realtime)]:[M] Bonus received 10 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==4)
					world<<"<b><font color=red size=3>Mystery Reward : <font color=yellow>[M] <font color=white> has received the Root! </font>"
					M<<"<b>You can claim the root from Kabuto!"
					text2file("[time2text(world.realtime)]:[M] Bonus received Root<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==5)
					world<<"<b><font color=red size=3>Mystery Reward : <font color=yellow>[M] <font color=white> has received the Sapling! </font>"
					M<<"<b>You can claim the Sapling from Kabuto!"
					text2file("[time2text(world.realtime)]:[M] Bonus received Sapling<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==6)
					M.Badges +=200
					world<<"<b><font color=red size=3>Mystery Reward : <font color=yellow>[M] <font color=white> has received 200 Badges! </font>"
					M<<"<b>You are now 200 Badges richer!"
					text2file("[time2text(world.realtime)]:[M] Bonus received 200 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==7)
					M.Badges +=30
					world<<"<b><font color=red size=3>Mystery Reward : <font color=yellow>[M] <font color=white> has received 30 Badges! </font>"
					M<<"<b>You are now 30 Badges richer!"
					text2file("[time2text(world.realtime)]:[M] Bonus received 10 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==8)
					world<<"<b><font color=red size=3>Mystery Reward : <font color=yellow>[M] <font color=white> has received the Midnight Set! </font>"
					M<<"<b>You can claim the set from Kabuto!"
					text2file("[time2text(world.realtime)]:[M] Bonus received midnight set<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==9)
					M.Badges +=150
					world<<"<b><font color=red size=3>Mystery Reward : <font color=yellow>[M] <font color=white> has received 150 Badges! </font>"
					M<<"<b>You are now 150 Badges richer!"
					text2file("[time2text(world.realtime)]:[M] Bonus received 150 Badges<br>","gmlog.html")
					src.Discard(1)
					M.Save()
				if(R==10)
					world<<"<b><font color=red size=3>Mystery Reward : <font color=yellow>[M] <font color=white> has received <font color=red>The Decimator! </font>"
					M<<"<b>Your item will be bestowed by Kabuto!"
					text2file("[time2text(world.realtime)]:[M] Bonus received decimator<br>","gmlog.html")
					src.Discard(1)
					M.Save()




		Respec_Cupon
			icon_state="Respec Cupon";mouse_drag_pointer="Respec Cupon"
			noenchant=1
			noauc=1
			desc="Can be used at any time for 1 free respec on your character."
			desc2="Can be used at any time for 1 free respec on your character."
			Use(var/mob/M)
				QuestShow(M,"Your Character has been Respecced")
				M.Respec();src.Discard(1)
		Refine_Protection
			GoldValue=0;SilvValue=0;CoprValue=0;BadgesValue=30
			icon_state="Scroll2";mouse_drag_pointer="Scroll2"
			noenchant=1
			noauc=1
			desc="A scroll which provides complete protection from the failed results of Refining."
			desc2="A scroll which provides complete protection from the failed results of Refining."
			Use(var/mob/M)
				M.hassafe+=1
				src.Discard(1)
				M<<"<font color=red><b>Your have gained 1 protection from refining failures."
				M.Save()
		Comm_Pack_Ticket
			GoldValue=0;SilvValue=0;CoprValue=0;BadgesValue=25
			icon_state="Scroll2";mouse_drag_pointer="Scroll2"
			noenchant=1
			noauc=1
			desc="Special pack containing a large amount of all commodities. "
			desc2="Special pack containing a large amount of all commodities."
			Use(var/mob/M)
				usr.Leather+=50
				usr.Iron += 50
				usr.Gems +=50
				usr.Mithril +=50
				usr.Thread +=50
				usr.MeteorFragment +=30
				usr.DivineOre +=15
				usr.EnchantedOre +=40
				usr.Adhesive +=50
				usr.Bones+=50
				src.Discard(1)
				usr<<"<font color=red><b>Your have received 50 Leather, 50 Iron, 50 Mithril, 50 Thread, 50 Bones, 50 Adhesive, 50 Gems, 40 Enchanted Ore, 30 Meteor, 15 Divine Ore ."
				usr.Save()
		Equipment_Upgrade
			GoldValue=0;SilvValue=0;CoprValue=0;BadgesValue=20
			icon_state="Scroll2";mouse_drag_pointer="Scroll2"
			noenchant=1
			noauc=1
			desc="This will upgrade your weapon or armor into its next form.Assuming the item is upgradeable"
			desc2="This will upgrade your weapon or armor into its next form. Assuming the item is upgradeable"
			Use(var/mob/M)
				switch(input(M,"Choose which item to upgrade. (Must have item in inventory and not equipped, do not carry more than one when upgrading)") in list ("Devourer of Souls","Wrath of the Hollow King","ExoSkeleton","Dread Lord Mantle","Cowl of Infinity","Cancel"))
					if("Devourer of Souls")
						for(var/obj/Items/Equipment/Hand/Weapons/The_Devourer_Of_Souls/X in M.Inventory)
							if(!X)
								M<<"You are not carrying such a [X]!"
								return
							if(X)
								X.Del(1)
								M.bank.DepositItem2(new /obj/Items/Equipment/Hand/Weapons/Wrath_of_The_Hollow_King)
								world<<"<b><font color=red size=3>Weapon Upgrade : <font color=yellow>[M] <font color=white> has upgraded the Devourer of Souls and received The Wrath of the Hollow King sword.</font>"
								src.Discard(1)
								text2file("[time2text(world.realtime)]:[M] upgraded to Wrath of Hollow<br>","donatorpurch.html")
								M.Save()
								return
					if("Wrath of the Hollow King")
						for(var/obj/Items/Equipment/Hand/Weapons/Wrath_of_The_Hollow_King/X in M.Inventory)
							if(!X)
								M<<"You are not carrying such a [X]!"
								return
							if(X)
								X.Del(1)
								M.bank.DepositItem2(new /obj/Items/Equipment/Hand/Weapons/Martyr_of_The_Wretched_God)
								world<<"<b><font color=red size=3>Weapon Upgrade : <font color=yellow>[M] <font color=white> has upgraded the The Wrath of the Hollow King and received The Martyr of the Wretched God sword.</font>"
								src.Discard(1)
								text2file("[time2text(world.realtime)]:[M] upgraded to Martyr of the W<br>","donatorpurch.html")
								M.Save()
								return
					if("ExoSkeleton")
						for(var/obj/Items/Equipment/Body/Armor/ExoSkeleton/X in M.Inventory)
							if(!X)
								M<<"You are not carrying such an [X]!"
								return
							if(X)
								X.Del(1)
								M.bank.DepositItem2(new /obj/Items/Equipment/Body/Armor/Dread_Lord_Mantle)
								world<<"<b><font color=red size=3>Armor Upgrade : <font color=yellow>[M] <font color=white> has upgraded the The ExoSkeleton and received the Dread Lord Mantle.</font>"
								src.Discard(1)
								text2file("[time2text(world.realtime)]:[M] upgraded to Mantle<br>","donatorpurch.html")
								M.Save()
								return
					if("Dread Lord Mantle")
						for(var/obj/Items/Equipment/Body/Armor/Dread_Lord_Mantle/X in M.Inventory)
							if(!X)
								M<<"You are not carrying such a [X]!"
								return
							if(X)
								X.Del(1)
								M.bank.DepositItem2(new /obj/Items/Equipment/Body/Armor/Athanatos)
								world<<"<b><font color=red size=3>Armor Upgrade : <font color=yellow>[M] <font color=white> has upgraded the Dread Lord Mantle and received the Athanatos.</font>"
								src.Discard(1)
								text2file("[time2text(world.realtime)]:[M] upgraded to Athanatos<br>","donatorpurch.html")
								M.Save()
								return
					if("Cowl of Infinity")
						for(var/obj/Items/Other/Equipment_Upgrade/o in M.Inventory)
							if(o)
								if(o.CurStack<5)
									M<<"You require 5 Upgrade scrolls for this item!"
									return
								if(o.CurStack>=5)
									for(var/obj/Items/Equipment/Head/Cowl_of_Infinity/X in M.Inventory)
										if(!X)
											M<<"You are not carrying such a [X]!"
											return
										if(X)
											X.Del(1)
											M.bank.DepositItem2(new /obj/Items/Equipment/Head/Acaliptos)
											world<<"<b><font color=red size=3>Armor Upgrade : <font color=yellow>[M] <font color=white> has upgraded the Cowl of Infinity and received the Acaliptos.</font>"
											src.Discard(5)
											text2file("[time2text(world.realtime)]:[M] upgraded to Acaliptos<br>","donatorpurch.html")
											M.Save()
											return




		Barber_Cupon
			icon_state="Barber Cupon";mouse_drag_pointer="Barber Cupon"
			noenchant=1
			noauc=1
			desc="Can be used at any time for 1 free hair cut on your character."
			desc2="Can be used at any time for 1 free hair cut on your character."
			Use(var/mob/M)
				M.HairColor();src.Discard(1)
		Progress_Cupon
			HasUse=0
			noenchant=1
			noauc=1
			icon_state="Progress Cupon";mouse_drag_pointer="Progress Cupon"
			desc="Can be traded in for a Respec or Barber Cupon at your local Spirit Master"
			desc2="Can be traded in for a Respec or Barber Cupon at your local Spirit Master"
	StatBoosters
		icon='StatBoosters.dmi'
		MaxStack=25
		noenchant=1
		var/Stat2Boost="MaxSTM"
		var/Amt2Boost=100
		var/Duration=1800//30 min
		Use(var/mob/M)
			M.AddEffect(new/datum/StatusEffects/ItemStatBooster(src,usr.name))
			src.Discard(1)
		Adrenaline_Shot
			GoldValue=0;SilvValue=4;CoprValue=0
			noauc=1
			Stat2Boost="MaxSTM";Amt2Boost=100;Duration=1800
			icon_state="Adrenaline Shot";mouse_drag_pointer="Adrenaline Shot"
			desc="Increases Maxmimum Stamina by 100 for 30 minutes"
			desc2="Increases Maxmimum Stamina by 100 for 30 minutes"
		Reiatsu_Injection
			GoldValue=0;SilvValue=4;CoprValue=0
			noauc=1
			Stat2Boost="MaxREI";Amt2Boost=50;Duration=1800
			icon_state="Reiatsu Injection";mouse_drag_pointer="Reiatsu Injection"
			desc="Increases Maxmimum Reiatsu by 50 for 30 minutes"
			desc2="Increases Maxmimum Reiatsu by 50 for 30 minutes"
	Potions
		icon='Potions.dmi'
		noenchant=1
		MaxStack=25
		proc/HealStm(var/mob/M,var/Heal)
			M.STM=min(M.MaxSTM,M.STM+Heal)
			M.StmBar();DamageShow(M,Heal,'HealNums.dmi')
			if(M.STM>=M.MaxSTM)	QuestShow(M,"STM Fully Restored")
			else	QuestShow(M,"[Heal] STM Restored")
		proc/HealRei(var/mob/M,var/Heal)
			M.REI=min(M.MaxREI,M.REI+Heal)
			M.ReiBar();DamageShow(M,Heal,'HealNums.dmi')
			if(M.REI>=M.MaxREI)	QuestShow(M,"REI Fully Restored")
			else	QuestShow(M,"[Heal] REI Restored")
		Energy_Drink
			GoldValue=0;SilvValue=2;CoprValue=0
			noauc=1
			noenchant=1
			icon_state="Energy Drink";mouse_drag_pointer="Energy Drink"
			desc="A Popular Sports Drink. > Restores 50 Stamina"
			desc2="A Popular Sports Drink. > Restores 50 Stamina"
			Use(var/mob/M)
				src.HealStm(M,50)
				src.Discard(1)
		Glowing_Red_Mask
			icon_state="Shattered Hollow Mask";mouse_drag_pointer="Shattered Hollow Mask"
			Unique=1
			noauc=1
			noenchant=1
			desc="A strange mask piece which radiates with power."
			desc2="A strange mask piece which radiates with power."
		Spirit_Dew
			GoldValue=0;SilvValue=2;CoprValue=0
			noauc=1
			icon_state="Spirit Dew";mouse_drag_pointer="Spirit Dew"
			desc="Condensed Spirit Energy. > Restores 25 Reiatsu"
			desc2="Condensed Spirit Energy. > Restores 25 Reiatsu"
			noenchant=1
			Use(var/mob/M)
				src.HealRei(M,25)
				src.Discard(1)
		Phoenix_Feather
			Epic = 1
			noenchant=1
			GoldValue=400;SilvValue=2;CoprValue=0
			icon_state="Phoenix Feather";mouse_drag_pointer="Phoenix Feather"
			desc="A Feather from a Phoenix. > Automaticaly recovers full Stamina, preventing death."
			desc2="A Feather from a Phoenix. > Automaticaly recovers full Stamina, preventing death."
	EnemySpoils
		GoldValue=0;SilvValue=0;CoprValue=50
		icon='Spoils.dmi'
		MaxStack=25
		HasUse=0
		Onyx
			icon_state="Onyx";mouse_drag_pointer="Onyx"
			noauc=1
			noenchant=1
			desc="A shiney black stone"
			desc2="A shiney black stone"
		Treen_Arms
			GoldValue=0;SilvValue=1;CoprValue=0
			icon_state="Treen Arms";mouse_drag_pointer="Treen Arms"
			noauc=1
			noenchant=1
			desc="Arms ripped from a Treen Hollow after it was defeated"
			desc2="Arms ripped from a Treen Hollow after it was defeated"
		Tangled_Vine
			GoldValue=0;SilvValue=1;CoprValue=50
			icon_state="Tangled Vine";mouse_drag_pointer="Tangled Vine"
			noauc=1
			noenchant=1
			desc="Vines that are tangled together."
			desc2="Vines that are tangled together."
		Spider_Legs
			icon_state="Spider Legs";mouse_drag_pointer="Spider Legs"
			noauc=1
			noenchant=1
			desc="Sticky legs from a spider-like hollow."
			desc2="Sticky legs from a spider-like hollow."
		Hollow_Mask
			icon_state="Hollow Mask";mouse_drag_pointer="Hollow Mask"
			noauc=1
			noenchant=1
			desc="Graft to Create Equipment Shards.  Effects Vary by Hollow Type."
			desc2="Graft to Create Equipment Shards.  Effects Vary by Hollow Type."
		Cracked_Hollow_Mask
			icon_state="Cracked Hollow Mask";mouse_drag_pointer="Cracked Hollow Mask"
			noauc=1
			noenchant=1
			desc="A hollow mask that was damaged during battle."
			desc2="A hollow mask that was damaged during battle."
		Shattered_Hollow_Mask
			icon_state="Shattered Hollow Mask";mouse_drag_pointer="Shattered Hollow Mask"
			noauc=1
			noenchant=1
			desc="A hollow mask that was destroyed during battle."
			desc2="A hollow mask that was destroyed during battle."
		Flaming_Crystal
			icon_state="Flaming Crystal";mouse_drag_pointer="Flaming Crystal"
			noauc=1
			noenchant=1
			desc="A ruby red crystal embued with the power of fire."
			desc2="A ruby red crystal embued with the power of fire."
		Ham_Sandwich
			icon_state="Ham Sandwich";mouse_drag_pointer="Ham Sandwich"
			noauc=1
			noenchant=1
			desc="A delicious looking ham and cheese sandwich."
			desc2="A delicious looking ham and cheese sandwich."
		Bat_Guano
			icon_state="Bat Guano";mouse_drag_pointer="Bat Guano"
			noauc=1
			noenchant=1
			desc="This is bat poop.  Why the heck did you pick this up?"
			desc2="This is bat poop.  Why the heck did you pick this up?"


	QuestItems
		icon='QuestItems.dmi'
		MaxStack=25
		HasUse=0
		Diary
			Unique=1
			noenchant=1
			icon_state="Diary";mouse_drag_pointer="Diary"
			desc="A pink diary found at the beach."
			desc2="A pink diary found at the beach."
		Lost_Purse
			Unique=1
			noenchant=1
			icon_state="Lost Purse";mouse_drag_pointer="Lost Purse"
			noauc=1
			desc="You should probably find the owner of this purse."
			desc2="You should probably find the owner of this purse."
		Sour_Flower
			icon_state="Sour Flowers";mouse_drag_pointer="Sour Flowers"
			noauc=1
			noenchant=1
			desc="A slightly poisonous flower.  Used to create various potions."
			desc2="A slightly poisonous flower.  Used to create various potions."
		Tin_Flower
			icon_state="Tin Flowers";mouse_drag_pointer="Tin Flowers"
			noauc=1
			noenchant=1
			desc="A metallic flower.  Can be used to create various potions."
			desc2="A metallic flower.  Can be used to create various potions."
		Sturdy_Rock
			density=1
			icon_state="Sturdy Rock";mouse_drag_pointer="Sturdy Rock"
			noauc=1
			noenchant=1
			desc="It would take a lot to break this rock!"
			desc2="It would take a lot to break this rock!"


