extends Resource
class_name ItemData

@export var name: String = ""
@export_multiline var description: String = ""
@export var texture: Texture2D

@export_category("Item use effects")
@export var effects: Array[ItemEffect]

func use() -> bool:
	if effects.size() == 0:
		return false
	
	for e in effects:
		e.use()
	return true
