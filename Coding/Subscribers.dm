var/list/SubList=list()
mob/var/Subscriber=0

mob/verb/SubscribeMenu()
	set hidden=1
	switch(alert("Zeus VIP Membership","Donate","More Info","VIP Status","Donate Now"))
		if("More Info")	usr.VIPBenefits()
		if("VIP Status")	usr.VIPstatus()
		if("Donate Now")	usr.DonateNOW()
	//	if("Donate Now")	usr<<link("http://162.243.95.178/subscribe.html")

proc/LoadSubs(var/Loop=1)
	var/http[]=world.Export("http://162.243.95.178/Subscribers.txt")
	if(!http)	//Site could not be contacted
		if(Loop)	spawn(600)	LoadSubs()
		return
	var/F=file2text(http["CONTENT"])
	if(copytext(F,1,2)!="B")	//Invalid site reached?
		if(Loop)	spawn(600)	LoadSubs()
		return
	SubList=list()
	var/counter=1
	while(findtext(F,CRGRTN,counter,0))
		var/SubLine=copytext(F,counter,findtext(F,CRGRTN,counter,0))
		var/list/SplitList=Split(SubLine,"/")
		for(var/x in SplitList)	SubList+=x
		counter=findtext(F,CRGRTN,counter,0)+1
	world<<"[ServerInfoTag]Subscriber List Successfully Loaded"
	ActivateNewSubs()
	if(Loop)	spawn(36000)	LoadSubs()

proc/ActivateNewSubs()
	for(var/mob/M in Players)
		if(M.Subscriber)		if(!SubKeyCheck(M.key))
			M.RemoveSub();world<<"[M]'s Donator status Expired =("
		else	if(SubKeyCheck(M.key))
			M.SubCheck();world<<"[M]'s VIP benefits are now Active."

mob/proc/RemoveSub()
	src.Subscriber=0
	src.VIP=0
	src.verbs-=typesof(/mob/Subscriber/verb)
	src.verbs+=/mob/Subscriber/verb/Subscribe

proc/SubKeyCheck(var/Key2Check)
	var/CurrentDate=text2num(time2text(world.timeofday,"YYMMDD"))
	var/KeyLocation=SubList.Find(Key2Check,1,0)
	if(KeyLocation)
		var/ExpDate=SubList[KeyLocation+1]
		var/Converted=copytext(ExpDate,7,9)+copytext(ExpDate,1,3)+copytext(ExpDate,4,6)
		var/ExpDateNum=text2num(Converted)
		if(ExpDateNum-CurrentDate>0)	return 1

mob/proc/SubCheck()
	SubInfo()
	var/CurrentDate=text2num(time2text(world.timeofday,"YYMMDD"))
	src.verbs+=/mob/Subscriber/verb/Subscribe
	var/KeyLocation=SubList.Find(src.key,1,0)
	if(KeyLocation)
		var/ExpDate=SubList[KeyLocation+1]
		var/Converted=copytext(ExpDate,7,9)+copytext(ExpDate,1,3)+copytext(ExpDate,4,6)
		var/ExpDateNum=text2num(Converted)
		if(ExpDateNum-CurrentDate>0)
			src.Subscriber=1



mob/proc/SubExpirationCheck(/**/)
	var/KeyLocation=SubList.Find(src.key,1,0)
	if(KeyLocation)
		var/ExpDate=SubList[KeyLocation+1]
		var/Converted=copytext(ExpDate,7,9)+copytext(ExpDate,1,3)+copytext(ExpDate,4,6)
		var/ExpDateNum=text2num(Converted)
		var/CurrentDate=text2num(time2text(world.timeofday,"YYMMDD"))
		if(ExpDateNum-CurrentDate<=0)
			src.ClothesR=0;src.ClothesG=0;src.ClothesB=0
			src.FontColor=initial(src.FontColor);src.FontFace=initial(src.FontFace);src.NameColor=initial(src.NameColor)

mob/proc/SubInfo(/**/)
	src<<""
	var/CurrentDate=text2num(time2text(world.timeofday,"YYMMDD"))
	var/KeyLocation=SubList.Find(src.key,1,0)
	if(KeyLocation)
		var/ExpDate=SubList[KeyLocation+1]
		var/Converted=copytext(ExpDate,7,9)+copytext(ExpDate,1,3)+copytext(ExpDate,4,6)
		var/ExpDateNum=text2num(Converted)
		if(ExpDateNum-CurrentDate>0)
			src<<"You are a Zeus Games VIP"
			//src<<"Your Donator Status Expires on: [ExpDate]"
			//src<<"Current Date: [time2text(world.timeofday,"MM-DD-YY")]"
		else
			src<<"Your VIP status to Zeus Games Expired on [ExpDate]"
			src<<"Current Date: [time2text(world.timeofday,"MM-DD-YY")]"
			src<<{"<a href="http://162.243.95.178/subscribe.html">Click here to Donate again!</a>"}
	else
		src<<"You are not a Zeus Games VIP"
		src<<{"<a href="http://162.243.95.178/subscribe.html">Click here to become a VIP today!</a>"}
	src<<""


mob/verb/View_Donators()
	set hidden=1
	var/text="<center><body bgcolor=gray><table bgcolor=gray border=1 bordercolor=black>"
	text+="<tr><td colspan=2><center><b>Donator List</b><br>[SubList.len/2] Total Donators"
	text+="<tr><td>Current Date<td>[time2text(world.timeofday,"MM-DD-YY")]"
	text+="<tr><td><b>Key<td><center><b>Expires<tr>"
	var/KeyLink="";var/OnName=0
	for(var/t in SubList)
		OnName=!OnName
		if(OnName)	KeyLink="[t]"
		else	text+="<td>[KeyLink]	<td>[t]<tr>"
	usr<<browse("[text]","window=ViewDonators")

proc/AsciiCheck(var/t as text)
	var/counter=0
	while(counter<=length(t)-1)
		counter+=1
		var/AscVal=text2ascii(t,counter)
		if(AscVal>=48 && AscVal<=57)	continue//checks if its a number 0-9
		if(AscVal>=65 && AscVal<=90)	continue//checks if its a letter A-Z
		if(AscVal>=97 && AscVal<=122)	continue//checks if its a letter a-z
		if(AscVal==32)	continue//checks if its a space
		usr<<"Characters A-Z, 0-9, and Spaces Only!"
		return null
	return t