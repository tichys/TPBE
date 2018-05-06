var/tmp
	Auction_Owner2 = "No one"
	Auction_Item2
	Auction_Amount2 = 0
	Highest_Bidder2 = "No one"
	AuctionON = 0


mob
	verb
		Start_Auction()
			set category ="Commands"
			set name= "Auction an Item"
			if(usr.Auctionban == 1)
				QuestShow(usr,"You are banned from Auctioning.")
				return
			if(AuctionON==1)
				usr << "<font color=yellow>Wait until the current Auction ends."
				return
			if(usr.trading==1)
				usr<<"<b><font color=red>Wait until you have finished auctioning!"
				return
			if(usr.InventoryOpen==1)
				usr<<"<b><font color=red>You must close your Inventory screen!"
				return
		//	if(usr.verbcd ==1)
		//		return
			AuctionON = 1
		//	usr.verbcd =1
			usr.trading=1
			if(Auction_Owner2 == "No one" && Auction_Owner == "No one")
				Auction_Owner2 = usr
				Highest_Bidder2 = "No one"
				var/list/objects = new()
				for(var/obj/Items/O in usr.Inventory)
					if(O.Epic == 0 && O.noauc ==0)
						objects += O
				var/obj/selected = input("Which item do you wish to put on Auction?","Starting Auction")in objects+"Cancel"
				switch(selected)
					if("Cancel")
						usr << "<font color=yellow>You decide to not start an Auction."
						Auction_Owner2 = "No one"
						usr.verbcd=0
						AuctionON=0
						usr.trading=0
					else
						Highest_Bidder2 = "No one"
						Auction_Amount2 = input("How much gold should the starting bid be?","Auction Amount")as num
						Auction_Amount2= round(Auction_Amount2)
						if(Auction_Amount2 <= 0)
							usr<<"<b>You must input a number greater than 0"
							AuctionON=0
							usr.trading=0
							usr.verbcd=0
							return
						Auction_Item2 = selected
						world << "<B><font color=teal>{Auction System} <Font color=white>[usr] has placed a \icon[Auction_Item2][Auction_Item2] to be auctioned. The starting bid is [num2text(round(Auction_Amount2),1000000)] gold.</font></b>"
						for(var/mob/Player/M in world)
							M.verbs+=/mob/Auctioner/verb/Bid_Auction
						sleep(200)
						Auction_Soldoff_Start(usr)
			else
				if(Auction_Owner2 == usr)
					usr << "<font color=red>You currently have an Auction in progress.</font>"
				else
					usr << "<font color=red>Someone is already creating an Auction, you will need to wait.</font>"
					usr.verbcd=0
					usr.trading=0

mob/Auctioner
	verb
		Bid_Auction()
			set category ="Commands"
			set name= "Bid on an Auction"
			if(AuctionON==0)
				return
			if(Auction_Owner2 == usr)
				return
			if(Auction_Owner2 == "No one")
				return
			if(Highest_Bidder2 == usr)
				usr << "<font color=red>You are currently the Highest Bidder, you do not need to bid again.</font>"
			else
				var/amount = input("How much gold would you like to place as a bid on [Auction_Item2]?\n\nCurrent Highest Bid: [num2text(round(Auction_Amount2),1000000)]","Bid!")as num
				if(amount >= usr.Gold || amount <= 0)
					usr << "<font color=red>Notice: The item costs more gold than you currently have."
					return
				else if(amount > Auction_Amount2)
					Auction_Amount2 = round(amount)
					Highest_Bidder2 = usr
					world << "<b><font color=teal>{AUCTION} <font color=navy>[usr] has placed a bid of [round(amount)] gold on \icon[Auction_Item2][Auction_Item2]!</font></b>"
					usr.trading=1
				else
					usr << "<font color=red>Your bid needs to be higher than the Current Highest Bid.</font>"


