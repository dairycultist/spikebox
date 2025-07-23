extends Node

signal pulse

var secs_to_next_pulse := 0.75
var pulse_index := 1

func _process(delta: float) -> void:
	
	secs_to_next_pulse -= delta
	
	if (secs_to_next_pulse <= 0.0):
		
		pulse.emit(pulse_index)
		pulse_index = (pulse_index + 1) % 4
		secs_to_next_pulse = 0.75
