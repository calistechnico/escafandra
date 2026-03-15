extends RigidBody2D

var health = 20

func _on_hit_area_area_entered(area: Area2D) -> void:
	if area.name == "AttackArea":
		health -= 10
		

func _process(delta: float) -> void:
	if health <= 0:
		print_debug("murio")
