extends Control

var pulse_high_countdown := 5

var _choice_1_i : int
var _choice_2_i : int

func _ready() -> void:
	
	$Choice1.pressed.connect(pick_choice_1)
	$Choice2.pressed.connect(pick_choice_2)
	Pulse.pulse.connect(on_pulse)
	
	visible = false

func on_pulse(i):
	
	if i == 0:
		
		pulse_high_countdown -= 1
	
	if pulse_high_countdown <= 0:
		
		_choice_1_i = Modifier.get_random_disabled_modifier_index()
		_choice_2_i = Modifier.get_random_disabled_modifier_index()
		
		if _choice_1_i != -1 and _choice_2_i != -1:
		
			Pulse.pause()
			visible = true
			pulse_high_countdown = 10
			
			$Choice1.text = Modifier.get_modifier_text_via_index(_choice_1_i)
			$Choice2.text = Modifier.get_modifier_text_via_index(_choice_2_i)

func pick_choice_1():
	
	Modifier.enable_modifier_via_index(_choice_1_i)
	
	Pulse.play()
	visible = false

func pick_choice_2():
	
	Modifier.enable_modifier_via_index(_choice_2_i)
	
	Pulse.play()
	visible = false
