extends Button

func _ready() -> void:
	
	pressed.connect(on_pressed)

func on_pressed():
	
	# start game
	Pulse.play()
	get_tree().change_scene_to_file("res://scenes/game.tscn")
