extends HFlowContainer

func _ready() -> void:
  self._refresh_scores_and_ball(MPF.game.players.size())
  MPF.game.connect("player_added", self._refresh_scores_and_ball)


func _refresh_scores_and_ball(total_players: int) -> void:
  if total_players == 1:
        self.position = Vector2(1,25)
        self.alignment = ALIGNMENT_BEGIN
  else:
    var current_player_num = MPF.game.player.get("number")
    match current_player_num:
      1:
        $"../player_score1".visible=false
        $"../player_score2".visible=true
        $"../player_score3".visible=true
        $"../player_score4".visible=true
        self.position = Vector2(1,0)
        self.alignment = ALIGNMENT_BEGIN
      2:
          $"../player_score1".visible=true
          $"../player_score2".visible=false
          $"../player_score3".visible=true
          $"../player_score4".visible=true
          self.position = Vector2(1,0)
          self.alignment = ALIGNMENT_END
      3:
          $"../player_score1".visible=true
          $"../player_score2".visible=true
          $"../player_score3".visible=false
          $"../player_score4".visible=true
          self.position = Vector2(1,25)
          self.alignment = ALIGNMENT_BEGIN
      4:
          $"../player_score1".visible=true
          $"../player_score2".visible=true
          $"../player_score3".visible=true
          $"../player_score4".visible=false
          self.position = Vector2(1,25)
          self.alignment = ALIGNMENT_END
