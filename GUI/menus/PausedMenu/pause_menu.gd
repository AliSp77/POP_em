extends CanvasLayer
class_name PauseMenu

signal shown
signal hidden

var is_paused: bool = false

@onready var item_description_text: Label = $Control/ItemDescriptionText
@onready var item_description_label: Label = $Control/ItemDescriptionLabel
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	hide_pause_menu()
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if is_paused == false:
			show_pause_menu()
		else:
			hide_pause_menu()
		get_viewport().set_input_as_handled()
	pass

func show_pause_menu() -> void:
	get_tree().paused = true
	visible = true
	is_paused = true
	shown.emit()
	pass
	
func hide_pause_menu() -> void:
	get_tree().paused = false
	visible = false
	is_paused = false
	hidden.emit()
	pass

func update_item_label( new_text: String )-> void:
	item_description_label.text = new_text
	pass

func update_item_description( new_text: String ) -> void:
	item_description_text.text = new_text
	pass

func play_audio(audio: AudioStream) -> void:
	audio_stream_player.stream = audio
	audio_stream_player.play()
