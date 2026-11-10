extends Panel


func _on_exit_settings_pressed() -> void:
	$"../click".play()
	$".".hide()
	$"../button_manager".show()

func _on_quit_pressed() -> void:
	get_tree().quit()
