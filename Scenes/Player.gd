extends Area2D

#Define the signals here if needed

#Set the player speed variable and make slideable
export var speed = 400
var screen_size
var inRange = false
var canInteract = true

#function to set the player position when starting the game
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false #Don't know why we do this, wtf

#Handles picking up chicken... lol
func pickUp():
	canInteract = false
	#Update the chicken position to be on the player's head, idk how tho
	
	
	
#function called on loading
func _ready():
	#Has the player not in the corner lol
	position.x = 200
	position.y = 200
	screen_size = get_viewport_rect().size
	#Initialise the player as being able to interact with chickens
	var canInteract = true
	#Since the player is not currently near any chickens, set inrange to false
	var inRange = false
	
#function called on each frame
func _process(delta):
	var velocity = Vector2.ZERO 
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	#Bit for picking up chicken
	if inRange && canInteract:
		#Call the pick up function and pass the chicken instance
		pass
	
	
	
	#Prevents diagonal movement speedhax
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	#Prevents player from leaving the bounds
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	#Flips the character orientation if moving to the left, done to save time xd
	if velocity.x != 0:
		$AnimatedSprite.flip_h = velocity.x < 0



#IF THE PLAYER IS NEAR A CHICKEN, LATER UPDATE TO CHECK IF THE AREA IS A CHICKEN OR A DROP-OFF POINT
func _on_Player_area_entered(area):
	print(area.get_name())
	var myTempVar = area.get_name()
	if myTempVar == "Chicken":
		print('so true')
		
	
	
			
	#If area is equal to chicken then set inRange to true
	
	#Else set onExit to true

#IF THE PLAYER IS NOT NEAR A CHICKEN, LATER UPDATE TO CHECK IF THE AREA IS A CHICKEN OR A DROP-OFF POINT
func _on_Player_area_exited(area):
	#If area is equal to chicken then set inRange to false
	inRange = false
	#else set on exit to false


func _on_Chicken_area_entered(area):
	pass # Replace with function body.
