extends CharacterBody2D
class_name Projectile

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision: Area2D = $collision
@onready var hitbox: HitBox = $Hitbox

var speed:int 
var damage: int
var projectile_color: Color
var direction: int
var start_pos: Vector2
var pop_range: float
var viggle_power: int
var penetration_limit: int = 2
var penetration_count: = 0

func _ready() -> void:
	set_as_top_level(true)
	hitbox.damage = damage
	collision.connect("body_entered", remove_projectile)
	sprite_2d.modulate = projectile_color
	start_pos = position
	
func _physics_process(delta: float) -> void:
	velocity.x = direction*speed
	velocity.y = randf_range(-1,1)*(position.x-start_pos.x)*viggle_power
	var random_scale = clampf((abs(position.x-start_pos.x)/75),0,1.5)
	scale = Vector2(random_scale,random_scale)
	if abs(position.x - start_pos.x) > pop_range:
		queue_free()
	if not visible_on_screen_notifier_2d.is_on_screen():
		queue_free()
		pass
	move_and_slide()

func remove_projectile(area):
	if area is CharacterBody2D:
		penetration_count += 1
	if penetration_count >= penetration_limit:
		queue_free()
