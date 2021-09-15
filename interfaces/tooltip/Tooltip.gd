extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var tooltip_text = "tooltip"
var tooltip_visible = false

# Called when the node enters the scene tree for the first time.
func _ready():
	text = tooltip_text
	hide()

func set_text(new_text):
	tooltip_text = new_text
	text = tooltip_text
	
func show():
	tooltip_visible = true
	visible = tooltip_visible

func hide():
	tooltip_visible = false
	visible = tooltip_visible
