extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

export var speed = 100 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var inGameTimer = Timer.new()
var direction = 0




func _ready():
	screen_size = get_viewport_rect().size
	inGameTimer.connect("timeout",self,"do_this")
	
	inGameTimer.one_shot = false
	add_child(inGameTimer)
	inGameTimer.start(1.5)



func do_this():
	direction = randi() % 4


func _process(delta):
	
	
	
	
	var velocity = Vector2.ZERO # The player's movement vector.
	
	
				
	if direction == 0:
		velocity.x += 1
		
	if direction == 1:
		velocity.x -= 1
		
	if direction == 2:
		velocity.y -= 1
		
	if direction == 3:
		velocity.y += 1
			
			
	if velocity.x != 0:
		$AnimatedSprite.flip_h = velocity.x < 0
		
	
	
	
	
			
			
	

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
func _on_Chicken_area_entered(area):
	#position.x = get_node("Player").position.x
	#Change the position of the chicken to be on the area it is colliding with
	position.x = area.position.x + 50
	position.y = area.position.y
	

func _on_Chicken_area_exited(area):
	position.x = area.position.x + 50
	position.y = area.position.y
