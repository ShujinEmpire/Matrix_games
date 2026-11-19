extends Node2D

var day:int = 1
var button_type = null
var prob:float 

@onready var coins : int
@onready var fade_scream: AnimationPlayer = $fade_transition/fade_scream
@onready var click: AudioStreamPlayer2D = $click
@onready var button_manager: Control = $button_manager2
@onready var plant_health : int
@onready var plant_growth_max : int
@onready var plant_hydrate : int
@onready var plant_growth : int
@onready var plant_is_seed : bool
@onready var plant_is_sprout : bool
@onready var plant_is_grown : bool
@onready var day_label: Label = $day_label
@onready var plant: Node2D = $plant
@onready var game_ui: Control = $GameUI
@onready var shop: Button = $button_manager2/shop
@onready var advance_day: Button = $button_manager2/advance_day
@onready var feed: TextureButton = $GameUI/FeedButton
@onready var water: TextureButton = $GameUI/WaterButton
@onready var care: TextureButton = $GameUI/CareButton
@onready var plant_bars: Control = $plant_bars



func _ready() -> void:
	coins = 100
	plant_health = 100
	plant_hydrate = 100
	plant_growth_max = 100
	plant_growth = 0
	plant_is_seed = true
	plant_is_sprout = false
	print(str(prob)) 
	day_label.text = "Day: " + str(day)
	$plant_bars.update_bars(plant_health, plant_hydrate, plant_growth)
	$coin_panel/coins_count.text = str(coins)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_coins() -> int:
	return coins

func add_coins(from_coins: int) -> void:
	coins += from_coins
	coins = clamp(coins, 0, 1000)
	$coin_panel/coins_count.text = str(coins)


func sub_coins(from_coins: int) -> void:
	coins -= from_coins
	coins = clamp(coins, 0, 1000)
	$coin_panel/coins_count.text = str(coins)



func add_health(health: int) -> void:
	plant_health += health
	plant_health = clamp(plant_health,0,100)
	$plant_bars.update_bars(plant_health, plant_hydrate, plant_growth)

func get_health() -> int:
	return plant_health


func add_hydrate(hydrate: int) -> void:
	plant_hydrate += hydrate
	plant_hydrate = clamp(plant_hydrate,0,100)
	$plant_bars.update_bars(plant_health, plant_hydrate, plant_growth)

func get_hydrate() -> int:
	return plant_hydrate

func add_growth(growth: int) -> void:
	plant_growth += growth
	plant_growth = clamp(plant_growth, 0, plant_growth_max)
	$plant_bars.update_bars(plant_health, plant_hydrate, plant_growth)

func get_growth() -> int:
	return plant_growth

func get_max_growth() -> int:
	return plant_growth_max

func _on_fade_timer_timeout() -> void:
	day += 1
	
	if plant_hydrate <= 80 and plant_hydrate > 50:
		plant_health -= 5
	elif plant_hydrate <= 50 and plant_hydrate > 30:
		plant_health -= 10
	elif plant_hydrate <= 30 and plant_hydrate >= 0:
		plant_health -= 15
	
	if plant_growth >= 0 and plant_growth <= 29:
		plant_hydrate -= 20
		plant_growth += 5
	elif plant_growth >= 30 and plant_growth <= 60:
		plant_hydrate -= 15
		plant_growth += 3
	elif plant_growth >= 61 and plant_growth <= 80:
		plant_hydrate -= 10
		plant_growth += 2
	elif plant_growth > 80 and plant_growth <= 100:
		plant_hydrate -= 5
		plant_growth += 1
	
	
	if plant_health <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	
	day_label.text = "Day: " + str(day)

	if plant_growth >= plant_growth_max and plant_is_seed:
		plant.plant_sprout()
		plant_growth = 0
		plant_is_sprout = true
		add_health(100)
		plant_is_seed = false
		plant_growth_max = 150
		plant_bars.set_growth_max(plant_growth_max)
	
	
	plant_hydrate = clamp(plant_hydrate,0,100)
	$plant_bars.update_bars(plant_health, plant_hydrate, plant_growth)
	
	prob = button_manager.get_prob()
	if prob > 0 and prob <= .1:
		fade_scream.play("fade_out")
		await fade_scream.animation_finished
		$fade_transition.hide()
		shop.disabled = false
		advance_day.disabled = false
		feed.disabled = false
		water.disabled = false
		care.disabled = false
	else:
		$fade_transition/fade_animation.play("fade_out")
		await $fade_transition/fade_animation.animation_finished
		$fade_transition.hide()
		shop.disabled = false
		advance_day.disabled = false
		feed.disabled = false
		water.disabled = false
		care.disabled = false



func _on_exit_shop_pressed() -> void:
	click.play()
	$Background.modulate = 'ffffff'
	plant.show()
	$shop_panel.hide()
	button_manager.visible = true
	game_ui.show()
	$settings2.show()


func _on_settings_pressed() -> void:
	click.play()
	button_manager.hide()
	game_ui.hide()
	$settings.show()
