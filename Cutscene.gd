extends CanvasLayer

@onready var Overlordlabel = get_node("Overlord TEXT Label")
@onready var Kinglabel = get_node("King TEXT Label")

func type_Overlord(Text):
	Overlordlabel.visible_ratio = 0
	Overlordlabel.text = Text
	var tween = create_tween()
	tween.tween_property(Overlordlabel, "visible_ratio",1,1)
	if "vengance" in Text:
		tween.tween_callback(show_control)
		

func type_King(Text):
	Kinglabel.visible_ratio = 0
	Kinglabel.text = Text
	var tween = create_tween()
	tween.tween_property(Kinglabel, "visible_ratio",1,1)
	
		
func show_control():
	get_node("Control").show
	

func _on_next_pressed() -> void:
	


func _on_skip_pressed() -> void:
	pass # Replace with function body.
