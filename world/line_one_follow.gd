extends PathFollow2D

@onready var enemy_timer_one: Timer = $enemy_timer_one

var enemy_tscn = preload("res://Enemy/enemy.tscn")

var count = 0
var limit = 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_enemy_timer_one_timeout() -> void:
	print("Line One")
	
	var enemy_instance = enemy_tscn.instantiate()
	
	add_child(enemy_instance)
	count += 1;
	
	if count >= limit:
		enemy_timer_one.stop()
	pass # Replace with function body.
