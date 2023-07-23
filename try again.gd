extends Button

func _on_pressed():
	Global.day = 1
	Global.d = 0
	Global.m_value = Global.market[Global.d]
	Global.next_m_value = Global.market[int(Global.d) + 1]
	Global.stock_price += Global.m_value
	get_tree().change_scene_to_file("res://main.tscn")
