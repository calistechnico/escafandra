extends Base
class_name Hit

@onready var hit_recovery_timer: Timer = $"../../HitRecoveryTimer"

func Enter():
	#print_debug("hit entered")
	animated_sprite_2d.play("hit")
	player.health -= 20
	

func Exit():
	if direction:
		Transitioned.emit(self, "Swim")
	else:
		Transitioned.emit(self, "Idle")
	

func Update(_delta):
	super(_delta)
	


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "hit":
		hit_recovery_timer.start()


func _on_hit_recovery_timer_timeout() -> void:
	Exit()
	

func _on_collect_area_body_entered(body: Node2D) -> void:
	if body.name == "Bubble":
		player.oxigen += 30
