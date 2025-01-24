class_name PausedSettingMenu	extends Control

func _on_back_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://playground.tscn")

func _on_mute_toggled(toggled_on: bool) -> void:
	pass
	#if toggled_on:
		#AudioMaster.mute()
	#else:
		#AudioMaster.unmute()
