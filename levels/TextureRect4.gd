extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var voffset = [0,1,2,3,2,1,0,-1,-2,-3,-2,-1]
var clock = 50
var c = 0;
var offset_frame = 0;
const offset_framecount = 12;
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true);
	c = clock
	offset_frame =0
	

func _process(delta):
	if(c>0):
		c -= 1;
	else:
		c = clock;
		if(offset_frame<offset_framecount):
			translate(Vector2(0,voffset[offset_frame]));
			offset_frame += 1;
		else:
			offset_frame = 0;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
