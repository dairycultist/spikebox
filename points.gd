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
	
	# save both latest score and highscore
	var prev_highscore := 0
	
	# get previous highscore if it exists
	if FileAccess.file_exists("user://points.txt"):
		
		var load_file = FileAccess.open("user://points.txt", FileAccess.READ)
		
		load_file.get_line() # dump last score
		prev_highscore = int(load_file.get_line())
	
	# save
	var save_file = FileAccess.open("user://points.txt", FileAccess.WRITE)
	
	save_file.store_line(str(_points))
	save_file.store_line(str(max(_points, prev_highscore)))
	
	_points = -1
