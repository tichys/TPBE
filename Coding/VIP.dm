//Curent VIP's
//JDL MAX
//

//VIP system

mob/var/VIP=0
mob/var/VIPneed=0
mob/var/VIPnext=0
mob/var/VIPnow=0
mob/var/VIPset=0
mob/var/tmp/vipexp=1
mob/var/tmp/vipgold=1
mob/var/tmp/vipsquad=1
var/VIP1=50
var/VIP2=200
var/VIP3=500
var/VIP4=1000
var/VIP5=3000


mob
	proc
		checkvip()
			if(!src.VIP && src.Subscriber)
				src.VIP=1
				src.VIPnow=50
			if(src.key=="Jdl78" || src.key=="Millamber" ||src.key=="Nikorayu")
				src.VIP=5
			if(src.VIP==1)
				src.verbs+=/mob/Subscriber/verb/Create_Guild
				src.verbs+=/mob/Subscriber/verb/Name_Color
				src.verbs+=/mob/Subscriber/verb/Font_Color
				src.verbs+=/mob/Subscriber/verb/Font_Face
				src<<"<font color=#F781F3 size=3><b><u>You are a level 1 VIP!</u></font>"
				world<<"<font color=#58FAD0 size=3><b><i>You pause briefly as [src.name], a level 1 VIP, awakens once again.</u></font>"
			if(src.VIP==2)
				src.verbs+=/mob/Subscriber/verb/Create_Guild
				src.verbs+=/mob/Subscriber/verb/Bankai_Alert
				src.verbs+=/mob/Subscriber/verb/Name_Color
				src.verbs+=/mob/Subscriber/verb/Font_Color
				src.verbs+=/mob/Subscriber/verb/Font_Face
				src<<"<font color=#F781F3 size=3><b><u>You are a level 2 VIP!</u></font>"
				world<<"<font color=#58FAD0 size=3><b><i>Your sense a slight disturbance in the air as [src.name], a level 2 VIP, awakens once again.</u></font>"
			if(src.VIP==3)
				src.verbs+=/mob/Subscriber/verb/Create_Guild
				src.verbs+=/mob/Subscriber/verb/Bankai_Alert
				src.verbs+=/mob/Subscriber/verb/Name_Color
				src.verbs+=/mob/Subscriber/verb/Font_Color
				src.verbs+=/mob/Subscriber/verb/Font_Face
				src.vipexp=2
				src.vipgold=2
				src<<"<font color=#F781F3 size=3><b><u>You are a level 3 VIP!</u></font>"
				world<<"<font color=#58FAD0 size=3><b><i>The hairs on the back of your neck stand up as [src.name], a level 3 VIP, awakens once again.</u></font>"
			if(src.VIP==4)
				src.verbs+=/mob/Subscriber/verb/Create_Guild
				src.verbs+=/mob/Subscriber/verb/Bankai_Alert
				src.verbs+=/mob/Subscriber/verb/Name_Color
				src.verbs+=/mob/Subscriber/verb/Font_Color
				src.verbs+=/mob/Subscriber/verb/Font_Face
				src.vipexp=2
				src.vipgold=2
				src.vipsquad=2
				src<<"<font color=#F781F3 size=3><b><u>You are a level 4 VIP!</u></font>"
				world<<"<font color=#58FAD0 size=3><b><i>You feel a sense of dread as [src.name], a level 4 VIP, awakens once again.</u></font>"
			if(src.VIP==5)
				src.verbs+=/mob/Subscriber/verb/Create_Guild
				src.verbs+=/mob/Subscriber/verb/Bankai_Alert
				src.verbs+=/mob/Subscriber/verb/Name_Color
				src.verbs+=/mob/Subscriber/verb/Font_Color
				src.verbs+=/mob/Subscriber/verb/Font_Face
				src.vipexp=3
				src.vipgold=3
				src.vipsquad=3
				src<<"<font color=#F781F3 size=3><b><u>You are a level 5 VIP!</u></font>"
				if(src.key!="Millamber")
					world<<"<font color=#58FAD0 size=3><b><i>You are brought to your knees as [src.name], a level 5 VIP, awakens once again.</u></font>"





