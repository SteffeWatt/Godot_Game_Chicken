extends Node

export(PackedScene) var mob_scene

#define how many chickens we want to spawn
var chickenNumber = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var screenWidth = 1080
	var screenHeight = 720
	
	#For loop to spawn in a crap ton of chickens 
	for i in chickenNumber - 1:
		var mob = mob_scene.instance()
		#Set its position
		mob.position.x = randi() % screenWidth
		mob.position.y = randi() % screenHeight
		#Spawn it
		add_child(mob)
		
	
	#Spawn in chickens 
	#var mob = mob_scene.instance()
	#Set its position
	#mob.position.x = randi() % screenWidth
	#mob.position.y = randi() % screenHeight
	#Spawn it
	#add_child(mob)
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#check if all of the chickens have been collected
	if chickenNumber == $DropZone.capturedChickenCount:
		get_tree().change_scene("res://Scenes/Victory royale.tscn")
		#print("Winner!")
		pass
		
