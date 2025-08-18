extends MPFSlide


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  pass


func slide_text(_settings, _kwargs):
  var i = 0
  while i < 25 :
    i = (i+1)
    $zedmd/bumper_text.position.y += 1
    await get_tree().create_timer(0.02).timeout
  $zedmd/bumper_text.position.y = -24
