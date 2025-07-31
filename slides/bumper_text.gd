extends Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  text = "Bumper !"
  pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  pass


func slide_text(settings, kwargs):
  text = "Saint Seiya !"
  var i = 0
  while i < 4 :
    i = (i+1)
    position.y = 2 * i
    text = "Bumper " + i
    await get_tree().create_timer(1).timeout
  position.y = -32
