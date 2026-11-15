@tool
extends Node2D

var _radius : float = 1.0
var _time : float = 0

func _process(delta : float):
  _time += delta
  _radius = abs(sin(_time) * 128)
  queue_redraw()
  
func _draw():
  draw_circle(Vector2(64, 16), _radius, Color.html("fff85b"), false, 3)
