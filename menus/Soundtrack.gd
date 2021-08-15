extends Control
export var track = "<track name>"
export var artist = "<artist name>"
export var volume = 0
export var pitch = 1
export var tracks = [
	"res://music/bgm00_-_Intro-Jp-.ogg", 
	"res://music/bgm01_-_Menu.ogg",
	"res://music/bgm02_-_Select_File.ogg",
	"res://music/bgm03_-_Limbo.ogg",
	"res://music/bgm04_-_Tutorial.ogg",
	"res://music/bgm05_-_Winter_Time.ogg",
	"res://music/bgm06_-_Winter_Time_Chip.ogg",
	"res://music/bgm07_-_Winter.ogg",
	"res://music/bgm08_-_Valley_Area.ogg",
	"res://music/bgm09_-_Summer.ogg",
	"res://music/bgm10_-_Autumn_Puzzle.ogg",
	"res://music/bgm11_-_Spring_Stage.ogg",
	"res://music/bgm12_-_Spring_Town.ogg",
	"res://music/bgm13_-_Spring_Theme.ogg",
	"res://music/bgm14_-_Forest.ogg",
	"res://music/bgm15_-_Toadstool.ogg",
	"res://music/bgm16_-_Merchant.ogg",
	"res://music/bgm17_-_Dungeon.ogg",
	"res://music/bgm18_-Metronome.ogg",
	"res://music/bgm19_-_Train_Battle.ogg",
	"res://music/bgm20_-_Click_Clock_Freight.ogg",
	"res://music/bgm21_-_Train_Track_Beat.ogg",
	"res://music/bgm22_-_Temple_Basement.ogg",
	"res://music/bgm23_-_Battle_Encounter.ogg",
	"res://music/bgm24_-_Master_Mellow.ogg",
	"res://music/bgm25_-_Shamisen-Title_Screen-.ogg",
	"res://music/bgm26_-_Parade.ogg",
	"res://music/bgm27_-_House_Tune.ogg",
	"res://music/bgm28_-_Click_Clock_Freight(version_2).ogg",
	"res://music/bgm29_-_Item_in_Room.ogg",
	"res://music/bgm30_-_Maze.ogg",
	"res://music/bgm31_-_Paradise.ogg",
	"res://music/bgm32_-_Main_Menu.ogg",
	"res://music/bgm33_-_Menu_Other.ogg",
	"res://music/bgm34_-_Metronome_March_2.ogg",
	"res://music/bgm35_-_Mountains.ogg",
	"res://music/bgm36_-_Sudden_Attack.ogg",
	"res://music/bgm37_-_Town.ogg",
	"res://music/bgm38_-_Trails.ogg",
	"res://music/bgm39_-_Wind-Up_Toy-Extended-.ogg"
]

export var track_names = [
	"Intro-Jp", 
	"Menu",
	"Select File",
	"Limbo",
	"Tutorial",
	"Winter Time",
	"Winter Time Chip",
	"Winter",
	"Valley Area",
	"Summer",
	"Autumn Puzzle",
	"Spring Stage",
	"Spring Town",
	"Spring Theme",
	"Forest",
	"Toadstool",
	"Merchant",
	"Dungeon",
	"Metronome",
	"Train Battle",
	"Click Clock Freight",
	"Train Track Beat",
	"Temple Basement",
	"Battle Encounter",
	"Master Mellow",
	"Shamisen - Beta Title Screen",
	"Parade",
	"House Tune",
	"Click Clock Freight(version 2)",
	"Item in Room",
	"Maze",
	"Paradise",
	"Main_Menu",
	"Menu Other",
	"Metronome March 2",
	"Mountains",
	"Sudden Attack",
	"Town",
	"Trails",
	"Wind-Up Toy - Extended"
]

export var artist_names = [
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
	"Tael Ling Lin",
]
# Load the music player node
onready var _player = $TrackPlayer

func _ready():
	set_process_input(true);
# Calling this function will load the given track, and play it
func play(track_url : String):
	var track = load(track_url)
	_player.stream = track
	_player.play()
	
# Calling this function will stop the music
func stop():
	_player.stop()
