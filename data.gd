extends Label

func _process(delta):
	text = "Balance: $" + str(Global.player_cash) + """
	Stocks Owned: """ + str(Global.player_stocks) + """
	Net Worth: $""" + str(Global.player_cash + Global.player_stocks*Global.stock_price)
