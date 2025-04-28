extends CharacterBody2D
class_name Enemy

signal direction_changed( new_direction: Vector2 )
signal enemy_damaged()

@export var hp: int = 3

var cardinal_direction: Vector2 = Vector2.LEFT
var direction: Vector2 = Vector2.ZERO
var player: Player
var invulnerable: bool

@export var type: EnemyType

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var hit_box: HitBox = $Hitbox
@onready var hurt_box: HurtBox = $HurtBox
@onready var vfx: AnimationPlayer = $VFX
@onready var state_machine: EnemyStateMachine = $state_machine


signal EnemyDied()
signal EnemySpawned()

func _ready() -> void:
	state_machine.init(self)
	EnemySpawned.emit()
	hurt_box.HealthDepleted.connect(die)
	hurt_box.DamageTaken.connect(hurt_visual)
	hurt_box.health = type.health
	hurt_box.invulnerable_time = type.invulnerable_time
	hit_box.damage = type.damage
	
func _physics_process(_delta: float) -> void:
	state_machine.process_physics(_delta)

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * _delta

	velocity.x = -type.speed

	move_and_slide()

func die():
	EnemyDied.emit()
	queue_free()

func hurt_visual(_value):
	vfx.play("Ouch")
	modulate.g = float(hurt_box.health)/float(type.health)
	modulate.b = float(hurt_box.health)/float(type.health)

func _process(_delta: float) -> void:
	state_machine.process_frame(_delta)
