extends CharacterBody2D
class_name Player

@onready var state_machine: StateMachine = $StateMachine
@onready var animation: AnimationPlayer = $Animation
@onready var invulner: Timer = $invulner

@onready var pistol: Gun = $Pistol


var inv: bool = true
var direction: int = 1

var weapon_direction: int = 1

func _ready():
	state_machine.init(self)

func _on_hurt_box_damage_taken(damage: int) -> void:
	animation.play("ouch")
	invulner.start()
	inv = true

func _on_hurt_box_health_depleted() -> void:
	get_tree().change_scene_to_file("res://game_over.tscn")

func _on_invulner_timeout() -> void:
	inv = false

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	if Input.is_action_just_pressed("weapon_left"):
		weapon_direction = -1
	if Input.is_action_just_pressed("weapon_right"):
		weapon_direction = 1
	
	if Input.is_action_just_pressed("power1"):
		pistol.Type = preload("res://gun/scripts/normal_projectile.tres")
	if Input.is_action_just_pressed("power2"):
		pistol.Type = preload("res://gun/scripts/heavy_projectile.tres")
	move_and_slide()

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func change_direction(new_direction):
	scale.x = -1
	direction = new_direction
