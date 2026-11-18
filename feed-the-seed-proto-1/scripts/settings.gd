extends Panel


func _on_exit_settings_pressed() -> void:
	$"../click".play()
	$".".hide()
	$"../GameUI".show()
	$"../button_manager2".show()

func _on_quit_pressed() -> void:
	get_tree().quit()
