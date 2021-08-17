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
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	offset.y = 56*(Sfx.cursori);
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		file_select = Sfx.cursori;
		match file_select:
			0:
				LevelManager.goto_scene("res://scenes/Level9.tscn")
			
			1:
				LevelManager.goto_scene("res://scenes/Level1.tscn")
			
			2:
				LevelManager.goto_scene("res://scenes/Level8.tscn")
		
		
