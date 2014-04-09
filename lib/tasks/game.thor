require 'highline/import'
require './config/environment'

class Game < Thor
  desc "play", "Play a game of Hangman"
  method_option :category, :aliases => "-c", :desc => "Specifies the word category to use in this game"
  method_option :rounds, :aliases => "-r", :desc => "Specifies the number of rounds in this game"
  def play
    system 'clear'
    puts %Q{
       _ _                                 
      | | | ___ ._ _  ___ ._ _ _  ___ ._ _ 
      |   |<_> || ' |/ . || ' ' |<_> || ' |
      |_|_|<___||_|_||_. ||_|_|_|<___||_|_|
                     <___'     
    }

    unless category = options[:category]
      HighLine.choose do |menu|
        menu.prompt = "Which category would you like to play?"
        menu.choices(:countries, :cities, :food) do |c|
          category = c
        end
      end
    end

    unless rounds = options[:rounds]
      rounds = HighLine.ask("How many rounds do you want to play? ", Integer) { |q| q.in = 1..10 }
    end

    puts "You will have to guess #{rounds} #{category} words!"

    # age = HighLine.ask("Age? ", Integer) { |q| q.in = 0..105 }
    # puts "Age: #{age}"

    # password = HighLine.ask("Enter your password: ") { |q| q.echo = false }
    # puts "Your password is #{password}"

    # w = Word.find_or_create_by(name: 'Hello')
    # puts "Word: #{w.name}"
  end
end

            