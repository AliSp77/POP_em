extends CharacterBody2D
@onready var state_machine: StateMachine = $StateMachine
@onready var animation: AnimationPlayer = $Animation
@onready var invulner: Timer = $invulner

@onready var pistol: Node2D = $Pistol

var inv: bool = true
var direction: int = 1

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
	move_and_slide()

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func change_direction(new_direction):
	scale.x = -1
	direction = new_direction
