extends Sprite2D

@onready var health: Health = $Health

func _process(delta: float) -> void:
	if health.health == 0:
		queue_free()
