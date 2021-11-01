extends KinematicBody2D

class_name figure

export var gravity = 500
export var speed = 400
export var impulse = 300
export var jump_impulse = 60
var velocity = Vector2.ZERO
func _physics_process(delta):
	if (velocity.y < 500):
		velocity.y += gravity * delta
	move_and_slide(velocity, Vector2.UP)
