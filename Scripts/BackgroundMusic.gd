extends Node

var BG_MUSIC_NODE: AudioStreamPlayer = null

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	BG_MUSIC_NODE = AudioStreamPlayer.new()
	BG_MUSIC_NODE.stream = load("res://Assets/underwater-diving-files/Sound/watery_cave_loop.ogg")
	BG_MUSIC_NODE.autoplay = true
	add_child(BG_MUSIC_NODE)
