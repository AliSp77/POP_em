extends Node2D
class_name Spawner

const	normal_enemy = preload("res://Enemy/Scenes/normal-enemy.tscn")
const	tank_enemy = preload("res://Enemy/Scenes/tank_enemy.tscn")
const	fast_enemy = preload("res://Enemy/Scenes/fast_enemy.tscn")

@export var max_spawn: int = 10
var count: int = 0
var spawn_position := []
@onready var spawn_timer: Timer = $SpawnTimer
var enemies: Array[PackedScene] = [normal_enemy, tank_enemy, fast_enemy]

func _ready() -> void:
	var childs = get_children()
	for child in childs:
		if child is Marker2D:
			spawn_position.append(child.global_position)
	spawn_timer.start()
	spawn_timer.connect("timeout", spawning)

func spawning():
	var rand_indx = randi_range(0, spawn_position.size()-1)
	var rand_indx_enemy = randi_range(0, enemies.size()-1)
	if count >= max_spawn:
		spawn_timer.stop()
		return
	var new_enemy = enemies[rand_indx_enemy].instantiate()
	print(global_position)
	new_enemy.global_position = spawn_position[rand_indx]
	
	print(new_enemy.global_position)
	get_parent().add_child(new_enemy)
	count += 1
	print("spwamed")

	pass
