extends MPFSlide

var scene
var _MPF

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  _MPF = MPF
  scene = preload("res://scenes/bumpers.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  pass


func random_post(_settings, _kwargs):
  # print("bumper score : " + $zedmd/MPFVariable.text)
  var instance = scene.instantiate()
  instance.get_node("Control/bumper_text").text =  "[outline_size=4][outline_color=#bc0b27][pulse freq=5 color=#fffffff ease=+3.0]" + _evaluate(_settings.tokens.text) +  "[/pulse][/outline_color][/outline_size]"
  instance.get_node("Control").position = Vector2(randf_range(-42,38), randf_range(-10,10))
  $zedmd.add_child(instance)
  await get_tree().create_timer(0.5).timeout
  instance.queue_free()


func _evaluate(command: String, variable_names = [], variable_values = []) -> String:
  if command.begins_with('='):
    command = command.substr(1)
    if command.contains('['): 
      command = command.replace('[', "str(_MPF.game.player.get('") # ~current_player.variables
      command = command.replace(']', "'))")
      
    var expression = Expression.new()
    var error = expression.parse(command, variable_names)
    if error != OK:
      push_error(expression.get_error_text())
      return command
    var result = expression.execute(variable_values, self)
    if not expression.has_execute_failed():
      return result     
  return command


func format_big_number(num_str: String)-> String:
  var result: String = ""
  var count: int = 0
  
  for i in range(num_str.length() - 1, -1, -1):
    result = num_str[i] + result
    count += 1
    if count % 3 == 0 and i != 0:
      result = "." + result
  return result
