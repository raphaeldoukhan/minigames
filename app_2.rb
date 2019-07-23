require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts "Donne un prénom à ton personnage"
print "> "
player_name = gets.chomp
player = HumanPlayer.new("#{player_name}")
bot1 = Player.new("Josiane")
bot2 = Player.new("José")
enemies = [bot1 , bot2]
tour = 0

puts "Passons à la phase d'attaque :"
while (bot1.life_points > 0 || bot2.life_points > 0) && player.life_points > 0
  tour += 1
  puts "\n"
  puts "------Tour #{tour}------"
  puts "\n"
  player.show_state
  puts "Quelle action veux-tu effectuer ?"
  puts "\n"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  puts "\n"
  puts "Attaquer un joueur en vue :"
  enemies.each_with_index do |enemie, index|
    if enemie.life_points > 0
      puts "#{index} - #{enemie.show_state}"
    end
  end
  print "> "

  action = gets.chomp
  if action == "a"
    player.search_weapon
  elsif action == "s"
    player.search_health_pack
  elsif action == "0"
    player.attacks(bot1)
  elsif action == "1"
    player.attacks(bot2)
  else
    puts "Tu n'as réalisé aucune action !"
  end
  
  puts "\n"
  puts "Les autres joueurs t'attaquent !"
  enemies.each do |enemie|
    if enemie.life_points > 0
      enemie.attacks(player) 
    end
  end
end
puts "\n"
puts "La partie est finie"
if player.life_points > 0
  puts  "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !" 
end