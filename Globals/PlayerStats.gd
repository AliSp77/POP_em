# PlayerStats.gd (Autoloaded)
extends Node

signal level_up

var xp: int = 0
var level: int = 1
var xp_to_next_level: int = 100

func add_xp(amount: int):
	xp += amount
	while xp >= xp_to_next_level:
		xp -= xp_to_next_level
		level += 1
		xp_to_next_level = int(xp_to_next_level * 1.5)
		emit_signal("level_up")
