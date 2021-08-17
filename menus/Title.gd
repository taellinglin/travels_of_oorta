extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true);
	get_node("drop_down2").play("title_drop");

func _input(event):
	if(event.is_action("ui_accept")):
		if(!get_node("cursor").playing):
			get_node("cursor").play()
			LevelManager.goto_scene("res://menus/MainMenu.tscn");



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
