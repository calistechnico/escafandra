extends Node2D

@onready var bubble_appear_timer: Timer = $BubbleAppearTimer
var bubble = preload("res://Scenes/World/bubble.tscn")
#var bubble_instance = bubble.instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

func _on_bubble_appear_timer_timeout() -> void:
	var children = get_children()
	if children.size() == 1:
		self.add_child(bubble.instantiate())
