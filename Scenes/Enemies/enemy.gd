extends CharacterBody2D

@export var move_speed = 200.0
@export var player: CharacterBody2D
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var damage_area: Area2D = $DamageArea
@onready var damage_area_cs: CollisionShape2D = $DamageArea/CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var health = 20

func _process(delta: float) -> void:
	if velocity.x < 0:
		animated_sprite_2d.flip_h = true
	if velocity.x > 0:
		animated_sprite_2d.flip_h = false
	if health <= 0:
		queue_free()
		

func _physics_process(delta: float) -> void:
	var current_position: Vector2 = self.global_transform.origin
	var next_path_position: Vector2 = navigation_agent_2d.get_next_path_position()
	var new_velocity: Vector2 = current_position.direction_to(next_path_position)
	navigation_agent_2d.velocity = new_velocity
	update_target_position(player.global_transform.origin)
	

func update_target_position(target: Vector2):
	navigation_agent_2d.target_position = target
	

func _on_hit_area_area_entered(area: Area2D) -> void:
	if area.name == "AttackArea":
		health -= player.damage
		

func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = velocity.move_toward(safe_velocity * move_speed, 12.0)
	move_and_slide()
	

func _on_damage_timer_timeout() -> void:
	damage_area_cs.disabled = true
	damage_area_cs.disabled = false
	
