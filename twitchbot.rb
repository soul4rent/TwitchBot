#following Always be Coding tutorial for intial setup

require 'socket'

#global variables for host/port
TWITCH_HOST = "irc.twitch.tv"
TWITCH_PORT = 6667 #default IRC port

class TBot

	#everytime a twitch bot is istantiated, authenticates it
	def initialize
		@nickname = "InsertBotNicknameHere" #chatroom bot nickname
		@password = "OATH TOKEN HERE" #generated by twitch
		@channel = "CHANNEL HERE" #channel of active account
		@socket = TCPSocket.open(TWITCH_HOST, TWITCH_PORT)


		#authentication
		write_sys "PASS #{@password}"
		write_sys "NICK #{@nickname}"
		write_sys "USER #{@nickname} @ * #{@nickname}"
		write_sys "JOIN ##{@channel}"
	end

	def write_sys(m) #various TCP commands
		@socket.puts m
	end

	def write_chat(m) #uses write_sys to write to the chat IRC
		write_sys "PRIVMSG ##{@channel} : #{message}"
	end

	#gets messages from IRC and prints them to the console
	def run
		until @socket.eof? do
			message = @socket.gets
			puts message
		end
	end

end
