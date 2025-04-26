@tool
extends RigidBody2D
class_name ItemPickup

@export var item_data: ItemData: set = _set_item_data

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _ready() -> void:
	_update_texture()
	if Engine.is_editor_hint():
		return

func pick_up_item():
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

func _on_pick_area_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if PlayerManager.INVENTORY_DATA.add_item(item_data) == true:
			pick_up_item()
