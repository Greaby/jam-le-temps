extends KinematicBody2D

export (int) var MAX_SPEED = 500
export (int) var MAX_REVERSE_SPEED = 300
export (int) var ACCELERATION_FORCE = 20
export (int) var DECELERATION_FORCE = 40
const FRICTION_FORCE = .985
const WALL_FRICTION = .2

const MIN_ROTATION_SPEED = .5

const MASS = 25

var velocity = Vector2()
var is_reverse = false


func move():
	var engine_direction = int(Input.is_action_pressed("move_up")) - int(Input.is_action_pressed("move_down"))
	var force = ACCELERATION_FORCE if engine_direction > 0 else DECELERATION_FORCE
	 
	

	velocity += Vector2(engine_direction * force, 0).rotated(rotation)
	var speed = velocity.rotated(-rotation).x

	is_reverse = speed < 0
	
	if engine_direction == 0:
		velocity *= FRICTION_FORCE
		
	if velocity.length() < 15:
		velocity = Vector2()
	

func rotate():
	if velocity == Vector2():
		return

	var wheels = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	if is_reverse:
		wheels *= -1

	velocity += Vector2(0, wheels).rotated(rotation) * max(MIN_ROTATION_SPEED, velocity.length() / MASS)
	


func _physics_process(delta):
	move()
	rotate()
	var remain_velocity = move_and_slide(velocity.clamped(MAX_SPEED if not is_reverse else MAX_REVERSE_SPEED))
	
	velocity = velocity.linear_interpolate(remain_velocity, WALL_FRICTION)
	
	if not velocity == Vector2():
		rotation = velocity.angle() if not is_reverse else velocity.angle() + PI


