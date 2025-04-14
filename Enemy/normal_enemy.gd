extends CharacterBody2D
class_name NormalEnemy

@export var type: EnemyType

@onready var hitbox: HitBox = $Hitbox
@onready var hurt_box: HurtBox = $HurtBox

@onready var vfx: AnimationPlayer = $VFX


func _ready() -> void:
	hurt_box.HealthDepleted.connect(die)
	hurt_box.DamageTaken.connect(hurt_visual)
	hurt_box.health = type.health
	hitbox.damage = type.damage
	
signal died()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	velocity.x = -type.speed

	move_and_slide()

func die():
	died.emit()
	queue_free()

func hurt_visual(value):
	vfx.play("Ouch")
