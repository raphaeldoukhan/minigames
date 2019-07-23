require 'pry'
require 'rubocop'

class Player
    attr_accessor :name
    attr_accessor :life_points

    def initialize(name)
        @name = name
        @life_points = 10 
    end

    def show_state     
        puts "#{name} a #{life_points} points de vie"   
    end
   
    def gets_damage(damage_received)
        @life_points = @life_points - damage_received
        
            if @life_points <= 0
                puts "le joueur #{@name} a été tué !" 
            end
        end
        
        
    def attacks(player)
        puts "le joueur #{@name} attaque le joueur #{player.name}!"
        damage_received = compute_damage
        player.gets_damage(damage_received)
        puts "il lui inflige #{damage_received} points de dommages"

    end 
    
    def compute_damage
        return rand(1..6)
    end     

end  

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @life_points = 100
        @weapon_level = 1 
        end

    def show_state    
        puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
    end
    
    def compute_damage
        rand(1..6) * @weapon_level
    end 

    def search_weapon
        r = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{r}"

        if r > @weapon_level
                @weapon_level = r
                puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
            else 
                "M@*#$... elle n'est pas mieux que ton arme actuelle...tu ne la prends pas"
        end        
    end

    def search_health_pack
        r = rand(1..6)
        
        if r = 1
                puts "Tu n'as rien trouvé... "
            elsif r>= 2 && r<=5 
                @life_points = @life_points + 50
                    if @life_points > 100
                        @life_points = 100
                    end    
                puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            elsif r = 6 
                @life_points = @life_points + 80
                    if @life_points > 100
                        @life_points = 100
                    end    
                puts "Waow, tu as trouvé un pack de +80 points de vie !"

        end


    end

end