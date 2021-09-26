extends RigidBody2D


# Declare member variables here. Exahples:
# var a = 2
# var b = "text"

var picked_up = false
var homing_point
# Called when the node enters the scene tree for the first time.
func _ready():
	#scale = Vector2(orb_scale_init, orb_scale_init)
	get_node("AnimationPlayer").play("Grow")
	set_physics_process(true);
	var rand_y_lv = rand_range(-100, 0)
	linear_velocity.y = rand_y_lv
	var rand_x_lv = rand_range(-50,50)
	print("Rand_x_lv(random_x_linear_velocity): ", rand_x_lv)
	linear_velocity.x = rand_x_lv
	
	
func _physics_process(delta):
	if linear_velocity.y < 0:
		linear_velocity.y += 1 * delta
	angular_velocity = 0
	
	#Perhaps some function to draw the orbs towards the player.
		#homing_point = $World/Player.get_position_in_parent()
		#print_debug("Homing Point: ", homing_point)
		#applied_force(position
		
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


	


func _on_Area2D_body_entered(body):
	if(body.name == "Player"):
		if !picked_up:
			print("Player is picking up HP...")
			PlayerStats.set_hp(PlayerStats.get_hp() + 50)
			get_node("pickup_sound").play()
			get_node("AnimationPlayer").play("Shrink")
			picked_up = true
		


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Shrink" :
		queue_free()
