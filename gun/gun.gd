extends Node2D

const BULLET = preload("res://gun/projectile.tscn")
@onready var marker_2d: Marker2D = $Marker2D

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("fire"):
		var bullet_instance = BULLET.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = marker_2d.global_position
		
