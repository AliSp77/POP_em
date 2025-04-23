extends Button
class_name InventorySlotUI

var slot_data: SlotData : set	= set_slot_data

@onready var texture_rect: TextureRect = $TextureRect
@onready var label: Label = $Label

func _ready() -> void:
	texture_rect.texture = null
	label.text = ""
	focus_entered.connect(focused)
	focus_exited.connect(unfocused)
	pressed.connect(item_pressed)
	
	
func set_slot_data( value: SlotData )-> void:
	slot_data = value
	print(slot_data)
	if slot_data == null:
		return
	if slot_data.item_data == null:
		return
	texture_rect.texture = slot_data.item_data.texture
	label.text = str( slot_data.quantity )

func focused():
	if slot_data != null:
		if slot_data.item_data != null:
			PausedMenu2.update_item_description(slot_data.item_data.description)
			PausedMenu2.update_item_label(slot_data.item_data.name)
	pass
	
func unfocused():
	PausedMenu2.update_item_description("")
	PausedMenu2.update_item_label("Item Description: ")
	pass

func item_pressed() -> void:
	if slot_data:
		if slot_data.item_data:
			var useable = slot_data.item_data.use()
			if useable == false:
				return
			slot_data.quantity -= 1
			label.text = str(slot_data.quantity)
