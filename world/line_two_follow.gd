extends PathFollow2D

var count = 0
var limit = 10

var enemy_tscn = preload("res://Enemy/dandon_2/dandon2.tscn")
@onready var line_two_timer: Timer = $line_two_timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_line_two_timer_timeout() -> void:
	print("Line Two")
	
	var enemy_instance = enemy_tscn.instantiate()
	enemy_instance.rotation_degrees = 180
	add_child(enemy_instance)
	count += 1;

	if count >= limit:
		line_two_timer.stop()
	pass # Replace with function body.
