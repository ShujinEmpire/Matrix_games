extends Control

@onready var feed_label: Label = $FeedButton/feed_label
@onready var water_label: Label = $WaterButton/water_label
@onready var care_label: Label = $CareButton/care_label
@onready var feed: TextureButton = $FeedButton
@onready var water: TextureButton = $WaterButton
@onready var care: TextureButton = $CareButton
@onready var game: Node2D = $".."
@onready var coins : int
@onready var plant_health : int
@onready var plant_hydrate : int
@onready var plant_growth : int
@onready var click: AudioStreamPlayer2D = $"../click"


func _on_feed_button_pressed() -> void:
	click.play()
	coins = game.get_coins()
	plant_growth = game.get_growth()
	
	if coins < 10:
		return
	if plant_growth == 100:
		return
		
	game.add_growth(10)
	game.sub_coins(10)
	

func _on_feed_button_mouse_entered() -> void:
	if feed.disabled:
		return
	else:
		feed_label.add_theme_color_override("font_color", Color.WHITE)


func _on_feed_button_mouse_exited() -> void:
	feed_label.add_theme_color_override("font_color", Color("373c29"))




func _on_water_button_pressed() -> void:
	click.play()
	coins = game.get_coins()
	plant_hydrate = game.get_hydrate()
	if coins <= 0:
		return
	elif plant_hydrate == 100:
		return 

	game.add_hydrate(15)
	game.sub_coins(5)


func _on_water_button_mouse_entered() -> void:
	if water.disabled:
		return
	else:
		water_label.add_theme_color_override("font_color", Color.WHITE)


func _on_water_button_mouse_exited() -> void:
	water_label.add_theme_color_override("font_color", Color("373c29"))




func _on_care_button_pressed() -> void:
	click.play()
	print("Care")


func _on_care_button_mouse_entered() -> void:
	if care.disabled:
		return
	else:
		care_label.add_theme_color_override("font_color", Color.WHITE)


func _on_care_button_mouse_exited() -> void:
	care_label.add_theme_color_override("font_color", Color("373c29"))
