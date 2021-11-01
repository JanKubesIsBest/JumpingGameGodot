extends figure

class_name player

var input_x = 0
var input_y = 0
var jump_power = 0
var falling_time = 0
var height
var can_move = true
func _physics_process(delta):
	height = round(position.y * -1)
	if !can_move:
		velocity.x = 0
	#movement
	input_x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input_y = Input.is_action_just_released("ui_up")
	if is_on_floor() && can_move:
		velocity.x = input_x * speed
	if (input_y && is_on_floor()):
		velocity.y = jump_impulse * -jump_power
		velocity.x = speed * input_x
		#powering jump
	if (Input.is_action_pressed("ui_up") && is_on_floor()):
		can_move = false
		if jump_power < 10:
			jump_power += 0.5
	else:
		can_move = true
		jump_power = 0
	#wall
	if (is_on_wall()):
		velocity.x *= -1
