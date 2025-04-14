extends AudioStreamPlayer

const	start_music_file = preload("res://audio/StartMenu.mp3")
const	normal_theme_file = preload("res://audio/themes/game_theme.mp3")
const	boss_theme_file = preload("res://audio/themes/boss_theme.mp3")

func _play_music(music: AudioStream, volume:= 0):
	if stream == music:
		return
	else:
		await finish_volume()
	stream = music
	volume_db = volume
	play()
	start_volume()

func start_volume():
	print("going up")
	var tween = create_tween()
	tween.tween_method(set_volume_db, -80, 0, 1)
	await tween.finished
	return

func finish_volume():
	print("going down ", volume_db)
	var tween = create_tween()
	tween.tween_method(set_volume_db, 0, -80, 1)
	await tween.finished
	print("went down ", volume_db)
	return

func normal_theme():
	_play_music(normal_theme_file)

func start_music():
	_play_music(start_music_file)
	
func boss_theme():
	_play_music(boss_theme_file)
