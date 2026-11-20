extends CanvasLayer

var dialogue = preload("res://assets/dialogue/scene3.dialogue")

func _ready() -> void:
	$BG.hide()
	$Overlay.hide()
	DialogueManager.show_dialogue_balloon(dialogue)
	$Overlay/C/LineEdit.text_submitted.connect(submit_modal)

func show_modal():
	$BG.show()
	$Overlay.show()
	await $Overlay/C/LineEdit.text_submitted

func submit_modal(new_text: String):
	GameManager.username = new_text
	$BG.hide()
	$Overlay.hide()

func end():
	Transitioner.fade_to("res://scenes/scene4.tscn")
