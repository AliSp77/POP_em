extends Node2D
class_name Projectile

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D

const SPEED: int = 200
var direction_hit: int = 1

func ColorChange(color_value: Color):
	sprite_2d.modulate = color_value

func _process(delta: float) -> void:
	position += direction_hit * transform.x * SPEED * delta
	if position.x > 150 : 
		queue_free()
	if position.x <= 120:
		var random_number = randf_range(-1, 1)
		position.y += random_number
		clamp(position.y, position.y-1, position.y)
	elif position.x > 120:
		var random_number = randf_range(-5, 5)
		position.y += random_number
		clamp(position.y, position.y-4, position.y)
