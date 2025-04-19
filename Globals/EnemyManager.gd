# EnemyManager.gd (Autoloaded)
extends Node

signal wave_cleared

var active_enemies: Array = []
var spawned_count: int = 0

func register_enemy(enemy):
	active_enemies.append(enemy)
	spawned_count += 1
	enemy.connect("tree_exited", Callable(self, "_on_enemy_defeated").bind(enemy))

func _on_enemy_defeated(enemy):
	active_enemies.erase(enemy)
	if active_enemies.is_empty():
		emit_signal("wave_cleared")
		spawned_count = 0
