# WaveController.gd
extends Node

signal LevelChange(level: int)

const start_level: int = 1
const start_enemy: int = 5
const start_timer: float = 1.0

var current_level: int = start_level: set = _on_level_change
var current_enemy_count: int: get = _on_count_called

func _on_level_change(value):
	print(value)
	current_level = value
	LevelChange.emit(value)
	pass

func _on_count_called():
	return current_level * 5

func _on_wave_cleared():
	pass
