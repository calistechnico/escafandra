extends Base
class_name Idle

func Enter():
	#print_debug("enter idle")
	animated_sprite_2d.play("idle")
	

func Update(_delta):
	super(_delta)
		

func Unhandled_Input(event):
	super(event)
	if direction:
		Transitioned.emit(self, "Swim")
	

func Physics_Update(_delta: float):
	super(_delta)
	player.velocity.x = lerp(player.velocity.x, 0.0, _delta)
	

func _on_hit_area_area_entered(area: Area2D) -> void:
	if area.name == "DamageArea":
		#print_debug("hola martina")
		Transitioned.emit(self, "Hit")

func _on_collect_area_body_entered(body: Node2D) -> void:
	if body.name == "Bubble":
		player.oxigen += 30
