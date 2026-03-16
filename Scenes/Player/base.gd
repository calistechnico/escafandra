extends State
class_name Base

@export var base_health = 100
@export var base_oxigen = 120
@export var base_speed = 400.0
var acceleration = 100.0
@export var SPEED = 400.0
@export var JUMP_VELOCITY = -550.0
var direction = 0

@onready var player: CharacterBody2D = $"../.."
@onready var health_bar: ProgressBar = $"../../UI/HBoxContainer/VBoxContainer/HealthBar"
@onready var oxigen_bar: ProgressBar = $"../../UI/HBoxContainer/VBoxContainer/OxigenBar"
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var no_oxigen_timer: Timer = $"../../NoOxigenTimer"


func _ready() -> void:
	player.health = base_health
	player.oxigen = base_oxigen
	oxigen_bar.max_value = base_oxigen
	health_bar.max_value = base_health

func Update(_delta):
	health_bar.value = player.health
	oxigen_bar.value = player.oxigen
	if player.oxigen <= 0:
		if no_oxigen_timer.is_stopped():
			no_oxigen_timer.start()
	if player.health <= 0:
		Transitioned.emit(self, "Death")
	

func Unhandled_Input(event):
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	if direction.x < 0:
		animated_sprite_2d.flip_h = true
	if direction.x > 0:
		animated_sprite_2d.flip_h = false
	#if direction:
		#Transitioned.emit(self, "Swim")
	#else:
		#Transitioned.emit(self, "Idle")
		
	if player.is_on_floor() or player.is_on_wall() or player.is_on_ceiling():
		if Input.is_action_just_pressed("ui_accept"):
			Transitioned.emit(self, "Jump")
	if Input.is_action_just_pressed("attack"):
		Transitioned.emit(self, "Attack")
	

func Physics_Update(_delta: float):
	
	if not player.is_on_floor() and not player.is_on_wall() and not player.is_on_ceiling():
		SPEED = base_speed
		
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * _delta
		
	player.move_and_slide()
	

func _on_oxigen_timer_timeout() -> void:
	#print_debug("oxigen timeout")
	if player.oxigen > 0:
		player.oxigen -= 1
	


func _on_no_oxigen_timer_timeout() -> void:
	if player.oxigen <= 0:
		player.health -= 10
	else:
		no_oxigen_timer.stop()
	
