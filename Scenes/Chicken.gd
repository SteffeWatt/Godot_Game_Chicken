extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

export var speed = 200 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.




func _ready():
	screen_size = get_viewport_rect().size




func _process(delta):
	var isMoving = false
	var direction = randi() % 4
	var randomNymber = randi() % 6
	
	var velocity = Vector2.ZERO # The player's movement vector.
	
	if direction == 0 && isMoving == false:
		isMoving = true
		if randomNymber > 0:
			velocity.x += 1
			randomNymber -= delta
			
		else:
			isMoving = false
			
	
	if direction == 1 && isMoving == false:
		isMoving = true
		if randomNymber > 0:
			velocity.x -= 1
			randomNymber -= delta
			
		else:
			isMoving = false
		
	if direction == 2 && isMoving == false:
		isMoving = true
		if randomNymber > 0:
			velocity.y += 1
			randomNymber -= delta
			
		else:
			isMoving = false
			
	if direction == 3 && isMoving == false:
		isMoving = true
		if randomNymber > 0:
			velocity.y -= 1
			randomNymber -=delta
			
		else:
			isMoving = false
			
			
	

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
		
		position += velocity * delta
		position.x = clamp(position.x, 0, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)
		
	else:
		$AnimatedSprite.stop()

#func _process(delta):
#	pass
