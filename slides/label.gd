extends Label

var exemple_text = "Saint Seiya !"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  scroll_text(exemple_text) 

func scroll_text(input_text:String) -> void:
  visible_characters = 0
  text = input_text	
  var i = 0
  while true:
    i = (i+1)%(input_text.length()+1)
    visible_characters = i
    await get_tree().create_timer(0.2).timeout
    
