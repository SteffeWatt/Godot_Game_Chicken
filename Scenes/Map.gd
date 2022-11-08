extends Node

export(PackedScene) var mob_scene

#define how many chickens we want to spawn
var chickenNumber = 20
#The current 'wave' we are on
var waveNo = 1
# Called when the node enters the scene tree for the first time.

func startScene():
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
	
	$WaveTimer.start(25)
	

func _ready():
	
	startScene();
	
	#Spawn in chickens 
	#var mob = mob_scene.instance
	#Set its position
	#mob.position.x = randi() % screenWidth
	#mob.position.y = randi() % screenHeight
	#Spawn it
	#add_child(mob)
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#check if all of the chickens have been collected
	if chickenNumber == $DropZone.capturedChickenCount && waveNo == 2:
		get_tree().change_scene("res://Scenes/Victory royale.tscn")
		
		#print("Winner!")
		#pass
	if chickenNumber == $DropZone.capturedChickenCount && waveNo == 1:
		chickenNumber = 200;
		startScene()
		$WaveTimer.start(10)
	
	
	$Label.text = "PROTOTYPE DEMO " + str($WaveTimer.time_left)
	if $WaveTimer.time_left == 0:
		get_tree().change_scene("res://Scenes/Failure.tscn")
