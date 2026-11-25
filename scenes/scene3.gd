extends CanvasLayer

@onready var next_scene = preload("res://scenes/scene4.tscn")

var dialogue = preload("res://assets/dialogue/scene3.dialogue")

signal on_submitted


func _ready() -> void:
	$BG.hide()
	$Overlay.hide()
	$Overlay/C/VB/InvalidLabel.hide()
	DialogueManager.show_dialogue_balloon(dialogue)
	$Overlay/C/VB/LineEdit.text_submitted.connect(submit_modal)

func show_modal():
	$BG.show()
	$Overlay.show()
	await on_submitted

func submit_modal(new_text: String):
	if new_text.length() < 3:
		$AnimationPlayer.play("invalid")
		return
	
	GameManager.username = new_text
	$BG.hide()
	$Overlay.hide()
	on_submitted.emit()

func end():
	Transitioner.fade_to(next_scene)
