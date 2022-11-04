extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var canBeHeld = true
export var speed = 50 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var inGameTimer = Timer.new()
var direction = 0
var lowerClampXBound = 0;
var lowerClampYBound = 0;
var upperClampXBound = 0;
var upperClampYBound = 0;
var rng = RandomNumberGenerator.new()






func _ready():
	screen_size = get_viewport_rect().size
	inGameTimer.connect("timeout",self,"do_this")
	inGameTimer.wait_time = 2
	inGameTimer.one_shot = false
	add_child(inGameTimer)
	inGameTimer.start(3)
	upperClampXBound = screen_size.x;
	upperClampYBound = screen_size.y;
	
	rng.randomize()
	
	position.x = 200
	position.y = 200



func do_this():
	direction = rng.randi_range(1,5)


func _process(delta):
	
	
	
	inGameTimer
	var velocity = Vector2.ZERO # The player's movement vector.
	
	
				
	if direction == 1:
		velocity.x += 1
		
	if direction == 2:
		velocity.x -= 1
		
	if direction == 3:
		velocity.y -= 1
		
	if direction == 4:
		velocity.y += 1
			
			
	if velocity.x != 0:
		$AnimatedSprite.flip_h = velocity.x < 0
		
	
	
	
	
			
			
	

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
		
		position += velocity * delta
		position.x = clamp(position.x, lowerClampXBound, upperClampXBound)
		position.y = clamp(position.y, lowerClampYBound, upperClampYBound)
		
	else:
		$AnimatedSprite.stop()

#func _process(delta):
#	pass
func _on_Chicken_area_entered(area):
	#position.x = get_node("Player").position.x
	#Change the position of the chicken to be on the area it is colliding with
	var myTempVar = area.get_name()
	if myTempVar == "DropZone":
		canBeHeld = false
		lowerClampXBound = area.position.x  
		lowerClampYBound = area.position.y
		upperClampXBound = area.position.x + 330
		upperClampYBound = area.position.y + 225
		
	if myTempVar == "Player" && canBeHeld:
		position.x = area.position.x + 40
		position.y = area.position.y
	

func _on_Chicken_area_exited(area):
	var myTempVar = area.get_name()
	if myTempVar == "Player" && canBeHeld:
		position.x = area.position.x + 40
		position.y = area.position.y
