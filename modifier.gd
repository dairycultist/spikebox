extends Node

var mirror := false
var ate_their_veggies := false
var conveyor := false
var fatass := false
var good_memory := false
var waltz := false
var no_rhythm := false

var _disabled_modifier_indices = []

func _init() -> void:
	
	for i in range(7):
		_disabled_modifier_indices.push_back(i)

# returns -1 if there are none left
func get_random_disabled_modifier_index() -> int:
	return _disabled_modifier_indices.pick_random()

func get_modifier_text_via_index(i) -> String:
	
	match i:
		0: return "Mirror\nspike SHADOWS appear on the roof instead of the floor"
		1: return "Ate Their Veggies\nspikes are extra tall (not implemented)"
		2: return "Conveyor\nspike shadows slowly drift"
		3: return "Fatass\nno jumping"
		4: return "Good Memory\nspike shadows slowly fade away (not implemented)"
		5: return "Waltz\nspikes only take 3 pulses to appear"
		6: return "No Rhythm\npulses aren't the same length"
	
	return ""

func enable_modifier_via_index(i):
	
	# remove from disabled modifier pool
	for j in _disabled_modifier_indices.size():
		
		if _disabled_modifier_indices[j] == i:
			
			_disabled_modifier_indices.remove_at(j)
			break
	
	# enable modifier
	match i:
		0: mirror = true
		1: ate_their_veggies = true
		2: conveyor = true
		3: fatass = true
		4: good_memory = true
		5: waltz = true
		6: no_rhythm = true

func get_points_per_high_pulse() -> int:
	
	var points := 1
	
	if mirror:
		points += 2
	
	if ate_their_veggies:
		points += 2
	
	if conveyor:
		points += 3
	
	if fatass:
		points += 2
	
	if good_memory:
		points += 3
	
	if waltz:
		points += 3
	
	if no_rhythm:
		points += 2
	
	return points
