extends Node2D
class_name Gun

const BULLET = preload("res://gun/scenes/projectile.tscn")
@onready var marker_2d: Marker2D = $Marker2D
@onready var player: CharacterBody2D = $".."
@onready var timer: Timer = $Timer

var fire: bool = false

var power_select: BaseProjectile = preload("res://gun/scripts/normal_projectile.tres")

func _ready() -> void:
	timer.wait_time = 1
	timer.timeout.connect(_on_timeout)

func _process(delta: float) -> void:

	if fire:
		var bullet_instance = BULLET.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.start_pos = marker_2d.global_position.x
		bullet_instance.direction_hit = player.scale[1]
		bullet_instance.global_position = marker_2d.global_position
		bullet_instance.ColorChange(power_select.color)
		bullet_instance.power = power_select
		bullet_instance.get_node("Hitbox").damage = power_select["damage"]
		fire = false

func _on_timeout():
	fire = true
