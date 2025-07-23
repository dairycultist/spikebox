extends AudioStreamPlayer2D

# maybe rename to pulse_sound idk

var HIGH = preload("res://ping/high.wav")
var LOW = preload("res://ping/low.wav")

func _ready() -> void:
	Pulse.pulse.connect(on_pulse)

func on_pulse(i):
	
	if i == 0:
		stream = HIGH
	else:
		stream = LOW
	
	play()

func _exit_tree() -> void:
	Pulse.pulse.disconnect(on_pulse)
