class WrongNumberOfPlayersError < StandardError ; end
class WrongNumberOfBracketsError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	raise NoSuchStrategyError unless game[0][1] =~ /[spr]/i and game[1][1] =~ /[spr]/i

	winner = case game[0][1]
	when /s/i then
		if(game[1][1] =~ /r/i)
			return game[1]
		else
			return game[0]
		end
	when /p/i then
		if(game[1][1] =~ /s/i)
			return game[1]
		else
			return game[0]
		end
	when /r/i then
		if(game[1][1] =~ /p/i)
			return game[1]
		else
			return game[0]
		end
	end
end

def rps_tournament_winner (tournament)
	raise WrongNumberOfBracketsError unless tournament.length == 2

	bracket1_winner = []
	bracket2_winner = []

	tournament[0].each do |match|
		bracket1_winner << rps_game_winner(match)
	end

	while(bracket1_winner.length > 1)
		bracket1_winner << rps_game_winner([bracket1_winner.shift,bracket1_winner.shift])
	end

	tournament[1].each do |match|
		bracket2_winner << rps_game_winner(match)
	end

	while(bracket2_winner.length > 1)
		bracket2_winner << rps_game_winner([bracket2_winner.shift,bracket2_winner.shift])
	end

	return rps_game_winner([bracket1_winner[0],bracket2_winner[0]])
end

tournament = [
	[
		[ ["Armando", "P"], ["Dave","S"] ],
		[ ["Richard", "R"], ["Michael", "S"] ],
	],
	[
		[ ["Allen", "S"], ["Omer", "P"] ],
		[ ["David E.", "R"], ["Richard X.", "P"] ]
	]
]

puts rps_tournament_winner(tournament)