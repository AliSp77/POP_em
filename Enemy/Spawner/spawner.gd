extends Node2D
class_name Spawner

signal FinishedSpawning()

const	normal_enemy = preload("res://Enemy/Scenes/normal-enemy.tscn")
const	tank_enemy = preload("res://Enemy/Scenes/tank_enemy.tscn")
const	fast_enemy = preload("res://Enemy/Scenes/fast_enemy.tscn")

@onready var spawn_timer: Timer = $SpawnTimer

var max_spawn: int: get = getting_number_of_enemies
var count: int = 0
var spawn_position := []
var enemies: Array[PackedScene] = [normal_enemy, tank_enemy, fast_enemy]

func _ready() -> void:
	var childs = get_children()
	for child in childs:
		if child is Marker2D:
			spawn_position.append(child.global_position)
	#spawn_timer.wait_time = WaveController.start_timer
	#spawn_timer.connect("timeout", spawning)

func spawning():
	var rand_indx = randi_range(0, spawn_position.size()-1)
	var rand_indx_enemy = randi_range(0, enemies.size()-1)
	if count >= max_spawn:
		spawn_timer.stop()
		FinishedSpawning.emit()
		return
	var new_enemy = enemies[rand_indx_enemy].instantiate()
	new_enemy.global_position = spawn_position[rand_indx]
	EnemyManager.register_enemy(new_enemy)
	get_parent().add_child(new_enemy)
	count += 1
	pass

func level_manager():
	count = 0
	max_spawn = WaveController.current_enemy_count
	print(WaveController.current_enemy_count)
	#LevelChange.emit(max_spawn)
	spawn_timer.start()

func getting_number_of_enemies():
	return WaveController.current_enemy_count
