extends PathFollow2D

var count = 0
var limit = 12

var enemy_tscn = preload("res://Enemy/enemy.tscn")

@onready var line_three_timer: Timer = $line_three_timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_line_three_timer_timeout() -> void:
	print("Line Three")
	
	var enemy_instance = enemy_tscn.instantiate()
	
	add_child(enemy_instance)
	count += 1;

	if count >= limit:
		line_three_timer.stop()
	pass # Replace with function body.
