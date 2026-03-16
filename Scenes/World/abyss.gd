extends Node2D

@onready var color_rect: ColorRect = $CanvasLayer/ColorRect
@onready var pause_menu: CanvasLayer = $PauseMenu
var end = false
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
	
func _ready() -> void:
	get_tree().paused = true

func _process(delta: float) -> void:
	if end:
		color_rect.color.a += .3 * delta
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Escafandra":
		end = true
	
