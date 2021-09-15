"""
Manage xp of the character.
"""
extends Node2D
class_name Xp

# signal emitted when the xp change
signal xp_changed(new_xp)
# signal emitted when the max xp change
signal max_xp_changed(new_xp)
# signal emitted when a character take damage
signal take_damage(alive, direction)
# signal emitted to "slow" the time when the character is hitted
signal momentum()

var xp
var max_xp

func _ready() -> void:
	xp =  PlayerStats.get_xp()
	max_xp = PlayerStats.get_max_xp()
	emit_signal('max_xp_changed', max_xp)
	emit_signal('xp_changed', xp)
	
	#warning-ignore:return_value_discarded
	self.connect('momentum', $'../Momentum', 'attack_momentum')


"""
Temporary function to simulate hit/recover xp
@TODO: To remove
"""
#/*
#func _input(event: InputEvent) -> void:
#	if ProjectSettings.get_setting('Debug/debug_mode'):
#		if event.is_action_pressed('simulate_recover_xp'):
#			recover_xp(25.0)
#
"""
Damage the character.

@param {float} amount - amount of xp to remove
@param {int} direction - computed direction where the character has been hit
"""

func drain_xp(amount: float) -> void:
	xp -= amount
	if xp < 0:
		xp = 0
	emit_signal('xp_changed', xp)
	
	print('%s lost %s experience points. Xp: %s/%s' % [get_path(), amount, xp, max_xp])

func recover_xp(amount: float) -> void:
	xp += amount
	if xp > max_xp:
		xp = max_xp
	emit_signal('xp_changed', xp)
	
	print('%s recovered %s hit points. Hp: %s/%s' % [get_path(), amount, xp, max_xp])
