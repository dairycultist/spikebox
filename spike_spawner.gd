extends Node2D

var SPIKE = preload("res://spike/spike.tscn")

func _ready() -> void:
	Pulse.pulse.connect(on_pulse)

func on_pulse(i):
	
	if i == -1:
		
		for spike in get_children():
			remove_child(spike)
			spike.queue_free()
	
	if i == 0:
		
		modulate = Color(1.0, 1.0, 1.0)
		
		for spike in get_children():
			spike.get_node("Collider").disabled = false
		
	elif i == 1:
		
		modulate = Color(0.3, 0.3, 0.3)
		
		# delete previous spikes
		for spike in get_children():
			remove_child(spike)
			spike.queue_free()
		
		# spawn new spikes
		for n in range(0, 4):
			var spike = SPIKE.instantiate()
			add_child(spike)
			spike.position.x = RandomNumberGenerator.new().randi_range(-60, 60)
