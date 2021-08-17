extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var file_select = 0
var cursor_y = 0
var cursor_tracks = 0
var cursor_volume = 0
var cursor_pitch = 1
var max_volume = 1
var min_volume = -80
var min_pitch = 0.1
var max_pitch = 4
var soundtrack
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	soundtrack = get_parent()
func _input(event):
	if event.is_action_pressed("ui_up"):
		move_up()
	if event.is_action_pressed("ui_down"):
		move_down()
	if event.is_action_pressed("ui_accept"):
		pause_play()
	if event.is_action_pressed("ui_left"):
		move_left()
	if event.is_action_pressed("ui_right"):
		move_right()
		
func pause_play():
	if cursor_y >= 0 && cursor_y < 3:
		get_parent().play(soundtrack.tracks[cursor_tracks])
	if cursor_y == 3:
		LevelManager.goto_scene("res://menus/MainMenu.tscn")
		
func move_up():
	if cursor_y > 0:
		cursor_y -= 1
	else:
		if cursor_y == 0:
			cursor_y = 3
	move_cursor(cursor_y)
	print("Cursor(y): ", cursor_y)
	
func move_down():
	if cursor_y < 3:
		cursor_y += 1
	else:
		if cursor_y == 3:
			cursor_y = 0
	move_cursor(cursor_y)
	print("Cursor(y): ", cursor_y)
func move_left():
	if cursor_y == 0: 
		if cursor_tracks > 0:
			cursor_tracks -= 1
			print("Track:", cursor_tracks)
			soundtrack.get_node("track").text = soundtrack.track_names[cursor_tracks]	
			get_parent().play(soundtrack.tracks[cursor_tracks])		
		elif cursor_tracks == 0:
			cursor_tracks = soundtrack.tracks.size()-1
			print("Track:", cursor_tracks)			
			soundtrack.get_node("track").text = soundtrack.track_names[cursor_tracks]
			get_parent().play(soundtrack.tracks[cursor_tracks])
	elif cursor_y == 1:
		if soundtrack.volume > min_volume:
			soundtrack.volume -= 0.1
			cursor_volume -= 1;
			print("Volume: ", soundtrack.volume)
			soundtrack.get_node("volume").text = soundtrack.volume as String
			soundtrack.get_node("TrackPlayer").set_volume_db(soundtrack.volume)			
		elif soundtrack.volume == min_volume:
			print("min Volume")
			soundtrack.get_node("volume").text = soundtrack.volume as String
			soundtrack.get_node("TrackPlayer").set_volume_db(soundtrack.volume)
	elif cursor_y == 2:
		if soundtrack.pitch > min_pitch:
			soundtrack.pitch -= 0.1
			print("Pitch: ", soundtrack.pitch)
			soundtrack.get_node("pitch").text = soundtrack.pitch as String
			soundtrack.get_node("TrackPlayer").set_pitch_scale(soundtrack.pitch)			
		elif soundtrack.pitch == min_pitch:
			print("Min Pitch")
			soundtrack.get_node("pitch").text = soundtrack.pitch as String
			soundtrack.get_node("TrackPlayer").set_pitch_scale(soundtrack.pitch)
			
		
func move_right():
	if cursor_y == 0:
		if cursor_tracks < soundtrack.tracks.size()-1:
			cursor_tracks += 1
			print("Track:", cursor_tracks)			
			soundtrack.get_node("track").text = soundtrack.track_names[cursor_tracks]
			soundtrack.get_node("artist").text = soundtrack.artist_names[cursor_tracks]
			get_parent().play(soundtrack.tracks[cursor_tracks])
		elif cursor_tracks == soundtrack.tracks.size()-1:
			cursor_tracks = 0
			print("Track:", cursor_tracks)			
			soundtrack.get_node("track").text = soundtrack.track_names[cursor_tracks]
			soundtrack.get_node("artist").text = soundtrack.artist_names[cursor_tracks]
			get_parent().play(soundtrack.tracks[cursor_tracks])
	elif cursor_y == 1:
		if soundtrack.volume < max_volume:
			soundtrack.volume += .1
			cursor_volume += 1
			print("Volume: ", soundtrack.volume)
			soundtrack.get_node("volume").text = soundtrack.volume as String
			soundtrack.get_node("TrackPlayer").set_volume_db(soundtrack.volume)
		elif soundtrack.volume == max_volume:
			print("Max Volume")
			soundtrack.get_node("volume").text = soundtrack.volume as String
			soundtrack.get_node("TrackPlayer").set_volume_db(soundtrack.volume)
	elif cursor_y == 2:
		if soundtrack.pitch < max_pitch:
			soundtrack.pitch += 0.1
			print("Pitch: ", soundtrack.pitch)
			soundtrack.get_node("pitch").text = soundtrack.pitch as String
			soundtrack.get_node("TrackPlayer").set_pitch_scale(soundtrack.pitch)			
		elif soundtrack.pitch == max_pitch:
			print("Max Pitch")
			soundtrack.get_node("pitch").text = soundtrack.pitch as String
			soundtrack.get_node("TrackPlayer").set_pitch_scale(soundtrack.pitch)
			
			
						
			

func move_cursor(cursor):
	if cursor == 0:
		position.x = 32
		position.y = 38
	if cursor == 1:
		position.x = 32
		position.y = 84
	if cursor == 2:
		position.x = 32
		position.y = 107
	if cursor_y == 3:
		position.x = 64
		position.y = 131
	#elif cursor_y == 3:
	#	cursor_y = 0
	#	position.x = 32
	#	position.y = 38
