extends PathFollow2D

var count = 0
var limit = 10

var enemy3_tscn = preload("res://Enemy/dandon_3/dandon3.tscn")
var enemy1_tscn = preload("res://Enemy/Dandon1/dandon1.tscn")
var enemy2_tscn = preload("res://Enemy/dandon_2/dandon2.tscn")

var enemies = []

@onready var line_two_timer: Timer = $line_two_timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemies.append(enemy1_tscn)
	enemies.append(enemy2_tscn)
	enemies.append(enemy3_tscn)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_line_two_timer_timeout() -> void:
	print("Line Two")
	
	var index = randi() % 3
	var chosenEnemy = enemies[index];
	
	var enemy_instance = chosenEnemy.instantiate()
	enemy_instance.rotation_degrees = 180
	
	add_child(enemy_instance)
	count += 1;

	if count >= limit:
		line_two_timer.stop()
	pass # Replace with function body.
