extends Area2D
class_name HurtBox

signal DamageTaken(damage: int)
signal HealthDepleted
	
@export var health: int
@export var invulnerable_time: float
var invulnerable: bool = false: set = rest_time

func _ready() -> void:
	connect("area_entered", on_are_entered)

func on_are_entered(hitbox: HitBox) -> void:
	if not invulnerable:
		if hitbox != null:
			health -= hitbox.damage
			#print(health.health)
			DamageTaken.emit(hitbox.damage)
			invulnerable = true	
			if health <= 0:
				HealthDepleted.emit()

func rest_time(value):
	if value:
		get_tree().create_timer(invulnerable_time).timeout.connect(done_resting)
	invulnerable = value

func done_resting():
	invulnerable = false
