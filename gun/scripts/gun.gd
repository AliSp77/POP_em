extends Node2D
class_name Gun

@export var Type: BaseProjectile
@onready var timer: Timer = $Timer
@onready var marker: Marker2D = $Marker2D
@export var parent: Player

func _ready() -> void:
	timer.timeout.connect(fire_projectile)
	timer.start()

func fire_projectile():
	var projectile_scene = preload("res://gun/scenes/Projectile_Base.tscn")
	var new_projectile = projectile_scene.instantiate()
	new_projectile.direction = parent.weapon_direction
	new_projectile.position = marker.global_position
	new_projectile.speed = Type.speed
	new_projectile.damage = Type.damage
	new_projectile.projectile_color = Type.color
	new_projectile.pop_range = Type.pop_range
	new_projectile.viggle_power = Type.viggle_power
	add_child(new_projectile)
	
