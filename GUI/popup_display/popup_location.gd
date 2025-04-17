extends Marker2D

#const	popup_display = preload("res://GUI/popup_display.tscn")
@export var popup_display: PackedScene = preload("res://GUI/popup_display/popup_display.tscn")
@onready var hurt_box: HurtBox = $"../HurtBox"

func _ready() -> void:
	randomize()
	hurt_box.DamageTaken.connect(set_text)
	
var printed_text: String: set = set_text

func popup(text):
	var damage = popup_display.instantiate()
	damage.position = global_position
	damage.label_text = text
	
	var tween = get_tree().create_tween()
	tween.tween_property(damage, "position", global_position + _get_direction(), 0.75)
	
	
	get_tree().current_scene.add_child(damage)

func _get_direction():
	return Vector2(randf_range(-1,1), -randf()) * 16

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_left"):
		popup("shit")

func set_text(value):
	if typeof(value) != 4:
		value = str(value)
	printed_text = value
	popup(value)
