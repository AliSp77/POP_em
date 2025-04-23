@tool
extends Node2D
class_name ItemPickup

@export var item_data: ItemData: set = _set_item_data

@onready var area_2d: Area2D = $Area2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var hovered: bool = false
var pickable: bool = false

func _ready() -> void:
	_update_texture()
	if Engine.is_editor_hint():
		return
	area_2d.area_entered.connect(_on_area_entered)
	area_2d.area_exited.connect(_on_area_exited)
	area_2d.mouse_entered.connect(_on_mouse_entered)
	area_2d.mouse_exited.connect(_on_mouse_exited)

func _on_area_exited(b):
	if b is PickRange:
			pickable = false
	pass

func _on_area_entered(b):
	if b is PickRange:
		pickable = true
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and hovered and pickable:
		if PlayerManager.INVENTORY_DATA.add_item(item_data) == true:
			pick_up_item()

func pick_up_item():
	area_2d.area_entered.disconnect(_on_area_entered)
	audio_stream_player_2d.play()
	visible = false
	await  audio_stream_player_2d.finished
	queue_free()
	
func _set_item_data( value : ItemData ) -> void:
	item_data = value
	_update_texture()
	pass
	
func _update_texture():
	if item_data and sprite_2d:
		sprite_2d.texture = item_data.texture
	pass

func _on_mouse_entered() -> void:
	hovered = true
	
func _on_mouse_exited() -> void:
	hovered = false

func _process(delta: float) -> void:
	if pickable:
		sprite_2d.modulate = Color.RED
	else:
		sprite_2d.modulate = Color.WHITE
