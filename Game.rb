class Draw_Board

	attr_accessor :grid, :turna, :turn, :win_Grid, :rem_turns, :win

	def initialize()
		@turna = [1,2]
		@Player_Score = [0,0]
		@win_Grid = [
			["u3", "m2", "l1"],
			["u1", "m2", "l3"],
			["u1", "u2", "u3"],
			["m1", "m2", "m3"],
			["l1", "l2", "l3"],
			["u1", "m1", "l1"],
			["u2", "m2", "l2"],
			["u3", "m3", "l3"],
    ]
    contineu()
	end

	def contineu()
		@win = false
		@rem_turns = 24
		@turn = 0
		@input = ""
		@grid = {
		  "u1" => "-", "u2" => "-", "u3" => "-",
			"m1" => "-", "m2" => "-", "m3" => "-",
			"l1" => "-", "l2" => "-", "l3" => "-"
		}
		puts " "
		puts " "
		puts '       ######################'
		puts  '             TIC TAC TOE' 
		puts  '            2-PLAYERS GAME'
		puts '       ######################'
		puts " "
		puts " "
		turnUpd()
		draw_game_positions()
		Draw()
	end

  def turnUpd()
    
		@rem_turns -= 1
		unless turn == turna[0]
			@turn = turna[0]
		else
			@turn = turna[1]
		end
	end
	def Draw()
		
		if @rem_turns >= 0 and @win == false

			puts " Making a change to Git"
			puts " "
			puts "-------------------------------------------"
			puts "-------------------------------------------"
			puts "     Please Enter your 2-digit choice"
			puts "     e.g: u1 u2 u3"
			puts "          m1 m2 m3"
			puts "          l1 l2 l3"
			puts "     OR TYPE 'Q' TO QUIT THE GAME"
			puts "-------------------------------------------"
			puts "-------------------------------------------"
			puts "Enter >"
			@input = gets.chomp.downcase
			if @input.length == 2 
				#puts @input.length
				if @grid.key?(@input)
          #Correct INPUT
          if @grid[@input] == "-"
            if(@turn == 1)
              @grid[@input] = "1"	  
            else    
              @grid[@input] = "2"	
            end
            turnUpd()
            check_win()
            Draw()
          else
            puts "-----------------------------------------------"
            puts "Already taken -- Please Choose Another Position"
            puts "-----------------------------------------------"
            Draw()
          end
				else
					puts "Wrong Input"
					Draw()
				end
			elsif @input == "q"
				puts "#############     GAME END     #############"
			else
				puts "Wrong Input"
				Draw()
			end
				
		else
			if @win == true
				@turn = @turn == 1 ? 2 : 1

				indx = @turn == 1 ? 0 : 1
				@Player_Score[indx] += 1

				puts "-----------------------------------------------"
				puts " Congratulations Player #{@turn} --  YOU are WINNER"
				puts "-----------------------------------------------"
			else
				puts "-----------------------------------------------"
				puts "                GAME TIE"
				puts "-----------------------------------------------"
			end

			puts " *** SCORE BOARD *** "
			puts "PLAYER - 1 [ #{@Player_Score[0]} ] || PLAYER - 2 [ #{@Player_Score[1]} ]"
			puts " "
			puts " Press ANY KEY to CONTINEU OR Press 'Q' to QUIT"
			puts " "
			puts "Enter > "
			@input = gets.chomp.downcase

			if @input == "q"
				puts "#######  YOU CHOOSE TO END THE GAME  #######"
			else
				contineu()
			end
		end

	end

	def check_win()

		draw_game_positions()
		@win_Grid.each do |row|

			if (@grid[row[0]] == @grid[row[1]]) and (@grid[row[1]] == @grid[row[2]]) and @grid[row[1]] != "-"
				#puts "WWWWWIIIIINNNNNN"
				@win = true
			end
			
		end

	end

	def draw_game_positions()
		
		puts "###############-Player #{@turn}'s turn-###############"
		puts "1    #{@grid["u1"]}   #{@grid["u2"]}   #{@grid["u3"]}"
		puts " "
		puts "2    #{@grid["m1"]}   #{@grid["m2"]}   #{@grid["m3"]}"
		puts " "
		puts "3    #{@grid["l1"]}   #{@grid["l2"]}   #{@grid["l3"]}"
		puts "############################################"

	end
end

dr = Draw_Board.new()
#dr.fun()
#Draw_Board.fun()


