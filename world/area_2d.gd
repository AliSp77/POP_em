extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("area_entered", finish)

func finish(area: Area2D):
	print("test")
