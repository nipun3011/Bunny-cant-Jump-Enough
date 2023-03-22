extends KinematicBody2D
var motion = Vector2(0,0)
const SPEED = 1200
const GRAVITY = 130
const JUMP = -2900
onready var Player = $AnimatedSprite

signal animate

func _physics_process(delta):
	OS.set_window_maximized(true)
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY
	motion.x = (Input.get_action_strength("right") - Input.get_action_strength("left")) * SPEED
	if Input.is_action_pressed("up") and is_on_floor():
		motion.y = JUMP
	if position.y > 4000:
		get_tree().change_scene("res://Scenes/GameOver.tscn")
#	print(GRAVITY," ",motion.y)
	move_and_slide(motion, Vector2(0,-1))
	emit_signal("animate", motion)

func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Scenes/Win.tscn")
