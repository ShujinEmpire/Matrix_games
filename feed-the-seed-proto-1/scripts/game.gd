extends Node2D

var day:int = 1
var button_type = null
var prob:float 

@onready var fade_scream: AnimationPlayer = $fade_transition/fade_scream
@onready var click: AudioStreamPlayer2D = $click
@onready var button_manager: Control = $button_manager
@onready var plant_health := 100
@onready var plant_hydrate := 100
@onready var day_label: Label = $day_label
@onready var plant: Node2D = $plant

func _ready() -> void:
	print(str(prob)) 
	day_label.text = "Day: " + str(day)
	$plant_bars.update_bars(plant_health, plant_hydrate)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_shop_pressed() -> void:
	#modulate value: 'afafaf'  
	#$button_manager.modulate = 'afafaf'
	#$button_manager/shop.disabled = true
	#$button_manager/advance_day.disabled = true
	click.play()
	button_manager.visible = false
	$Background.modulate = 'afafaf'
	plant.hide()
	$shop_panel.show()


func _on_advance_day_pressed() -> void:
	prob = randf()
	print(str(prob))
	button_type = "advance_day"
	click.play()
	$fade_transition.show()
	$fade_transition/fade_animation.play("fade_in")
	$fade_transition/fade_timer.start()

func _on_fade_timer_timeout() -> void:
	day += 1
	plant_health -= 10
	plant_hydrate -= 10
	if plant_health <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	day_label.text = "Day: " + str(day)
	$plant_bars.update_bars(plant_health, plant_hydrate)
	
	if prob > 0 and prob <= .1:
		fade_scream.play("fade_out")
		await fade_scream.animation_finished
		$fade_transition.hide()
	else:
		$fade_transition/fade_animation.play("fade_out")
		await $fade_transition/fade_animation.animation_finished
		$fade_transition.hide()


func _on_exit_shop_pressed() -> void:
	#$button_manager.modulate = 'ffffff'
	click.play()
	$Background.modulate = 'ffffff'
	plant.show()
	$shop_panel.hide()
	#$button_manager/shop.disabled = false
	#$button_manager/advance_day.disabled = false
	button_manager.visible = true
