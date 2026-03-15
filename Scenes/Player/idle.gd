extends Base
class_name Idle

func Enter():
	print_debug("enter idle")
	

func Update(_delta):
	pass
	#if direction:
		#Transitioned.emit(self, "Swim")
		

func Unhandled_Input(event):
	super(event)
	

func Physics_Update(_delta: float):
	super(_delta)
	player.velocity.x = lerp(player.velocity.x, 0.0, _delta)
	

func _on_hit_area_area_entered(area: Area2D) -> void:
	if area.name == "DamageArea":
		print_debug("hola martina")
		Transitioned.emit(self, "Hit")
