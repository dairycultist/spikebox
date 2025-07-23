extends Node2D

@export var move_speed := 110.0
@export var jump_speed := 2.2
@export var gravity := 8.0

var vertical_velocity := 0.0

func _ready() -> void:
	$Body.body_entered.connect(on_body_entered)

func _process(delta: float) -> void:
	
	if Input.is_action_pressed("move_left"):
		position.x -= move_speed * delta
	elif Input.is_action_pressed("move_right"):
		position.x += move_speed * delta
	
	if Input.is_action_pressed("jump") and position.y > 58.0 and not Modifier.fatass:
		vertical_velocity = -jump_speed
	
	vertical_velocity += gravity * delta
	
	position.y += vertical_velocity
	
	position.x = clamp(position.x, -60, 60)
	position.y = clamp(position.y, -60, 60)

func on_body_entered(body) -> void:
	
	if body.is_in_group("Deadly"):
		
		# lose
		Pulse.reset()
		Points.save_and_reset()
		get_tree().call_deferred("change_scene_to_file", "res://scenes/title.tscn")
