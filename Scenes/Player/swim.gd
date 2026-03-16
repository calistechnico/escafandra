extends Base
class_name Swim

var dash = false
@onready var swim_oxigen_timer: Timer = $"../../SwimOxigenTimer"


func Enter():
	#print_debug("enter swim")
	animated_sprite_2d.play("swim")

func Exit():
	pass
	#Tranddasitioned.emit(self, "Idle")
	

func Update(_delta):
	super(_delta)
	

func Unhandled_Input(event):
	super(event)
	if not direction:
		Transitioned.emit(self, "Idle")
	if Input.is_action_pressed("dash"):
		dash = true
		player.damage = 20
	else:
		player.damage = 10
		dash = false
	

func Physics_Update(_delta: float):
	super(_delta)
	
	if dash and player.oxigen > 0: 
		SPEED = base_speed * 2
		if swim_oxigen_timer.is_stopped():
			swim_oxigen_timer.start()
	else:
		SPEED = base_speed
		swim_oxigen_timer.stop()
	
	if player.is_on_floor() or player.is_on_wall() or player.is_on_ceiling():
		SPEED = base_speed * 2
	
	if direction:
		player.velocity = lerp(player.velocity, direction * SPEED, _delta)
	else:
		Exit()
		

func _on_hit_area_area_entered(area: Area2D) -> void:
	if area.name == "DamageArea":
		#print_debug("hola martina")
		Transitioned.emit(self, "Hit")
		

func _on_swim_oxigen_timer_timeout() -> void:
	if player.oxigen > 0:
		player.oxigen -= 2
	

func _on_collect_area_area_entered(area: Area2D) -> void:
	if area.name == "BubbleArea":
		player.oxigen = min(120, player.oxigen + 30)
		
