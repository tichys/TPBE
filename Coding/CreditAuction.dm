var/tmp
	Auction_Owner = "No one"
	Auction_Item
	Auction_Amount = 0
	Highest_Bidder = "No one"


/*mob
	verb
		Start_Auction2()
			set category ="Commands"
			set name= "Auction for Credits"
			if(usr.Auctionban == 1)
				QuestShow(usr,"You are banned from Auctioning.")
				return
			if(AuctionON==1)
				usr << "<font color=yellow>Wait until the current Auction ends."
				return
		//	if(usr.verbcd ==1)
			//	return
			if(usr.trading==1)
				usr<<"<b><font color=red>Wait until you have finished auctioning!"
				return
			if(usr.InventoryOpen==1)
				usr<<"<b><font color=red>You must close your Inventory screen!"
				return
			AuctionON=1
			//usr.verbcd =1
			usr.trading=1
			if(Auction_Owner == "No one" && Auction_Owner2 == "No one" )
				Auction_Owner = usr
				Highest_Bidder = "No one"
				var/list/objects = new()
				for(var/obj/Items/O in usr.Inventory)
					if(O.Epic == 0 && O.noauc ==0)
						objects += O
				var/obj/selected = input("Which item do you wish to put on Auction?","Starting Auction")in objects+"Cancel"
				switch(selected)
					if("Cancel")
						usr << "<font color=yellow>You decide to not start an Auction."
						Auction_Owner = "No one"
						usr.verbcd=0
						AuctionON=0
						usr.trading=0
						usr.verbcd=0
					else
						Highest_Bidder = "No one"
						Auction_Amount = input("How many credits should the starting bid be?","Auction Amount")as num
						Auction_Amount= round(Auction_Amount)
						if(Auction_Amount <= 0)
							usr<<"<b>You must input a number greater than 0"
							AuctionON=0
							usr.trading=0
							usr.verbcd=0
							return
						Auction_Item = selected
						world << "<B><font color=teal>{Auction System} <Font color=white>[usr] has placed a \icon[Auction_Item][Auction_Item] to be auctioned. The starting bid is [num2text(round(Auction_Amount),1000000)] CREDITS.</font></b>"
						for(var/mob/Player/M in world)
							M.verbs+=/mob/Auctioner/verb/Bid_Auction2
						sleep(200)
						Auction_Soldoff_Start2(usr)

			else
				if(Auction_Owner == usr)
					usr << "<font color=red>You currently have an Auction in progress.</font>"
				else
					usr << "<font color=red>Someone is already creating an Auction, you will need to wait.</font>"
					usr.verbcd=0
					usr.trading=0
mob/Auctioner
	verb
		Bid_Auction2()
			set category ="Commands"
			set name= "Bid on Credit Auction"
			if(AuctionON==0)
				return
			if(Auction_Owner == usr)
				return
			if(Auction_Owner == "No one")
				return
			if(Highest_Bidder == usr)
				usr << "<font color=red>You are currently the Highest Bidder, you do not need to bid again.</font>"
			else
				var/amount = input("How many credits would you like to place as a bid on [Auction_Item]?\n\nCurrent Highest Bid: [Auction_Amount]","Bid!")as num
				if(amount > usr.Credits || amount <= 0)
					usr << "<font color=red>Notice: The item costs more credits than you currently have."
					return
				else if(amount > Auction_Amount)
					Auction_Amount = round(amount)
					Highest_Bidder = usr
					world << "<b><font color=teal>{AUCTION} <font color=navy>[usr] has placed a bid of [round(amount)] CREDITS on \icon[Auction_Item][Auction_Item]!</font></b>"
					usr.trading=1
				else
					usr << "<font color=red>Your bid needs to be higher than the Current Highest Bid.</font>"

proc
	Auction_Soldoff_Start2()
		while(world)
			top:
			if(Highest_Bidder == "No one")
				sleep(36)
				if(Auction_Owner == "No one")
					world << "<B><font color=teal>{AUCTION} Auction owner not present. Auction cancelled."
					CancelAuctions()
					return
				if(Highest_Bidder != "No one")
					goto(top)
				world << "<B><font color=teal>{AUCTION} <Font color=blue> \icon[Auction_Item][Auction_Item] going once. No bids have been set."
				sleep(100)
				if(Auction_Owner == "No one")
					world << "<B><font color=teal>{AUCTION} Auction owner not present. Auction cancelled."
					CancelAuctions()
					return
				if(Highest_Bidder != "No one")
					goto(top)
				world << "<B><font color=teal>{AUCTION} <Font color=blue> \icon[Auction_Item][Auction_Item] going twice. No bids have been set."
				sleep(100)
				if(Auction_Owner == "No one")
					world << "<B><font color=teal>{AUCTION} Auction owner not present. Auction cancelled."
					CancelAuctions()
					return
				if(Highest_Bidder != "No one")
					goto(top)
				world << "<B><font color=teal>{AUCTION} <Font color=blue> \icon[Auction_Item][Auction_Item] has been cancelled as no bids have been placed."
				for(var/mob/Player/M in world)
					M.verbs-=/mob/Auctioner/verb/Bid_Auction2
				Auction_Item = ""
				Auction_Amount = 0
				Highest_Bidder = "No one"
				Auction_Owner = "No one"
				AuctionON=0
				usr.trading=0
				usr.verbcd=0
				return
			else
				var
					Old_Highest_Bidder = Highest_Bidder
				sleep(36)
				if(Auction_Owner == "No one")
					world << "<B><font color=teal>{AUCTION} Auction owner not present. Auction cancelled."
					CancelAuctions()
					return
				if(Old_Highest_Bidder != Highest_Bidder)
					goto(top)
				world << "<B><font color=teal>{AUCTION} <Font color=blue> \icon[Auction_Item][Auction_Item] going once to [Highest_Bidder] for [Auction_Amount] CREDITS!"
				sleep(100)
				if(Auction_Owner == "No one")
					world << "<B><font color=teal>{AUCTION} Auction owner not present. Auction cancelled."
					CancelAuctions()
					return
				if(Old_Highest_Bidder != Highest_Bidder)
					goto(top)
				world << "<B><font color=teal>{AUCTION} <Font color=blue> \icon[Auction_Item][Auction_Item] going twice to [Highest_Bidder] for [Auction_Amount] CREDITS!"
				sleep(100)
				if(Auction_Owner == "No one")
					world << "<B><font color=teal>{AUCTION} Auction owner not present. Auction cancelled."
					CancelAuctions()
					return
				if(Old_Highest_Bidder != Highest_Bidder)
					goto(top)
				world << "<B><font color=teal>{AUCTION} <Font color=blue> \icon[Auction_Item][Auction_Item] sold to [Highest_Bidder] for [Auction_Amount] CREDITS!"
				world << "<b><font color=teal>{AUCTION} <font color=white>The Auction has ended.</font></b>"
				for(var/mob/Player/M in world)
					M.verbs-=/mob/Auctioner/verb/Bid_Auction2
				var/mob/reciever = Highest_Bidder
				var/obj/reward = Auction_Item
				reciever.Credits -= Auction_Amount
				var/obj/Items/Newitem = new reward.type
				Newitem.name=reward.name
				Newitem.enc=reward.enc
				reciever.GetItem2(Newitem)
				usr.Credits += Auction_Amount
				//reciever.Inventory+=new Auction_Item
				//new Auction_Item:type(reciever)
				reciever << "<font color=red><b>\icon[Auction_Item][Auction_Item] won.<Br><b>[Auction_Amount] credits transfered to [Auction_Owner].</font>"
				usr << "<font color=red><b>\icon[Auction_Item][Auction_Item] fades from your inventory.<Br><b>You received [Auction_Amount] credits!</font>"
				for(var/obj/Items/N in usr.Inventory)
					if(N==reward)
						N.Discard(1)
				text2file("[time2text(world.realtime)]:Auction: [usr] received [Auction_Amount2] credits from [reciever]<br>","gmlog.html")
				Auction_Item = ""
				Auction_Amount = 0
				Highest_Bidder = "No one"
				Auction_Owner = "No one"
				AuctionON=0
				usr.trading=0
				usr.verbcd=0
				reciever.trading=0
				for(var/mob/Player/M in world)	M.trading=0
				usr.Save()
				reciever.Save()
				return


*/