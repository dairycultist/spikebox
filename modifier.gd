extends Node

var mirror := false # spike shadows appear on the roof instead of the floor, but spikes still come from the floor
var ate_their_veggies := false # spikes are extra tall
var conveyor := false # spike shadows slowly drift
var fatass := false # no jumping
var good_memory := false # spike shadows slowly fade away
var waltz := false # spikes only take 3 ticks to appear
var no_rhythm := false # pulses aren't the same length

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
