extends State
class_name Death

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: CharacterBody2D = $"../.."

func Enter():
	#print_debug("death entered")
	animated_sprite_2d.play("hit")

func Physics_Update(_delta: float):
	#super(_delta)
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * _delta
	player.move_and_slide()
