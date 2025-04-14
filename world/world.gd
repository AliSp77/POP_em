extends Node2D

@onready var area_2d: Area2D = $Finishline

var check_spawn_enemy: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if get_tree().get_nodes_in_group("enemies").size() == 3:
		check_spawn_enemy = true
	if get_tree().get_nodes_in_group("enemies").size() == 0 and check_spawn_enemy:
		get_node("player").animation.play("jump")
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://win.tscn")

func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().paused = true
	get_tree().change_scene_to_file("res://game_over.tscn")
