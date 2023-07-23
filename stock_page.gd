extends Node2D

var player_cash = 500
var player_stocks = 0
var day = 1
#3rd value should be +6
var market = [0, +10, +6, +1, -4, -2, -1, -1, -1, +1, -3, +2, +7, +9, +4, +0, -4, -8, -5, -8, -7, -5, -9, -10, -6]
var stock_price = 100
var m_value = 0
var next_m_value = 1
var d = 0
var username = ""
var final_score = 0

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
		
	
