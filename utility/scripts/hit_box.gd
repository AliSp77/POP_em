extends Area2D
class_name HitBox

@export var damage: int : set = set_damage, get = get_damage

func set_damage(value):
	damage = value

func get_damage():
	return damage
