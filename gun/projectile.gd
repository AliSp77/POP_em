extends Node2D
class_name Projectile


const SPEED: int = 300
var direction_hit: int = 1

func _process(delta: float) -> void:
	position += direction_hit * transform.x * SPEED * delta
