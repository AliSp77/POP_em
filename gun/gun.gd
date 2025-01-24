extends Node2D

const BULLET = preload("res://gun/projectile.tscn")
@onready var marker_2d: Marker2D = $Marker2D
@onready var player: CharacterBody2D = $".."

var projectile_color: Color 
var Normal: Dictionary = {
	"speed": 100,
	"range": 100,
	"random_range": 50,
	"damage": 1 
}
var Cinemenn: Dictionary = {
	"speed": 30,
	"range": 50,
	"random_range": 20,
	"damage": 2 
}
var Mint: Dictionary = {
	"speed": 200,
	"range": 150,
	"random_range": 10,
	"damage": 1 
}

var power_select: Dictionary = Normal

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("fire"):
		var bullet_instance = BULLET.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.start_pos = marker_2d.global_position.x
		bullet_instance.direction_hit = player.scale[1]
		bullet_instance.global_position = marker_2d.global_position
		bullet_instance.ColorChange(projectile_color)
		bullet_instance.power = power_select
		bullet_instance.get_node("Hitbox").damage = power_select["damage"]
