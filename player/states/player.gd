extends CharacterBody2D
class_name Player

@onready var state_machine: StateMachine = $StateMachine
@onready var animation: AnimationPlayer = $Animation
@onready var pistol: Gun = $Pistol
@onready var hurt_box: HurtBox = $HurtBox
@export var knockback: int = 16

var direction: int = 1
var weapon_direction: int = 1
@export var weapon_type1: Resource
@export var weapon_type2: Resource
@export var player_resource : PlayerStats

signal DamageTaken(damage)

func _ready():
	state_machine.init(self)
	hurt_box.health = player_resource.health
	
	
func _on_hurt_box_damage_taken(damage: int) -> void:
	DamageTaken.emit(damage)
	animation.play("ouch")
	position.x -= knockback

func _on_hurt_box_health_depleted() -> void:
	get_tree().change_scene_to_file("res://game_over.tscn")

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	if Input.is_action_just_pressed("weapon_left"):
		weapon_direction = -1
	if Input.is_action_just_pressed("weapon_right"):
		weapon_direction = 1
	
	if Input.is_action_just_pressed("power1"):
		pistol.Type = weapon_type1
		#pistol.Type = preload("res://gun/scripts/normal_projectile.tres")
	if Input.is_action_just_pressed("power2"):
		pistol.Type = weapon_type2
		#pistol.Type = preload("res://gun/scripts/heavy_projectile.tres")
	move_and_slide()

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func change_direction(new_direction):
	scale.x = -1
	direction = new_direction
