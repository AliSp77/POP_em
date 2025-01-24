extends Area2D
class_name HurtBox

signal DamageTaken(damage: int)
	
@export var health: Health
var inv: bool = false
@onready var invulner: Timer = $"../invulner"

func _ready() -> void:
	connect("area_entered", on_are_entered)

func on_are_entered(hitbox: HitBox) -> void:
	if hitbox != null and not inv:
		health.health -= hitbox.damage
		print(health.health)
		DamageTaken.emit(hitbox.damage)
		inv = true
		invulner.start()

func _on_invulner_timeout() -> void:
	inv = false
