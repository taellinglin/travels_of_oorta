"""
Manage hp of the character.
"""
extends Node2D

# signal emitted when the hp change
signal hp_changed(new_hp)
# signal emitted when the max hp change
signal max_hp_changed(new_hp)
# signal emitted when a character take damage
signal take_damage(alive, direction)
# signal emitted to "slow" the time when the character is hitted
signal momentum()

var hp
var max_hp

func _ready() -> void:
	hp = PlayerStats.get_hp()
	max_hp = PlayerStats.get_hp()
	emit_signal('max_hp_changed', max_hp)
	emit_signal('hp_changed', hp)
	
	#warning-ignore:return_value_discarded
	self.connect('momentum', $'../Momentum', 'attack_momentum')


"""
Temporary function to simulate hit/recover hp
@TODO: To remove
"""
func _input(event: InputEvent) -> void:
	if ProjectSettings.get_setting('Debug/debug_mode'):
		if event.is_action_pressed('simulate_getting_hit'):
			take_damage(25, 1)
		elif event.is_action_pressed('simulate_recover_hp'):
			recover_hp(25.0)

"""
Damage the character.
@param {float} amount - amount of hp to remove
@param {int} direction - computed direction where the character has been hit
"""
func take_damage(amount: float, direction: int) -> void:
	var is_alive: bool = true
	hp -= amount
	# if the character has no hp	
	if hp <= 0:
		hp = 0
		is_alive = false

	emit_signal('hp_changed', hp)
	emit_signal('take_damage', is_alive, direction)
	emit_signal('momentum')
	print('%s took %s damage. Health: %s/%s' % [get_path(), amount, hp, max_hp])


"""
Health the character.
@param {float} amount - amount of hp to add
"""
func recover_hp(amount: float) -> void:
	hp += amount
	if hp > max_hp:
		hp = max_hp
	emit_signal('hp_changed', hp)
	print('%s recovered %s hp. Health: %s/%s' % [get_path(), amount, hp, max_hp])
