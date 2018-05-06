
/*
The class below is one that I have defined, notice I chose to use "BankClass" instead of the usual obj, mob, or turf.
This class I've defined is used to hold the bank information for the player. The class holds the current balance and has
the list of items that the player has deposited. I use procedures to access these variables and to change them (More of a
personal thing, I'm used to making these variables "private" in other programming languages).

The mob variable 'bank' holds a reference to one of these classes during the game. You can access anything in this class
through that variable. Whether it be one of the BankClass variables (ex: mob.bank.balance) or procedures (ex: mob.bank.GetBalance()).
Using classes like this can make programming easier, less messy, and in my opinion, more fun.

*/

BankClass
	var          //Holds how much money is in the bank
		list/items = list()    //Holds the items that are in the bank
	proc
		DepositItem(var/obj/O)
			if(src.items.len>=100)
				QuestShow(usr,"Bank Full")
				return
			else
				var/obj/Items/New = new O.type
				New.enc=O.enc
				New.name=O.name
				src.items.Add(New)
				QuestShow(usr,"[New] deposited in bank")
				text2file("[time2text(world.realtime)]:[usr] DEPOSIT  [New] in the bank<br>","banklogs/[usr.key].html")
				for(var/obj/Items/X in usr.Inventory)
					if(X==O)
						X.Discard(1)
				usr.SaveBank()

		DepositItem2(var/obj/O)
			if(src.items.len>=100)
				QuestShow(usr,"Bank Full")
				return
			else
				var/obj/Items/New = new O.type
				New.enc=O.enc
				New.name=O.name
				src.items.Add(New)
				QuestShow(usr,"[New] deposited in bank")
				text2file("[time2text(world.realtime)]:[usr] DEPOSIT  [New] in the bank<br>","banklogs/[usr.key].html")
				usr.SaveBank()


		WithdrawItem(var/obj/O)

			src.items.Remove(O)
			var/obj/Items/New = new O.type
			New.enc=O.enc
			New.name=O.name
			usr.GetItem(New)
			usr.SaveBank()
			text2file("[time2text(world.realtime)]:[usr] WITHDRAW  [New] in the bank<br>","banklogs/[usr.key].html")

		GetItems()
			return src.items

mob
	var
		BankClass/bank = null    //Notice how it is defined, it's 'BankClass/bank' instead of 'Bank', this is important.



