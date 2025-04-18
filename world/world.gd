extends Node2D

@onready var area_2d: Area2D = $Finishline
@onready var enemy_count: Label = $"CanvasLayer2/TextureRect/Enemy Count"
@onready var spawner: Spawner = $Spawner

var max_enemies: int
var check_spawn_enemy: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioPlayer.normal_theme()
	spawner.LevelChange.connect(LevelNumber)
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#if get_tree():
		#if get_tree().get_nodes_in_group("enemies").size() > 0:
			#check_spawn_enemy = true
		#if get_tree().get_nodes_in_group("enemies").size() == 0 and check_spawn_enemy:
			#get_node("player").animation.play("jump")
			#await get_tree().create_timer(2).timeout
			#get_tree().change_scene_to_file("res://win.tscn")
	

	enemy_count.text = str(max_enemies - spawner.count)


func _on_area_2d_body_entered(_body: Node2D) -> void:
	get_tree().paused = true
	get_tree().change_scene_to_file("res://game_over.tscn")

func LevelNumber(value):
	max_enemies = value
