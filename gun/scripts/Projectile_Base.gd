extends CharacterBody2D
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var sprite_2d: Sprite2D = $Sprite2D

var speed:int 
var damage: int
var projectile_color: Color
var direction: int
var start_pos: Vector2
var pop_range: float
var viggle_power: int

func _ready() -> void:
	set_as_top_level(true)
	sprite_2d.modulate = projectile_color
	start_pos = position
	
func _physics_process(delta: float) -> void:
	velocity.x = direction*speed
	velocity.y = randf_range(-1,1)*(position.x-start_pos.x)*viggle_power
	var random_scale = clampf((abs(position.x-start_pos.x)/75),0,1.5)
	scale = Vector2(random_scale,random_scale)
	print(random_scale)
	if abs(position.x - start_pos.x) > pop_range:
		queue_free()
	if not visible_on_screen_notifier_2d.is_on_screen():
		queue_free()
		pass
	move_and_slide()
	
