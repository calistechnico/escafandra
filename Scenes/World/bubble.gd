extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var collectable = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == 'appear':
		#animated_sprite_2d.play("stay")
		collectable = true
		



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Escafandra" and collectable == true:
		queue_free()
