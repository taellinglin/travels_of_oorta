extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

func _process(delta):
	rotate(0.00050);

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
