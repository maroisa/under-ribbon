extends Control


func _ready() -> void:
	$BG/M/MainTab.show()
	$BG/M/SettingsTab.hide()
	
	for child in $BG/M/MainTab/C/VB.get_children():
		child.mouse_entered.connect(func():
			create_tween().tween_property(child, "scale", Vector2(1.1, 1.1), 0.05))
		child.mouse_exited.connect(func():
			create_tween().tween_property(child, "scale", Vector2(1, 1), 0.05))

	$BG/M/MainTab/C/VB/ExitButton.pressed.connect(func():
		get_tree().quit())
	
	$BG/M/MainTab/C/VB/SettingButton.pressed.connect(func():
		$BG/M/MainTab.hide()
		$BG/M/SettingsTab.show())
	
	$BG/M/MainTab/C/VB/StartButton.pressed.connect(func():
		Transitioner.fade_to("res://scenes/scene1.tscn"))
	
	$BG/M/SettingsTab/BackButton.pressed.connect(func():
		$BG/M/MainTab.show()
		$BG/M/SettingsTab.hide())
	
	$BG/M/SettingsTab/Fullscreen/CheckButton.toggled.connect(func(toggled_on: bool):
		if toggled_on:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			return
		
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED))
