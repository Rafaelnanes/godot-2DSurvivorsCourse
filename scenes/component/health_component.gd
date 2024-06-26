extends Node
class_name HealthComponent

signal died

@export var max_health: float = 10

var current_health

func _ready():
	current_health = max_health
	

func damage(amount: float):
	current_health = max(current_health - amount, 0)
	Callable(died_check).call_deferred()
		
		
func died_check():
	if current_health == 0:
		died.emit()
		owner.queue_free()		
