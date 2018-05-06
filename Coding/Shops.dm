var/MaxShopStock=25

obj/NPC
	Shops
		var/list/Stock=list()
		var/list/InitStock=list()
		New()
			src.InitStock=src.Stock
			spawn(18000)	while(src)
				for(var/obj/Items/I in src.InitStock)
					for(var/obj/Items/O in src.Stock)
						if(O.type==I.type)
							O.CurStack+=5
							if(O.CurStack>MaxShopStock)	O.CurStack=MaxShopStock
							O.UpdateCount();break
				sleep(18000)
			return ..()
		proc/StockItem(var/obj/Items/O)
			for(var/obj/Items/I in src.Stock)
				if(I.type==O.type)
					I.CurStack+=O.CurStack
					if(I.CurStack>MaxShopStock)	I.CurStack=MaxShopStock
					I.UpdateCount();return
			src.Stock+=O
		DblClick()
			switch(ShowAlert(usr,"[src.name] > > Welcome, [usr.name].  We've got some great deals today!  What can I help you with?",list("Buy","Sell","Leave")))
				if("Buy")
					if(usr && !usr.Shopping)	usr.DisplayShop(src)
				if("Sell")
					if(usr && !usr.Selling)	usr.DisplaySell(src)
		Item_Peddler
		Traveling_Salesman

		Item_Merchant
			Stock=list(new/obj/Items/Potions/Energy_Drink(25),new/obj/Items/Potions/Spirit_Dew(25),\
				new/obj/Items/Other/Hollow_Bait(25),new/obj/Items/Other/Recall_Scroll(25),\
				new/obj/Items/Potions/Phoenix_Feather(25),new/obj/Items/Other/Honor_Scroll(5))

		Gear_Vendor
			Stock=list(new/obj/Items/Equipment/Hand/Weapons/Sword(25),new/obj/Items/Equipment/Hand/Weapons/Cane(25),\
				new/obj/Items/Equipment/Hand/Weapons/Rapier(25),new/obj/Items/Equipment/Hand/Weapons/Metal_Cane(25),\
				new/obj/Items/Equipment/Body/Clothes(25),new/obj/Items/Equipment/Head/Toy_Vaizard_Mask(2),\
				new/obj/Items/Equipment/Hand/Weapons/Cross_Sword(1),new/obj/Items/Equipment/Back/Cloak_of_Shadows(1),\
				new/obj/Items/Equipment/Feet/Magisters_Boots(2),new/obj/Items/Equipment/Feet/Magicians_Gambit(2),\
				new/obj/Items/Equipment/Feet/Hollowskin_Sollerets(2),new/obj/Items/Equipment/Back/Luminous_Cloak(2),\
				new/obj/Items/Equipment/Back/Banshees_drape(2),new/obj/Items/Equipment/Back/Hollowskin_Cloak(2),\
				new/obj/Items/Equipment/Head/Silver_Helm(2),new/obj/Items/Equipment/Head/Crystal_Helm(2),\
				new/obj/Items/Equipment/Head/Hollowbone_Helmet(2),new/obj/Items/Equipment/Body/Mystic/Shadowsilk_Robe(2),\
				new/obj/Items/Equipment/Body/Mystic/Frostfire_Robe(2),new/obj/Items/Equipment/Body/Mystic/Robe_of_Illusions(2),\
				new/obj/Items/Equipment/Body/Armor/Enchanted_Breastplate(2),new/obj/Items/Equipment/Body/Armor/Bloodstained_Battlearmor(2),\
				new/obj/Items/Equipment/Body/Armor/Immortality(2),new/obj/Items/Equipment/Hand/Weapons/Darkness_Bane(2),\
				new/obj/Items/Equipment/Hand/Weapons/Hollows_Tongue(2),new/obj/Items/Equipment/Hand/Weapons/The_BoneCrusher(2),\
				new/obj/Items/Equipment/Hand/Weapons/Charon(2),new/obj/Items/Equipment/Hand/Weapons/The_Annihilator(2),\
				new/obj/Items/Equipment/Body/Armor/Hymn_Of_Invulnerability(2))


		Donator_Vendor
			Stock=list(
				new/obj/Items/Equipment/Feet/Boots_Of_Wealth(25),new/obj/Items/Equipment/Head/The_Deceiver(25),\
				new/obj/Items/Equipment/Body/Armor/ExoSkeleton(5),new/obj/Items/Other/Equipment_Upgrade(10),new/obj/Items/Other/Refine_Protection(50),\
				new/obj/Items/Other/Advanced_Honor_Scroll(1),new/obj/Items/Equipment/Hand/Weapons/The_Legendary_Ark(1),\
				new/obj/Items/Other/Race_Changer(2),new/obj/Items/Other/Minor_Exp_Orb(10),new/obj/Items/Other/Medium_Exp_Orb(10),new/obj/Items/Other/Large_Exp_Orb(10),\
				new/obj/Items/Other/Super_Exp_Orb(10),new/obj/Items/Other/Supreme_Exp_Orb(10),new/obj/Items/Equipment/Body/Armor/Sanguine_Armor(5),\
				new/obj/Items/Equipment/Feet/Sanguine_Walkers(5),new/obj/Items/Equipment/Hand/Weapons/Sanguine_Slasher(5),\
				new/obj/Items/Equipment/Back/Sanguine_Cloak(25),new/obj/Items/Equipment/Head/Sanguine_Helm(5),\
				new/obj/Items/Equipment/Body/Armor/Midnight_Armor(5),new/obj/Items/Equipment/Feet/Midnight_Sollerets(5),new/obj/Items/Equipment/Back/Midnight_Cloak(5),\
				new/obj/Items/Equipment/Head/Midnight_Helm(5),new/obj/Items/Equipment/Hand/Weapons/The_Decimator(2),\
				new/obj/Items/Other/Sapling_Of_Wealth(25),new/obj/Items/Other/Root_Of_Wealth(25),new/obj/Items/Other/Mystery_Box(50))

		Commodity_Vendor
			Stock=list(
				new/obj/Items/Other/Comm_Pack_Ticket(100))
				/*,new/obj/Items/Equipment/Body/Armor/Festive_Armor(5),\
				new/obj/Items/Equipment/Feet/Festive_Moccasins(5),new/obj/Items/Equipment/Hand/Weapons/Festive_Weapon(5),\
				new/obj/Items/Equipment/Back/Festive_Cloak(25),new/obj/Items/Equipment/Head/Festive_Helmet(5))*/

