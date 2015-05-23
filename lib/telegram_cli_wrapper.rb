require 'telegram_cli_wrapper/version'
require 'json'
require 'socket'

class TelegramCliWrapper

  def initialize port: 2392, host: 'localhost', verbose: false
    @socket = TCPSocket.new host, port
    @vebose = verbose
  end

  def exec command
    @socket.puts command
    while str = @socket.gets
      puts "SOCKET READ #{str}" if @vebose
      if str != '\n' && !str['ANSWER']
        return JSON.parse str
      end
    end
  end

  def contacts
    exec 'contact_list'
  end

  def dialogs
    exec 'dialog_list'
  end

  def unread_messages
  end

  def send_message user, text
  end

end
