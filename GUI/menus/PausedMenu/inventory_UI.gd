extends GridContainer
class_name	InventoryUI

const INV_SLOT	 = preload("res://GUI/menus/Inventory/inventory_slot.tscn")

@export var inventory_data: InventoryData
var focus_index: int = 0


func _ready() -> void:
	PausedMenu.shown.connect(update_inventory)
	PausedMenu.hidden.connect(clear_inventory)
	clear_inventory()
	inventory_data.changed.connect(on_inventory_changed)
	pass
	
func clear_inventory() -> void:
	for c in get_children():
		c.queue_free()
		
func update_inventory(i: int = 0) -> void:
	print(inventory_data.slots)
	for s in inventory_data.slots:
		var new_slot := INV_SLOT.instantiate()
		add_child(new_slot)
		new_slot.slot_data = s
		new_slot.focus_entered.connect(item_focused)
	
	await get_tree().process_frame
	get_child(i).grab_focus()

func item_focused():
	for i in get_child_count():
		if get_child(i).has_focus():
			focus_index = i
			return
	pass
		

func on_inventory_changed() -> void:
	var i = focus_index
	clear_inventory()
	update_inventory(i)
	
