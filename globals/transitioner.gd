extends CanvasLayer

func fade_to(scene: String):
	get_tree().paused = true
	$AnimationPlayer.play("fade")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(scene)
	$AnimationPlayer.play_backwards("fade")
	await $AnimationPlayer.animation_finished
	get_tree().paused = false
