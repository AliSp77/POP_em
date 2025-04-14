extends Control

@onready var bg: TextureRect = $Bg
@onready var panel: Panel = $Panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bg.modulate.a = 0.0
	panel.modulate.a = 0.0
	var tween = self.create_tween()
	tween.tween_property(bg, "modulate:a", 1.0, 1.0)
	tween.tween_property(panel, "modulate:a", 1.0, 0.5)
	await tween.finished


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().paused = false
	print("started")
	get_tree().change_scene_to_file("res://world/Scenes/world.tscn")
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
