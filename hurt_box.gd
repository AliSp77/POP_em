extends Area2D
class_name HurtBox

signal DamageTaken(damage: int)
signal HealthDepleted
	
@export var health: int

func _ready() -> void:
	connect("area_entered", on_are_entered)

func on_are_entered(hitbox: HitBox) -> void:
	if hitbox != null:
		health -= hitbox.damage
		#print(health.health)
		DamageTaken.emit(hitbox.damage)
		if health <= 0:
			HealthDepleted.emit()
