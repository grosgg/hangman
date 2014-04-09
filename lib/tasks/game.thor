require 'highline/import'
require './config/environment'

class Game < Thor
  desc "example", "example task"
  def example
    puts 'Haiyo haiyo!'

    # age = HighLine.ask("Age? ", Integer) { |q| q.in = 0..105 }
    # puts "Age: #{age}"

    # password = HighLine.ask("Enter your password: ") { |q| q.echo = false }
    # puts "Your password is #{password}"

    # w = Word.find_or_create_by(name: 'Hello')
    # puts "Word: #{w.name}"
  end
end