extends AudioStreamPlayer2D

var HIGH = preload("res://pulse_sound/high.wav")
var LOW = preload("res://pulse_sound/low.wav")

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
