extends Camera2D

var zoom_base := 2.0

func _ready() -> void:
	
	Pulse.pulse.connect(on_pulse)

func _process(delta: float) -> void:
	
	zoom_base = get_viewport_rect().size.x / 400.0
	
	# rotation with movement
	var target_rot := 0.0
	
	if Input.is_action_pressed("move_left"):
		target_rot = deg_to_rad(15.0)
	elif Input.is_action_pressed("move_right"):
		target_rot = deg_to_rad(-15.0)
	
	rotation = lerp(rotation, target_rot, delta)
	
	# change size with pulse
	zoom.x = lerp(zoom.x, zoom_base, delta * 10.0)
	zoom.y = lerp(zoom.y, zoom_base, delta * 10.0)

func on_pulse(i):
	
	if (i == 0):
		zoom.x = zoom_base * 1.15
		zoom.y = zoom_base * 0.9
	else:
		zoom.x = zoom_base * 1.02
		zoom.y = zoom_base * 0.98
