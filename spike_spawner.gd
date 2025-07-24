extends Node2D

var SPIKE = preload("res://spike/spike.tscn")
var SPIKE_TALL = preload("res://spike/spike_tall.tscn")

func _ready() -> void:
	Pulse.pulse.connect(on_pulse)

func _process(delta: float) -> void:
	
	if Modifier.conveyor:
		
		for spike in get_children():
			
			spike.position.x += 15.0 * delta * spike.get_meta("direction", 1)
			
			if abs(spike.position.x) >= 60:
				spike.set_meta("direction", -spike.get_meta("direction", 1))

func on_pulse(i):
	
	if i == -1:
		
		for spike in get_children():
			
			remove_child(spike)
			spike.queue_free()
	
	if i == 0:
		
		if Modifier.mirror:
			
			position.y = 60
			scale.y = 1
		
		modulate = Color(1.0, 1.0, 1.0)
		
		for spike in get_children():
			
			spike.get_node("Collider").disabled = false
		
	elif i == 1:
		
		if Modifier.mirror:
			position.y = -60
			scale.y = -1
		
		modulate = Color(0.3, 0.3, 0.3)
		
		# delete previous spikes
		for spike in get_children():
			
			remove_child(spike)
			spike.queue_free()
		
		# spawn new spikes
		for n in range(0, 4):
			
			var spike = SPIKE_TALL.instantiate() if Modifier.ate_their_veggies else SPIKE.instantiate()
			add_child(spike)
			spike.position.x = RandomNumberGenerator.new().randi_range(-60, 60)
			
			if Modifier.conveyor:
				spike.set_meta("direction", RandomNumberGenerator.new().randi_range(0, 1) * 2 - 1)
	
	elif i == 2:
		
		if Modifier.good_memory:
			modulate = Color(0.0, 0.0, 0.0) if Modifier.waltz else Color(0.15, 0.15, 0.15)
	
	elif i == 3:
		
		if Modifier.good_memory:
			modulate = Color(0.0, 0.0, 0.0)
