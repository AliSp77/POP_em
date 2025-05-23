extends Control


@export var in_time: float = 0.5
@export var fade_in_time: float = 1.5
@export var pause_time: float = 1.5
@export var fade_out_time: float = 1.5
@export var out_time: float = 0.5
@export var splash_Srceen: TextureRect
@export var splash_screen_container: Container

@export var splash_screens: Array

func get_screens() -> void:
	splash_screens = splash_screen_container.get_children()
	print("test")
	for screen in splash_screens:
		screen.modulate.a = 0.0
		print(screen)

func _ready() -> void:
	AudioPlayer.start_music()
	get_screens()
	fade()
	
func fade() -> void:
	for screen in splash_screens:
		var tween = self.create_tween()
		tween.tween_interval(in_time)
		tween.tween_property(screen, "modulate:a", 1.0, fade_in_time)
		tween.tween_interval(pause_time)
		tween.tween_property(screen, "modulate:a", 0.0, fade_out_time)
		tween.tween_interval(out_time)
		await tween.finished
	get_tree().change_scene_to_file("res://menus/Scenes/start_menu.tscn")
