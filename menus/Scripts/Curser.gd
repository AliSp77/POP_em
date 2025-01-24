extends Node


# Load the custom images for the mouse cursor.
var arrow = load("res://menus/Arts/Curser.png")
var hand = load("res://menus/Arts/Hand.png")


func _ready():
	# Changes only the arrow shape of the cursor.
	# This is similar to changing it in the project settings.
	Input.set_custom_mouse_cursor(arrow)

	# Changes a specific shape of the cursor (here, the I-beam shape).
	Input.set_custom_mouse_cursor(hand, Input.CURSOR_POINTING_HAND)
