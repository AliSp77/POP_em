extends Node2D
class_name Projectile

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D

const SPEED: int = 200
var direction_hit: int = 1
var start_pos: float

var range: int = 80
var random_ness: int = 2
var random_range: int = 40

var power: Dictionary

func ColorChange(color_value: Color):
	sprite_2d.modulate = color_value

func _process(delta: float) -> void:
	position += direction_hit * transform.x * power["speed"] * delta
	if position.x * direction_hit > start_pos  + power["range"] : 
		queue_free()
	if position.x* direction_hit <= start_pos + power["random_range"]:
		var random_number = randf_range(-1, 1)
		position.y += random_number
		clamp(position.y, position.y-1, position.y)
	elif position.x* direction_hit > start_pos + power["random_range"]:
		var random_number = randf_range(-random_ness, random_ness)
		position.y += random_number
		clamp(position.y, position.y-random_ness, position.y)


func _on_hit_body_entered(body: Node2D) -> void:
	print(body)
	queue_free()
