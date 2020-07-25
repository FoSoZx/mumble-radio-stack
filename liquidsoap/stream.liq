set("log.file",false)
set("log.stdout",true)
#set("log.level",3)
#set("server.telnet",true)

#source = single("/home/liquidsoap/test.mp3")

source = input.alsa(device="hw:CARD=Loopback,DEV=1", bufferize=false)

#	%wav(mono, samplerate=22050, header=true),

#	%mp3(mono, samplerate=22050, bitrate=32),

#	%vorbis(quality=0.3, samplerate=22050, channels=1),

#	%vorbis.cbr(bitrate=32, samplerate=22050, channels=1),		# ~ 10 sec delay

#	%ogg(%flac(samplerate=22050, channels=1, compression=5, bits_per_sample=8)),

#	%opus(mono, max_bandwidth=medium_band, samplerate=16000),

#	%opus(mono, application="voip", complexity=1),			# 6.5 sec

#	%opus(mono, application="restricted_lowdelay", vbr="none"),	# 7.7 sec

#	%opus(mono, complexity=0, vbr="none"),				# 11.30 sec

#	%opus(mono, application="voip"),				#

output.icecast(
	%opus(mono, application="voip", vbr="none", complexity=1),				# 6.5 sec
	host="icecast",
	port=8000,
	password=getenv("ICECAST_PASSWORD"),
	fallible=true,
	mount="/relay.opus",
	mean(source)
)

#    (source:source(1,0,0))	)
