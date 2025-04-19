extends Node2D
class_name Spawner

signal LevelChange(max_spawn)

const	normal_enemy = preload("res://Enemy/Scenes/normal-enemy.tscn")
const	tank_enemy = preload("res://Enemy/Scenes/tank_enemy.tscn")
const	fast_enemy = preload("res://Enemy/Scenes/fast_enemy.tscn")

@export var max_spawn: int = 10
var count: int = 0
var spawn_position := []
@onready var spawn_timer: Timer = $SpawnTimer
var enemies: Array[PackedScene] = [normal_enemy, tank_enemy, fast_enemy]
var level_counter: int = 1

func _ready() -> void:
	var childs = get_children()
	for child in childs:
		if child is Marker2D:
			spawn_position.append(child.global_position)
	spawn_timer.connect("timeout", spawning)
	level_manager()

func spawning():
	var rand_indx = randi_range(0, spawn_position.size()-1)
	var rand_indx_enemy = randi_range(0, enemies.size()-1)
	print("pre spawn")
	if count >= max_spawn:
		spawn_timer.stop()
		await get_tree().create_timer(5).timeout
		level_counter += 1
		level_manager()
		return
	var new_enemy = enemies[rand_indx_enemy].instantiate()
	new_enemy.global_position = spawn_position[rand_indx]
	EnemyManager.register_enemy(new_enemy)
	get_parent().add_child(new_enemy)
	count += 1
	pass

func level_manager():
	count = 0
	print("LEVEL: ", level_counter)
	max_spawn = level_counter * 5
	print("Enemy count: ", max_spawn)
	LevelChange.emit(max_spawn)
	spawn_timer.start()
