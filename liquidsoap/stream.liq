set("log.file",false)
set("log.stdout",true)

source = input.alsa(device="hw:CARD=Loopback,DEV=1", bufferize=false)

output.icecast(
	%opus(mono, application="voip", vbr="none", complexity=1),
	host="icecast",
	port=8000,
	password=getenv("ICECAST_PASSWORD"),
	fallible=true,
	mount="/stream.opus",
	mean(source)
)
