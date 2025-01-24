extends Node
class_name Health

@export var health = 10

signal HealthDepleted

func die():
	if health == 0:
		get_tree().quit()