proc
	Auction_Soldoff_Start()
		while(world)
			top:
			if(Highest_Bidder2 == "No one")
				sleep(36)
				if(Auction_Owner2 == "No one")
					world << "<B><font color=teal>{AUCTION} Auction owner not present. Auction cancelled."
					CancelAuctions()
					return
				if(Highest_Bidder2 != "No one")
					goto(top)
				world << "<B><font color=teal>{AUCTION} <Font color=blue> \icon[Auction_Item2][Auction_Item2] going once. No bids have been set."
				sleep(300)
				if(Auction_Owner2 == "No one")
					world << "<B><font color=teal>{AUCTION} Auction owner not present. Auction cancelled."
					CancelAuctions()
					return
				if(Highest_Bidder2 != "No one")
					goto(top)
				world << "<B><font color=teal>{AUCTION} <Font color=blue> \icon[Auction_Item2][Auction_Item2] going twice. No bids have been set."
				sleep(300)
				if(Auction_Owner2 == "No one")
					world << "<B><font color=teal>{AUCTION} Auction owner not present. Auction cancelled."
					CancelAuctions()
					return
				if(Highest_Bidder2 != "No one")
					goto(top)
				world << "<B><font color=teal>{AUCTION} <Font color=blue> \icon[Auction_Item2][Auction_Item2] has been cancelled as no bids have been placed."
				for(var/mob/Player/M in world)
					M.verbs-= /mob/Auctioner/verb/Bid_Auction
				Auction_Item2 = ""
				Auction_Amount2 = 0
				Highest_Bidder2 = "No one"
				Auction_Owner2 = "No one"
				AuctionON=0
				usr.trading=0
				usr.verbcd=0
				return
			else
				var
					Old_Highest_Bidder2 = Highest_Bidder2
				sleep(36)
				if(Auction_Owner2 == "No one")
					world << "<B><font color=teal>{AUCTION} Auction owner not present. Auction cancelled."
					CancelAuctions()
					return
				if(Old_Highest_Bidder2 != Highest_Bidder2)
					goto(top)
				world << "<B><font color=teal>{AUCTION} <Font color=blue> \icon[Auction_Item2][Auction_Item2] going once to [Highest_Bidder2] for [num2text(round(Auction_Amount2),1000000)] gold!"
				sleep(300)
				if(Auction_Owner2 == "No one")
					world << "<B><font color=teal>{AUCTION} Auction owner not present. Auction cancelled."
					CancelAuctions()
					return
				if(Old_Highest_Bidder2 != Highest_Bidder2)
					goto(top)
				world << "<B><font color=teal>{AUCTION} <Font color=blue> \icon[Auction_Item2][Auction_Item2] going twice to [Highest_Bidder2] for [num2text(round(Auction_Amount2),1000000)] gold!"
				sleep(300)
				if(Auction_Owner2 == "No one")
					world << "<B><font color=teal>{AUCTION} Auction owner not present. Auction cancelled."
					CancelAuctions()
					return
				if(Old_Highest_Bidder2 != Highest_Bidder2)
					goto(top)
				world << "<B><font color=teal>{AUCTION} <Font color=blue> \icon[Auction_Item2][Auction_Item2] sold to [Highest_Bidder2] for [num2text(round(Auction_Amount2),1000000)] gold!"
				world << "<b><font color=teal>{AUCTION} <font color=white>The Auction has ended.</font></b>"
				for(var/mob/Player/M in world)
					M.verbs-= /mob/Auctioner/verb/Bid_Auction
				var/mob/reciever = Highest_Bidder2
				var/obj/reward = Auction_Item2
				reciever.TakeGold(Auction_Amount2)
				var/obj/Items/Newitem = new reward.type
				Newitem.name=reward.name
				Newitem.enc=reward.enc
				reciever.GetItem2(Newitem)
				usr.Gold += Auction_Amount2
				//reciever.Inventory+=new Auction_Item2
				//new Auction_Item2:type(reciever)
				reciever << "<font color=red><b>\icon[Auction_Item2][Auction_Item2] won.<Br><b>[num2text(round(Auction_Amount2),1000000)] gold transfered to [Auction_Owner2].</font>"
				usr << "<font color=red><b>\icon[Auction_Item2][Auction_Item2] fades from your inventory.<Br><b>You received [num2text(round(Auction_Amount2),1000000)] gold!</font>"
				for(var/obj/Items/N in usr.Inventory)
					if(N==reward)
						N.Discard(1)
				Auction_Item2 = ""
				Auction_Amount2 = 0
				Highest_Bidder2 = "No one"
				Auction_Owner2 = "No one"
				AuctionON=0
				usr.trading=0
				reciever.trading=0
				for(var/mob/Player/M in world)	M.trading=0
				usr.Save()
				reciever.Save()
				return

