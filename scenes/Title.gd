extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true);
	get_node("AnimationPlayer2").play("press_start");

func _input(event):
	if(event.is_action("ui_accept")):
		get_node("AudioStreamPlayer2").play()
		LevelManager.goto_scene("res://menus/MainMenu.tscn");



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
