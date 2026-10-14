extends Control

func _ready() -> void:
	
	for btn in $BG/C/VB.get_children():
		btn.disabled = true
		btn.mouse_entered.connect(func():
			var tw = create_tween()
			tw.tween_property(btn, "offset_transform_scale", Vector2(1.1, 1.1), 0.1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CIRC)
		)
		
		btn.mouse_exited.connect(func():
			var tw = create_tween()
			tw.tween_property(btn, "offset_transform_scale", Vector2(1, 1), 0.1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CIRC)
		)
	
	$BG/C/VB/PlayButton.pressed.connect(func(): get_tree().change_scene_to_file("res://scenes/proto.tscn"))
	$BG/C/VB/ExitButton.pressed.connect(func(): get_tree().quit())
	
	$AnimationPlayer.animation_finished.connect(func(anim_name): 
		for btn in $BG/C/VB.get_children():
			btn.disabled = false
	)
