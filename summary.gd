extends Label

var final_score = Global.player_cash + Global.player_stocks*Global.stock_price

func _ready():
	Global.final_score = final_score
	text = "Final Net Worth (Score): $" + str(final_score) + """
	Stocks Owned at End: """ + str(Global.player_stocks) + """
	
	Your Results are on the Leaderboard!"""
	
	
