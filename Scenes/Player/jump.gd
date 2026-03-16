extends Base
class_name Jump

@onready var jdbt: Timer = $"../../JumpDamageBoostTimer"

func Enter():
	#print_debug("enter jump")
	animated_sprite_2d.play("jump")
	player.damage = 20
	jdbt.start()
	
	if player.is_on_floor():
		player.velocity.y = JUMP_VELOCITY
	if player.is_on_wall():
		var jump_direction = player.get_wall_normal()
		if jump_direction.x < 0:
			animated_sprite_2d.flip_h = true
		if jump_direction.x > 0:
			animated_sprite_2d.flip_h = false
		player.velocity.x = jump_direction.x * -JUMP_VELOCITY
	if player.is_on_ceiling():
		player.velocity.y = -JUMP_VELOCITY
		

func Exit():
	if direction:
		Transitioned.emit(self, "Swim")
	else:
		Transitioned.emit(self, "Idle")
		

func Update(_delta: float):
	super(_delta)
	#Exit()
	

func Unhandled_Input(event):
	super(event)
	

func Physics_Update(_delta: float):
	super(_delta)
	

func _on_jump_damage_boost_timer_timeout() -> void:
	player.damage = 10
	


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "jump":
		Exit()
		

func _on_collect_area_body_entered(body: Node2D) -> void:
	if body.name == "Bubble":
		player.oxigen += 30
