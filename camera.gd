extends Camera2D

func _ready() -> void:
	
	Pulse.pulse.connect(on_pulse)

func _process(delta: float) -> void:
	
	# rotation with movement
	var target_rot := 0.0
	
	if Input.is_action_pressed("move_left"):
		target_rot = deg_to_rad(15.0)
	elif Input.is_action_pressed("move_right"):
		target_rot = deg_to_rad(-15.0)
	
	rotation = lerp(rotation, target_rot, delta)
	
	# change size with pulse
	zoom.x = lerp(zoom.x, 2.0, delta * 10.0)
	zoom.y = lerp(zoom.x, 2.0, delta * 10.0)

func on_pulse(i):
	
	if (i == 0):
		zoom.x = 2.3
		zoom.y = 2.3
	else:
		zoom.x = 2.1
		zoom.y = 2.1
