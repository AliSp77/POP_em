extends Marker2D
class_name PopupDisplay

@onready var label: Label = $Label

var label_text: String

func _ready():
	label.text = label_text
