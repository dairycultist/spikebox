extends Node

signal pulse

var bpm := 80 # 80 lowest, 180 highest

var secs_to_next_pulse := 60.0 / bpm
var pulse_index := 1

func _process(delta: float) -> void:
	
	secs_to_next_pulse -= delta
	
	if (secs_to_next_pulse <= 0.0):
		
		pulse.emit(pulse_index)
		pulse_index = (pulse_index + 1) % 4
		secs_to_next_pulse = 60.0 / bpm
