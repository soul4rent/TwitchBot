require 'socket'

TWITCH_HOST = "irc.twitch.tv"
TWITCH_PORT = 6667

class TBot

	def initialize
		@nickname = "InsertBotNicknameHere"
		@password = "OATH TOKEN HERE"
		@channel = "CHANNEL HERE"
		@socket = ""
	end
end