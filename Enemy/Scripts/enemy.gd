extends CharacterBody2D
class_name Enemy

@export var type: EnemyType

@onready var hit_box: HitBox = $Hitbox
@onready var hurt_box: HurtBox = $HurtBox
@onready var vfx: AnimationPlayer = $VFX
signal EnemyDied()
signal EnemySpawned()

func _ready() -> void:
	EnemySpawned.emit()
	hurt_box.HealthDepleted.connect(die)
	hurt_box.DamageTaken.connect(hurt_visual)
	hurt_box.health = type.health
	hurt_box.invulnerable_time = type.invulnerable_time
	hit_box.damage = type.damage
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	velocity.x = -type.speed

	move_and_slide()

func die():
	EnemyDied.emit()
	queue_free()

func hurt_visual(_value):
	vfx.play("Ouch")
	modulate.g = float(hurt_box.health)/float(type.health)
	modulate.b = float(hurt_box.health)/float(type.health)
