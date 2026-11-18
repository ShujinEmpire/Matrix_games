extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Background.position.x -= 50 * delta
	$Background2.position.x -= 50 * delta
	
 		#if $Background.position.x <= -1200:
 		#	$Background.position.x = 1200
 		#if $Background2.position.x <= -1200:
 		#	$Background2.position.x = 1200
