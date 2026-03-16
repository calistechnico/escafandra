extends CanvasLayer

var paused = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		if paused == false:
			paused = true
			get_tree().paused = true
			visible = true
		else:
			paused = false
			get_tree().paused = false
			visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
