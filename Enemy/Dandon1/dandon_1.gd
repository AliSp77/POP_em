extends CharacterBody2D
class_name dandon1

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var health: Health = $Health
@onready var hurt_box: HurtBox = $HurtBox
@onready var vfx: AnimationPlayer = $VFX

func _ready() -> void:
	hurt_box.DamageTaken.connect(hurt_visual)
	
signal died()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	velocity.x = -40

	move_and_slide()
	
	if health.health <= 0:
		died.emit()
		queue_free()

func hurt_visual(value):
	vfx.play("Ouch")
