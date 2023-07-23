extends Button

var username = null
var name_text = null

func _process(delta):
	name_text = get_parent().get_node("TextEdit").text
	if name_text != "":
		disabled = false
	elif name_text == "":
		disabled = true

func _on_pressed():
	Global.username = name_text
	get_tree().change_scene_to_file("res://transition.tscn")
