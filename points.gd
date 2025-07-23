extends Node

var _points := -1

func _ready() -> void:
	
	Pulse.pulse.connect(on_pulse)

func on_pulse(i):
	
	if i == 0:
		_points += Modifier.get_points_per_high_pulse()

func get_str() -> String:
	return str(_points)

func save_and_reset():
	print("Saving last score as " + str(_points) + " and highscore as XXX")
	_points = -1
