# WaveController.gd
extends Node

@export var enemy_spawner: NodePath
@export var start_wave_button: NodePath

func _ready():
	EnemyManager.connect("wave_cleared", Callable(self, "_on_wave_cleared"))
	get_node(start_wave_button).connect("pressed", Callable(self, "_on_start_wave_pressed"))

func _on_start_wave_pressed():
	get_node(enemy_spawner).spawn_wave()
	get_node(start_wave_button).disabled = true

func _on_wave_cleared():
	PlayerStats.add_xp(50)  # Bonus XP for clearing wave
	get_node(start_wave_button).disabled = false
