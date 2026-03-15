extends Base
class_name Swim

var dash = false

func Enter():
	print_debug("enter swim")
	

func Exit():
	pass
	#Tranddasitioned.emit(self, "Idle")
		

func Unhandled_Input(event):
	super(event)
	if Input.is_action_pressed("dash"):
		dash = true
	else:
		dash = false
	

func Physics_Update(_delta: float):
	super(_delta)
	
	if dash:
		SPEED = base_speed * 3
	else:
		SPEED = base_speed
	
	if direction:
		player.velocity = lerp(player.velocity, direction * SPEED, _delta)
	else:
		Exit()
		

func _on_hit_area_area_entered(area: Area2D) -> void:
	if area.name == "DamageArea":
		print_debug("hola martina")
		Transitioned.emit(self, "Hit")