mob/verb
	VIPBenefits()
		set hidden=1
		src<<browse({"
			<body bgcolor=black><font color=red size=4>
			<b><center><u>VIP BENEFITS</u></center>.<br>
			<font color=aqua>
			<br>
			<font color=yellow size=3>VIP 1<br><br>
			<font color=white>
			--- Can create a Guild.<br>
			--- Can change Name color, font color.<br>
			--- Will earn extra stat/traits per level.<br>
			--- Increased experience gain from monsters.<br>
			--- Will not be booted for being AFK<br>
			--- Extra Inventory/Save slots.<br>
			--- Can purchase items from VIP vendor with badges.<br><br>
			<font color=yellow size=3>VIP 2</font><br>
			--- Can create a Guild.<br>
			--- Can change Name color, font color.<br>
			--- Will earn extra stat/traits per level.<br>
			--- Increased experience gain from monsters.<br>
			--- Can set a Bankai message.<br>
			--- Will not be booted for being AFK<br>
			--- Extra Inventory/Save slots.<br>
			--- Can purchase items from VIP vendor with badges.<br><br>
			<font color=yellow>VIP 3</font><br>
			--- Can create a Guild.<br>
			--- Can change Name color, font color.<br>
			--- Will earn extra stat/traits per level.<br>
			--- Increased experience gain from monsters.<br>
			--- Can set a Bankai message.<br>
			--- You can leave a Squad without losing squad levels/experience.<br>
			--- Will gain TWICE as much gold and exp from monsters (ontop of existing exp boosts and events).<br>
			--- Will not be booted for being AFK<br>
			--- Extra Inventory/Save slots.<br>
			--- Can purchase items from VIP vendor with badges.<br><br>
			<font color=yellow>VIP 4</font><br>
			--- Can create a Guild.<br>
			--- Can change Name color, font color.<br>
			--- Will earn extra stat/traits per level.<br>
			--- Increased experience gain from monsters.<br>
			--- Can set a Bankai message.<br>
			--- You can leave a Squad without losing squad levels/experience.<br>
			--- Will gain TWICE as much gold and exp from monsters (ontop of existing exp boosts and events).<br>
			--- Will gain TWICE as much SQUAD exp.<br>
			--- Refining costs only 1/4 gold.<br>
			--- Will not be booted for being AFK<br>
			--- Extra Inventory/Save slots.<br>
			--- Can purchase items from VIP vendor with badges.<br><br>
			<font color=yellow>VIP 5</font><br>
			--- Can create a Guild.<br>
			--- Can change Name color, font color.<br>
			--- Will earn extra stat/traits per level.<br>
			--- Increased experience gain from monsters.<br>
			--- Can set a Bankai message.<br>
			--- You can leave a Squad without losing squad levels/experience.<br>
			--- Will gain THREE times as much gold and exp from monsters (ontop of existing exp boosts and events).<br>
			--- Will gain THREE times as much SQUAD exp.<br>
			--- World drop rate tripled.<br>
			--- Refining costs only 1/5 gold.<br>
			--- Will not be booted for being AFK<br>
			--- Extra Inventory/Save slots.<br>
			--- Can purchase items from VIP vendor with badges.<br>
			--- Can obtain Captain Rank in a squad regardless of level, if spot available.<br><br>





			"},"window=News;size=600x600")

mob
	proc
		VIPstatus()
			set hidden=1
			if(src.VIPnow<=0)
				src.VIPnow=0
			if(src.VIP<5)
				src.VIPset=src.VIP + 1
			else
				if(src.VIP>=5)
					src.VIPset="Maximum"
			src.VIPneeded()
			src<<browse({"
				<body bgcolor=black><font color=red size=4>
				<b><center><u>Your VIP Progress</u></center>.<br>
				<font color=aqua>
				<br>
				<font color=yellow size=3>You are currently VIP level <font color=red>[src.VIP]</font><br>
				You currently have <font color=red>[src.VIPnow]</font> badges towards VIP level <font color=red>[src.VIPset]</font>.<br>
				You need <font color=red>[src.VIPnext]</font> badges to level up.<br><br>



				"},"window=News;size=600x600")


		VIPneeded()
			set hidden=1
			if(src.VIP==0)
				src.VIPnext=(src.VIPnow-VIP1)
			if(src.VIP==1)
				src.VIPnext=(src.VIPnow-VIP2)
			if(src.VIP==2)
				src.VIPnext=(src.VIPnow-VIP3)
			if(src.VIP==3)
				src.VIPnext=(src.VIPnow-VIP4)
			if(src.VIP==4)
				src.VIPnext=(src.VIPnow-VIP5)

mob
	proc
		DonateNOW()
			src<<browse({"
				<body bgcolor=blue><font color=red size=4>
				<font color="#FFFFFF" size =4><b>Thank you for visiting this page. If you wish to become a Zeus VIP member by donating, please read below:</font><br>
				<Br><br>
				There are FIVE VIP levels currently, each level requires a certain amount of badges in order to be reached.<br><br>

				Level 1 VIP requires 50 badges.<br>
				Level 2 VIP requires 200 badges.<br>
				Level 3 VIP requires 500 badges.<br>
				Level 4 VIP requires 1000 badges.<br>
				Level 5 VIP requires 3000 badges.<br>

				Each badge basically is worth about 0,20$ so if you donate 1 US dollar you will receive 5 badges. All badges granted via donations will be added towards your next VIP level. In

				other words, if VIP 3 requires 500 badges and you obtained 335, each time you donate for more badges they will be added to your current total. So if you donated for another 100

				badges and you had 335 - you will have 435 towards VIP 3 etc.<br>
				<br>

				<font color="#FFFFFF"><u>Donator Benefits:</u> <br></font>
				<BR>
				For a complete list of Benefits per VIP level, you can check in game by clicking the Edit button at the top left of the screen and click on Donations and MORE INFO.
				<br>
				<br>
				<b><font color=white><b><font color=yellow>TERMS: All donations are used to maintain server costs and purchase icons/map skills, the game is free to play and you do not need to

				donate. Remember, Donations will not be refunded - so consider carefully before you donate . VIP Benefits may be changed at any time according to the needs of the game for

				balance or by decision of the Staff but it is guaranteed that Donators will always receive Benefits. By donating you agree to accept the terms mentioned. Thank you for your

				support.
				<br><br>
				<font color="#FFFFFF"><b><font size=3>READ CAREFULLY:</font> Simply click on donate below and once you arrive at the payment page, add the amount you desire and you Byond key
				in the "Add special instructions to the seller" field  before you press PAY. If you can't see that, make sure you leave Millamber a PM in the game with your byond key.
				Your benefits will be activated within a few hours after donating. Make sure you understand the TERMS above before donating - if you click donate it is assumed you have accepted

				those terms.**</b>
				</font>
				<br>
				<br>
				<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
				<input type="hidden" name="cmd" value="_donations">
				<input type="hidden" name="business" value="TDDGNXABS5VEY">
				<input type="hidden" name="lc" value="GB">
				<input type="hidden" name="item_name" value="Zeus Games">
				<input type="hidden" name="item_number" value="1001">
				<input type="hidden" name="no_note" value="0">
				<input type="hidden" name="no_shipping" value="1">
				<input type="hidden" name="currency_code" value="USD">
				<table>
				<tr><td>Enter your Amount:</td></tr><tr><td><input type="text" name="amount" value=""></td></tr>
				<!-- START COMMENTS LINES -->
				<input type="hidden" name="on0" value="Extra Comments">Enter Byond Key and any instructions:<br>
				<TEXTAREA ROWS="4" COLS="17" name="os0">
				</textarea><br>
				</table>
				<!-- END COMMENTS LINES -->
				<input type="hidden" name="bn" value="PP-DonationsBF:btn_donateCC_LG.gif:NonHosted">
				<input type="image" src="https://www.paypalobjects.com/en_US/GB/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal — The safer, easier way to pay online.">
				<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">

				</form>
				<br>
				- Donations benefits apply to all servers maintained by Zeus Games.<br>
				<br><br>
				<b>**All donations are used to maintain server costs and purchase icons/map skills, otherwise the game is free to play. Remember, Donations will not be refunded - so consider

				carefully before you donate.Thank you for your support.

				"},"window=News;size=1024x768")