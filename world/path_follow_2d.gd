extends PathFollow2D

var speed = 0.1

var enemy_scene = preload("res://Enemy/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_ratio = delta * speed
	pass

func _on_enemy_timer_one_timeout() -> void:
	print("Timer Line One?")
	var enemy_instance = enemy_scene.instantiate()
	
	add_child(enemy_instance)
	pass # Replace with function body.


func _on_enemy_timer_two_timeout() -> void:
	print("Timer Line Two?")
	var enemy_instance = enemy_scene.instantiate()
	
	add_child(enemy_instance)
	pass # Replace with function body.
