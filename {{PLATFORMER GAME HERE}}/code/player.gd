extends RigidBody2D

@export var jumpForce := 500.0
@export var moveSpeed: int  = 10
@export var rate = 10
func _physics_process(_delta: float) -> void:
	movement()
		



func movement():
	if Input.is_action_pressed("right"):
		apply_central_impulse(Vector2(moveSpeed, 0))
	if Input.is_action_pressed("left"):
		apply_central_impulse(Vector2(-moveSpeed, 0))
	if Input.is_action_just_pressed("jump"):
		print("jump")
		linear_velocity.y = -jumpForce
	else:
		linear_velocity.move_toward(Vector2.ZERO, rate)
	
		

