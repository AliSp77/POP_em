extends Resource
class_name DropData

@export var item: ItemData
@export_range(0,100,1, "suffix:%") var probeblity: float = 100
@export_range(0,10,1, "suffix:items") var min_amount: int = 1
@export_range(0,10,1, "suffix:items") var max_amount: int = 1

func get_drop_count() -> int:
	if randf_range(0,100) >= probeblity:
		return 0
	return randi_range(min_amount, max_amount)
