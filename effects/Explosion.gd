extends Node2D

signal exploded

var hp_drop_small = load("res://powerups/hp_orb_8.tscn")
var hp_drop_large = load("res://powerups/hp_orb_16.tscn")
var mp_drop_small = load("res://powerups/mp_orb_8.tscn")
var mp_drop_large = load("res://powerups/mp_orb_16.tscn")
var xp_drop_small = load("res://powerups/xp_orb_8.tscn")
var xp_drop_large = load("res://powerups/xp_orb_16.tscn")

var drop
var random_drops = [hp_drop_small, hp_drop_large, mp_drop_small, mp_drop_large, xp_drop_small, xp_drop_large]
var random_drop
var random_num_drops

func _ready() -> void: 
	#warning-ignore:return_value_discarded
	$AnimationPlayer.connect('animation_finished', self, '_on_Animation_finished')


func start() -> void:
	$AnimationPlayer.play('Explode')
	$AudioStreamPlayer2D.play()


func _on_Animation_finished(anim_name: String) -> void:
	randomize()
	random_num_drops = randi() % 5
	for i in random_num_drops:
		print("Dropping Dooky...")
		randomize()
		random_drop =  randi() % random_drops.size()
		print("Random Drop: " , random_drop)
		drop = random_drops[random_drop].instance()
		drop.position = get_parent().get_parent().get_parent().position
		print_debug(drop.position)
		get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().add_child(drop)
		print("Dooky Dropped...")
		
	assert(anim_name == 'Explode')
	emit_signal('exploded')
	queue_free()
