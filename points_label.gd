extends RichTextLabel

func _ready() -> void:
	
	Pulse.pulse.connect(on_pulse)

func on_pulse(i):
	
	if i == 0:
		text = Points.get_str()
