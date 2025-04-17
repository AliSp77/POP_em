extends TextureProgressBar
class_name HealthBar

@export var player: Player
@export var player_resource: PlayerStats

func _ready() -> void:
	#await player.ready
	player.DamageTaken.connect(set_progress)
	value = player_resource.health

func set_progress(damage):
	print("damage")
	value -= damage
	
		
