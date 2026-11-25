extends CanvasLayer

func fade_to(scene: PackedScene):
	get_tree().paused = true
	$AnimationPlayer.play("fade")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_packed(scene)
	$AnimationPlayer.play_backwards("fade")
	await $AnimationPlayer.animation_finished
	get_tree().paused = false

func fade_to_node(scene: Node):
	get_tree().paused = true
	$AnimationPlayer.play("fade")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_node(scene)
	$AnimationPlayer.play_backwards("fade")
	await $AnimationPlayer.animation_finished
	get_tree().paused = false

func fade_only():
	$AnimationPlayer.play("fade")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play_backwards("fade")
