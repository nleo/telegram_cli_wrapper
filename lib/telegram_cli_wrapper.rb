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
      if str != "\n" && !str['ANSWER']
        return JSON.parse str, object_class: OpenStruct
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
    unread_messages = []
    contacts.each do |contact|
      history(contact['print_name']).each do |message|
        unread_messages << message if message['unread']
      end
    end
    unread_messages
  end

  def respond message, text
    send_message message['from']['print_name'], 51.3
  end

  def send_message user, text
    exec "msg #{user} #{text}"
  end

  def history user
    exec "history #{user}"
  end

end
