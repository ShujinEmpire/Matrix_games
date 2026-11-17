extends Control


@onready var health_bar = $health_bar
@onready var hydrate_bar = $hydration_bar
@onready var health_bar_val = $health_bar/health_label2
@onready var hydrate_bar_val = $hydration_bar/hydration_label2
@onready var growth_bar: TextureProgressBar = $temp_growth
@onready var growth_bar_val: Label = $growth_num

func update_bars(health: int, hydration: int, growth: int) -> void:
	health_bar.value = health
	health_bar_val.text = str(health)
	hydrate_bar.value = hydration
	hydrate_bar_val.text = str(hydration)
	growth_bar.value = growth
	growth_bar_val.text = str(growth)
