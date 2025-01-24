extends Area2D
class_name HurtBox

signal DamageTaken(damage: int)
	
@export var health: Health

func _ready() -> void:
	connect("area_entered", on_are_entered)
	
func on_are_entered(hitbox: HitBox) -> void:
	if hitbox != null:
		health.health -= hitbox.damage
		DamageTaken.emit(hitbox.damage)
		print("ouch")
	
