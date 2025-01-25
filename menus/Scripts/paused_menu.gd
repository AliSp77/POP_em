class_name PausedMenue extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer


var _is_paused: bool = false:
	set = set_paused

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Menu"):
		_is_paused = !_is_paused
	

func set_paused(value:bool) -> void:
	_is_paused = value
	if _is_paused:
		animation_player.play("Fade_in")
	else:
		animation_player.play("Fade_out")
	get_tree().paused = _is_paused
	
	#visible = _is_paused
	
func _on_resume_pressed() -> void:
	_is_paused = false

func _on_setting_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/Scenes/paused_options_menu.tscn")

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/Scenes/start_menu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
	
