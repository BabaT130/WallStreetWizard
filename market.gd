extends Label

func _process(delta):
	if Global.day < 24:
		text = "Day " + str(Global.day)
		$AnimationPlayer.play("transition")
	elif Global.day == 24:
		text = "Last Day"
		add_theme_font_size_override("font_size", 100)
		$AnimationPlayer.play("transition")
func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://stock_page.tscn")
