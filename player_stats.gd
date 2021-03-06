extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player_level = 1
var player_hp = 500
var player_mp = 100
var player_xp = 0
var max_hp = 500
var max_mp = 500
var max_xp = 500
var xp_dx_level = 100
var player_spell = 0
var max_level = 25
signal hp_changed(player_hp)
signal mp_changed(player_mp)
signal xp_changed(player_xp)
signal max_hp_changed(max_hp)
signal max_mp_changed(max_mp)
signal max_xp_changed(max_xp)
signal level_changed(player_level)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func set_player_level(level):
	if level < max_level:
		player_level = level
		emit_signal("level_changed", player_level)
	else:
		print("You are already maximum level")

func get_player_level():
	print("Player Level: ", player_level)
	return player_level
	
func set_hp(set_hp):
	if set_hp <= max_hp && set_hp >= 0:
		player_hp = set_hp
		emit_signal("hp_changed", player_hp)
		print("Player HP set: ", player_hp)
	else:
		print("Player HP not set...suggested HP: ", set_hp)
		player_hp = max_hp
	
		
func get_hp():
	print("Player HP: ", player_hp)
	return player_hp
	
func set_max_hp(set_max_hp):
	max_hp = set_max_hp
	emit_signal("max_hp_changed", max_hp)
	print("Player Max HP set to: ", max_hp)
	
func get_max_hp():
	print("Player Max HP: ", max_hp)
	return max_hp

func set_mp(set_mp):
	if set_mp < max_mp && set_mp >= 0:
		player_mp = set_mp
		emit_signal("mp_changed", player_mp)
		print("Player MP set to: ", player_mp)
	else:
		print("Player MP not set...suggested MP: ", set_mp)
		player_mp = max_mp
	
func get_mp():
	print("Player MP: ", player_mp)
	return player_mp

func set_max_mp(set_max_mp):
	max_mp = set_max_mp
	emit_signal("max_mp_changed", max_mp)
	print("Player Max MP set to: ", max_mp)

func get_max_mp():
	print("Player Max MP: ", max_mp)
	return max_mp

func set_xp(set_xp):
	if set_xp < max_xp && set_xp >= 0:
		player_xp = set_xp
		print("Player xp set to: ", player_xp)
		emit_signal("xp_changed", player_xp)
	elif set_xp >= max_xp:
		set_player_level(get_player_level() + 1)
		set_max_xp(get_player_level() * xp_dx_level)
		emit_signal("xp_changed", player_xp)
		if (set_xp - max_xp) <= max_xp:
			player_xp = (set_xp - max_xp)
		elif set_xp < max_xp:
			player_xp = player_xp + set_xp
		print("----------------")
		print("Level Up! Stats:")
		print("---Level:", player_level)
		print("---Hp:", player_hp)
		print("---Mp:", player_mp)
		print("---Xp:", player_xp)
		print("----------------")
		
		
		
func get_xp():
	print("Player xp: ", player_xp)
	return player_xp
	
func set_max_xp(set_max_xp):
	max_xp = set_max_xp
	emit_signal("max_xp_changed", max_hp)
	print("Player Max xp set to: ", max_xp)
	
func get_max_xp():
	print("Player Max xp: ", max_xp)
	return max_xp
	
func set_spell(set_spell):
	player_spell = set_spell
	print("Player Spell set to: ", player_spell)
	
func get_spell():
	print("Player Spell: ", player_spell)
	return player_spell
		
func print_stats():
		print("----------------")
		print("Player Stats:")
		print("---Level:", player_level)
		print("---Hp:", player_hp)
		print("---Mp:", player_mp)
		print("---Xp:", player_xp)
		print("----------------")
