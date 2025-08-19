extends MPFSlide

var scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  scene = preload("res://widgets/bumpers.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  pass


func top_down_text(_settings, _kwargs):
  var instance = scene.instantiate()
  # instance.position = Vector2("50,0")
  add_child (instance)
  #$zedmd/AnimationPlayer.play("top_down")
