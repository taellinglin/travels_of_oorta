extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	get_node("CanvasLayer/dialog").load_language("res://dialog/dialog_0.lan")
	get_node("CanvasLayer/dialog").show_text("00", "00")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_dialog_finished():
	LevelManager.goto_scene("res://scenes/Level2.tscn")
