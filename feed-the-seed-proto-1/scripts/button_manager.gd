extends Control

@onready var click: AudioStreamPlayer2D = $"../click"
@onready var button_manager: Control = $"."
@onready var plant: Node2D = $"../plant"
@onready var prob: float
@onready var game: Node2D = $".."
@onready var game_ui: Control = $"../GameUI"
@onready var shop: Button = $shop
@onready var advance_day: Button = $advance_day
@onready var settings: Button = $"../settings2"
@onready var feed: TextureButton = $".."/GameUI/FeedButton
@onready var water: TextureButton = $".."/GameUI/WaterButton
@onready var care: TextureButton = $".."/GameUI/CareButton

func _on_shop_pressed() -> void:
	click.play()
	$"../Background".modulate = 'afafaf'
	plant.hide()
	$"../shop_panel".show()
	button_manager.visible = false
	game_ui.hide()
	settings.hide()


func _on_advance_day_pressed() -> void:
	prob = randf()
	print(str(prob))
	click.play()
	shop.disabled = true
	advance_day.disabled = true
	feed.disabled = true
	water.disabled = true
	care.disabled = true
	$"../fade_transition".show()
	$"../fade_transition/fade_animation".play("fade_in")
	$"../fade_transition/fade_timer".start()

func get_prob() -> float:
	return prob
