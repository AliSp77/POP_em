extends Node2D

@onready var area_2d: Area2D = $Finishline
@onready var enemy_count: Label = $"CanvasLayer2/TextureRect/Enemy Count"
@onready var spawner: Spawner = $Spawner
@onready var canvas_layer_2: CanvasLayer = $CanvasLayer2

var max_enemies: int
var check_spawn_enemy: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioPlayer.normal_theme()
	WaveController.LevelChange.connect(_on_level_change)
	PausedMenu2.PauseState.connect(_on_pause_pressed)
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

func _on_level_change(value):
	print("go hide bitch")
	canvas_layer_2.hide()
	await get_tree().create_timer(5).timeout
	canvas_layer_2.show()

func _on_pause_pressed(value):
	if value:
		canvas_layer_2.hide()
	else:
		canvas_layer_2.show()
