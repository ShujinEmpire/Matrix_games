extends Node2D

var day:int = 1

var button_type = null

@onready var day_label: Label = $day_label

func _ready() -> void:
	day_label.text = "Day: " + str(day)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_shop_pressed() -> void:
	#modulate value: 'afafaf'
	$button_manager.modulate = 'afafaf'
	$Background.modulate = 'afafaf'
	$button_manager/shop.disabled = true
	$button_manager/advance_day.disabled = true
	$Panel.show()


func _on_advance_day_pressed() -> void:
	button_type = "advance_day"
	$fade_transition.show()
	$fade_transition/AnimationPlayer.play("fade_in")
	$fade_transition/fade_timer.start()

func _on_fade_timer_timeout() -> void:
	day += 1
	day_label.text = "Day: " + str(day)
	$fade_transition/AnimationPlayer.play("fade_out")
	await $fade_transition/AnimationPlayer.animation_finished
	$fade_transition.hide()


func _on_exit_shop_pressed() -> void:
	$button_manager.modulate = 'ffffff'
	$Background.modulate = 'ffffff'
	$Panel.hide()
	$button_manager/shop.disabled = false
	$button_manager/advance_day.disabled = false
