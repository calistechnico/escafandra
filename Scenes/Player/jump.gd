extends Base
class_name Jump

func Enter():
	print_debug("enter jump")
	if player.is_on_floor():
		player.velocity.y = JUMP_VELOCITY
	if player.is_on_wall():
		player.velocity.x = player.get_wall_normal().x * -JUMP_VELOCITY
	if player.is_on_ceiling():
		player.velocity.y = -JUMP_VELOCITY
		

func Exit():
	if direction:
		Transitioned.emit(self, "Swim")
	else:
		Transitioned.emit(self, "Idle")
		

func Update(_delta: float):
	Exit()
	

func Unhandled_Input(event):
	super(event)
	

func Physics_Update(_delta: float):
	super(_delta)
	
