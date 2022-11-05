extends Node

export(PackedScene) var mob_scene



# Called when the node enters the scene tree for the first time.
func _ready():
	#Spawn in chickens 
	var mob = mob_scene.instance()
	#Set its position
	mob.position.x = 400
	mob.position.y = 200
	#Spawn it
	add_child(mob)
	
	var mob2 = mob_scene.instance()
	mob2.position.x = 200
	mob2.position.y = 400
	add_child(mob2)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
