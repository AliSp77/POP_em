extends Resource
class_name	BaseProjectile

@export_category("Visual stuff")
@export var name: StringName
@export var texture: Texture
@export var color: Color

@export_category("Attribute")
@export var damage: int
@export var speed: int
@export var pop_range: int
@export var viggle_power: int

func apply_upgrade():
	# upgrade logic
	pass
