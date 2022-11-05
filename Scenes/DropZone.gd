extends Area2D

var capturedChickenCount = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DropZone_area_entered(area):
	var myTempVar = area.get_name()
	if myTempVar != "Player":
		capturedChickenCount = capturedChickenCount +1
		print(capturedChickenCount)
