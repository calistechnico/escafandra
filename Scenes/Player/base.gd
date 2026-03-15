extends State
class_name Base

@export var health = 100
var oxigen = 1000
var base_speed = 400.0
var acceleration = 100.0
var SPEED = 400.0
const JUMP_VELOCITY = -550.0
var direction = 0

@onready var player: CharacterBody2D = $"../.."
@onready var health_bar: ProgressBar = $"../../UI/HBoxContainer/VBoxContainer/HealthBar"
@onready var oxigen_bar: ProgressBar = $"../../UI/HBoxContainer/VBoxContainer/OxigenBar"


func Update(_delta):
	if health <= 0:
		Transitioned.emit(self, "Death")

func Unhandled_Input(event):
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	if direction:
		Transitioned.emit(self, "Swim")
	else:
		Transitioned.emit(self, "Idle")
		
	if player.is_on_floor() or player.is_on_wall() or player.is_on_ceiling():
		if Input.is_action_just_pressed("ui_accept"):
			Transitioned.emit(self, "Jump")
	

func Physics_Update(_delta: float):
	if not player.is_on_floor() and not player.is_on_wall() and not player.is_on_ceiling():
		SPEED = base_speed
		
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * _delta
		
	player.move_and_slide()
	

func _on_hit_area_area_entered(area: Area2D) -> void:
	if area.name == "DamageArea":
		print_debug("hola martina")
		Transitioned.emit(self, "Hit")
		
