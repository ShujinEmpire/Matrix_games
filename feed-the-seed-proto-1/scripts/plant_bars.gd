extends Control

@onready var game: Node2D = $".."
@onready var health_bar = $health_bar
@onready var hydrate_bar = $hydration_bar
@onready var health_bar_val = $health_bar/health_label2
@onready var hydrate_bar_val = $hydration_bar/hydration_label2
@onready var growth_bar: TextureProgressBar = $temp_growth
@onready var growth_bar_val: Label = $growth_num

func set_growth_max(new_max : int) -> void:
	growth_bar.max_value = new_max

func update_bars(health: int, hydration: int, growth: int) -> void:
	health_bar.value = health
	health_bar_val.text = str(health)
	hydrate_bar.value = hydration
	hydrate_bar_val.text = str(hydration)
	growth_bar.value = growth
	growth_bar_val.text = str(growth) + "/" + str(game.get_max_growth())
