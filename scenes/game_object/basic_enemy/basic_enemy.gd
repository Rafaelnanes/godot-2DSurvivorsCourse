extends CharacterBody2D

const MAX_SPEED = 75

@onready var health_component: HealthComponent = $HealthComponent 

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.area_entered.connect(func(area2D: Area2D):
		health_component.damage(100)
		queue_free()
	)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_direction = get_direction_to_player()
	velocity = player_direction * MAX_SPEED
	move_and_slide()


func get_direction_to_player() -> Vector2:
	var player_node = get_tree().get_first_node_in_group("player") as Node2D
	if player_node == null:
		return Vector2.ZERO
	return (player_node.global_position - global_position).normalized()
	

	
