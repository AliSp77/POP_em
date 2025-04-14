extends PathFollow2D

@onready var enemy_timer_one: Timer = $enemy_timer_one

var enemy3_tscn = preload("res://Enemy/dandon_3/dandon3.tscn")
var enemy1_tscn = preload("res://Enemy/Dandon1/dandon1.tscn")
var enemy2_tscn = preload("res://Enemy/dandon_2/dandon2.tscn")

var enemies = [preload("res://Enemy/Dandon1/dandon1.tscn"),
preload("res://Enemy/dandon_2/dandon2.tscn"),
preload("res://Enemy/dandon_3/dandon3.tscn")]

var speed = 0.1

var count = 0
var limit = 0
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#enemies.append(enemy1_tscn)
	#enemies.append(enemy2_tscn)
	#enemies.append(enemy3_tscn)
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_ratio = speed * delta
	pass

func _on_enemy_timer_one_timeout() -> void:
	print("Line One")
	
	var index = randi() % 3
	var chosenEnemy = enemies[index];
	
	var enemy_instance = chosenEnemy.instantiate()
	enemy_instance.rotation_degrees = 180
	
	add_child(enemy_instance)
	count += 1;

	if count >= limit:
		enemy_timer_one.stop()
	pass # Replace with function body.
