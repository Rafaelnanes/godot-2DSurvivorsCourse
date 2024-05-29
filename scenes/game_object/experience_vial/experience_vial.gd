extends Node

func _ready():
	$Area2D.area_entered.connect(func(otherArea:Area2D):
		queue_free()
	)
