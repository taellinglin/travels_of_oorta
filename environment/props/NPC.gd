extends Sprite
class_name Interaction4

signal interaction(type)

const ALERT_SCENE: Resource = preload('res://interfaces/dialogue/AlertBox.tscn')
const NEXT_ALERT_SCENE: Resource = preload('res://interfaces/dialogue/AlertNextLevelBox.tscn')
export(String) var scene_path = ''
export(bool) var is_last_level = false


func _ready():
	$AlertTrigger.connect('body_entered', self, '_on_body_enter')


func _on_body_enter(body: Object) -> void:
	if(Input.is_action_pressed("move_up")):
		if body.get_collision_mask_bit(1):
			if body.is_grounded:
				LevelManager.goto_scene("res://interfaces/dialogue/Dialog.tscn")
			
