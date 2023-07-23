extends Button

var random = RandomNumberGenerator.new()

func _on_pressed():
	random.randomize()
	var next = random.randi_range(0, 24)
	if Global.day < 24:
		Global.day += 1
		Global.d = next
		Global.m_value = Global.next_m_value
		Global.next_m_value = Global.market[next]
		Global.stock_price += Global.m_value
		get_tree().change_scene_to_file("res://transition.tscn")
	elif Global.day == 24:
		get_tree().change_scene_to_file("res://summary.tscn")
