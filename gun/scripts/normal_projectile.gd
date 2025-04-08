@tool
extends Node2D

@export var attribute: BaseProjectile: set = setting_attribute

@onready var sprite_2d: Sprite2D = $Sprite2D

var damage
var damge_mul
var speed
var speed_mul
var accuracy

func _ready() -> void:
	load_weapon()
	
func load_weapon() -> void:	
	print("loading")
	sprite_2d.set_texture(attribute.texture)
	sprite_2d.self_modulate = attribute.color
	damage = attribute.damage
	damge_mul = attribute.damage_mul
	speed = attribute.speed
	speed_mul = attribute.speed_mul
	accuracy = attribute.accuracy

func setting_attribute(value):
	attribute = value
	if Engine.is_editor_hint():
		load_weapon()
		
