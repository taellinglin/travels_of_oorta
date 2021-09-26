extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var picked_up = false
var homing_point
# Called when the node enters the scene tree for the first time.
func _ready():
	#scale = Vector2(orb_scale_init, orb_scale_init)
	get_node("AnimationPlayer").play("Grow")
	set_physics_process(true);
	linear_velocity.y = -75
	var rand_x_lv = rand_range(-50,50)
	print("Rand_x_lv(random_x_linear_velocity): ", rand_x_lv)
	linear_velocity.x = rand_x_lv
	
	
func _physics_process(delta):
	if linear_velocity.y < 0:
		linear_velocity.y += 1 * delta
	angular_velocity = 0
	


	


func _on_Area2D_body_entered(body):
	if(body.name == "Player"):
		if !picked_up:
			print("Player is picking up MP...")
			PlayerStats.set_mp(PlayerStats.get_mp() + 500)
			get_node("pickup_sound").play()
			get_node("AnimationPlayer").play("Shrink")
			picked_up = true
		


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Shrink" :
		queue_free()
