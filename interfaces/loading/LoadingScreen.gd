tool
extends Control

var resource: Resource
var load_completed: bool = false

func _ready() -> void:
	$Tween.connect('tween_completed', self, '_on_tween_completed')
	load_completed = false
	Sfx.menumode = false;
	

func set_progress(progress: float) -> void:
	var progress_bar := find_node('ProgressBar')
	$Tween.interpolate_property(progress_bar, 'value', progress_bar.value, progress, .5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()


func _(event: InputEvent) -> void:
	if(event.is_action_pressed("enter")||event.is_action_pressed("ui_accept")):
		LevelManager.set_new_scene(resource)
		queue_free()


func set_resource(loaded_resource: Resource) -> void:
	resource = loaded_resource
	load_completed = true
	

#warning-ignore:unused_argument
func _on_tween_completed(object: Object, key: NodePath) -> void:
	match object.get_name():
		'ProgressBar':
			if object.value == 100:
				$AnimationPlayer.play('Blink')


func _on_Tween_tween_all_completed():
	LevelManager.set_new_scene(resource)
	queue_free() # Replace with function body.
