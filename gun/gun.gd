extends Node2D

const BULLET = preload("res://gun/projectile.tscn")
@onready var marker_2d: Marker2D = $Marker2D
@onready var player: CharacterBody2D = $".."


var projectile_color: Color = Color(164, 0, 0, 1)

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("fire"):
		var bullet_instance = BULLET.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.direction_hit = player.scale[1]
		bullet_instance.global_position = marker_2d.global_position
		bullet_instance.ColorChange(projectile_color)
		print(player.scale)
