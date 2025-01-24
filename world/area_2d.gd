extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#connect("body_entered",  finish)
	#connect("area_entered",  finish)
	#connect("area_shape_entered",  finish)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func finish():
	print("finish")
