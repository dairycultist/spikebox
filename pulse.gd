extends Node

signal pulse

var bpm := 80 # 80 lowest, 180 highest

var _secs_to_next_pulse := 60.0 / bpm
var _pulse_index := -1

func pause():
	
	_pulse_index = -1
	
	if bpm < 180:
		bpm += 5
		
		if bpm < 120:
			bpm += 5

func play():
	_pulse_index = 0

func _process(delta: float) -> void:
	
	_secs_to_next_pulse -= delta
	
	if (_secs_to_next_pulse <= 0.0):
		
		pulse.emit(_pulse_index)
		_secs_to_next_pulse = 60.0 / bpm
		
		if _pulse_index != -1:
			
			_pulse_index = (_pulse_index + 1) % (3 if Modifier.waltz else 4)
		
			if Modifier.no_rhythm:
				_secs_to_next_pulse *= RandomNumberGenerator.new().randf_range(0.5, 1.2)
