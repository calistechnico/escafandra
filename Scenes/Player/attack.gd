extends Base
class_name Attack

@onready var attack_area_cs: CollisionShape2D = $"../../AttackArea/CollisionShape2D"
@onready var attack_timer: Timer = $"../../AttackTimer"
@onready var attack_cooldown: Timer = $"../../AttackCooldown"

func Enter():
	animated_sprite_2d.play("attack")
	if attack_cooldown.is_stopped():
		attack_area_cs.disabled = false
		attack_timer.start()
		attack_cooldown.start()
	if player.oxigen > 0:
		player.oxigen -= 3
	

func Exit():
	if direction:
		Transitioned.emit(self, "Swim")
	else:
		Transitioned.emit(self, "Idle")

func _on_attack_timer_timeout() -> void:
	attack_area_cs.disabled = true
	

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "attack":
		Exit()
		
