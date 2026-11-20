extends Label

@export var shake_intensity := 4.0
@export var shake_speed := 30.0
@export var active := true

var _base_pos := Vector2.ZERO
var _time := 0.0

func _ready() -> void:
  _base_pos = position

func _process(delta: float) -> void:  
  if not active:
    position = _base_pos
    return
  _time += delta
  var interval := 1.0 / shake_speed
  
  if _time >= interval:
    _time = 0.0
    var offset := Vector2( randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)) * shake_intensity
    position = _base_pos + offset
