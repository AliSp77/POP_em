extends Control
@onready var texture_rect: TextureRect = $TextureRect
@onready var center_container: CenterContainer = $CenterContainer

func _ready() -> void:
	texture_rect.modulate.a = 0.0
	center_container.modulate.a = 0.0
	var tween = self.create_tween()
	tween.tween_property(texture_rect, "modulate:a", 1.0, 1.0)
	tween.tween_property(center_container, "modulate:a", 1.0, 0.5)
	await tween.finished

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/Scenes/start_menu.tscn")
