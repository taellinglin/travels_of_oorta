extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var file_select = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
 # Replace with function body.
	set_process(true);
	set_process_input(true);
	Sfx.menumode = true;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	offset.y = 48*(Sfx.cursori);

func _input(event):
	if event.is_action_pressed("ui_accept"):
		match Sfx.cursori:
			0:
				LevelManager.goto_scene("res://scenes/Level0.tscn")
			
			1:
				LevelManager.goto_scene("res://scenes/Level1.tscn")
			
			2:
				LevelManager.goto_scene("res://scenes/Level2.tscn")
				
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://menu/MainMenu.tscn")
		
		
