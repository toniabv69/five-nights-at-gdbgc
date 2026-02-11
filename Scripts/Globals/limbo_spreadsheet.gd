extends Node

var patterns: Dictionary = {
  "TL": {
	"D, R, U, v/v": "Yellow",
	"R, v/v, U, ^/^": "Mint",
	"R, v/v, U, BR": "Yellow",
	"R, D, D, D": "Pink",
	"R, v/v, U, v\\v": "Red",
	"D, R, U, L": "Yellow",
	"D, v\\v, D, L": "Yellow",
	"R, D, U, D": "Blue",
	"R, L, D, v\\v": "Pink",
	"O, R, D, v/v": "Purple",
	"D, ^/^, L, R": "Red",
	"R, L, D, D": "Purple",
	"R, v/v, D, R": "Red",
	"R, BL, U, ^/^": "Mint",
	"R, L, D, R": "Pink",
	"D, D, v\\v, U": "Red"
  },

  "TR": {
	"D, U, L, R": "Red",
	"D, U, L, R, L": "Red",
	"D, v/v, U, U": "Mint",
	"D, L, U, D": "Purple",
	"D, v/v, ^/^, ^\\^": "Yellow",
	"L, D, R, U": "Red",
	"L, R, v/v, U": "Pink",
	"D, ^\\^, D, v\\v": "Yellow",
	"L, D, D, v\\v": "Lime",
	"v/v, U, R, L": "Red",
	"L, v\\v, v/v, ^/^": "Pink",
	"D, U, L, D": "Blue",
	"D, ^\\^, D, U": "Lime",
	"D, U, D, U": "Purple",
	"L, D, v\\v, U": "Purple"
  },

  "M TL": {
	"D, D, R, L, U": "Purple",
	"v\\v, U, U, v/v": "Lime",
	"U, R, D, U": "Lime",
	"v\\v, D, L, TR": "Yellow",
	"U, O, R, v/v": "Cyan",
	"D, R, L, D": "Purple",
	"^/^, D, v/v, R": "Cyan",
	"U, R, L, R": "Cyan",
	"R, U, L, R": "Purple",
	"^/^, D, L, ^/^": "Blue",
	"R, ^\\^, D, U": "Purple",
	"v\\v, U, U, L": "Red",
	"U, v\\v, D, D": "Cyan",
	"U, D, D, D": "Red",
	"D, D, O, R": "Blue"
  },

  "M TR": {
	"D, L, D, ^/^": "Blue",
	"^\\^, BR, L, ^/^": "Yellow",
	"L, U, R, BL": "Cyan",
	"^\\^, R, D, D": "Blue",
	"L, ^/^, v/v, ^/^": "Lime",
	"U, L, D, R": "Lime",
	"v/v, v\\v, L, U": "Mint",
	"D, ^\\^, R, ^\\^": "Red",
	"L, R, U, D": "Mint",
	"v/v, D, U, ^/^": "Cyan",
	"U, v/v, ^/^, v/v": "Yellow",
	"^\\^, D, R, U": "Mint",
	"L, ^/^, D, L": "Yellow",
	"L, D, D, R": "Yellow",
	"U, D, ^\\^, D": "Mint"
  },

  "M BL": {
	"D, R, U, D": "Pink",
	"v\\v, U, D, L": "Blue",
	"R, D, L, U": "Red",
	"v\\v, L, U, D": "Lime",
	"D, ^/^, D, ^\\^": "Purple",
	"D, U, D, R": "Mint",
	"^/^, ^\\^, R, D": "Red",
	"U, v\\v, L, v\\v": "Purple",
	"R, D, U, ^\\^": "Cyan",
	"^/^, L, U, D": "Mint",
	"R, v/v, ^/^, D": "Mint",
	"v\\v, U, D, U": "Cyan",
	"D, ^/^, D, L": "Blue",
	"D, R, TL, D": "Mint",
	"D, TR, D, U": "Yellow"
  },

  "M BR": {
	"D, U, L, ^/^": "Cyan",
	"^\\^, U, D, U": "Pink",
	"D, L, U, U": "Blue",
	"^\\^, U, R, D": "Mint",
	"L, ^/^, v/v, v\\v": "Mint",
	"U, U, L, D": "Cyan",
	"v/v, O, ^/^, D": "Lime",
	"D, L, R, ^\\^": "Mint",
	"L, R, U, ^\\^": "Blue",
	"D, U, D, O": "Yellow",
	"D, ^\\^, ^/^, v/v": "Blue",
	"^\\^, D, R, U": "Yellow",
	"L, v\\v, TL, R": "Mint",
	"L, D, TR, L": "Cyan",
	"U, D, ^\\^, D": "Cyan"
  },

  "BL": {
	"TR, L, D, U": "Lime",
	"O, U, R, D": "Purple",
	"U, ^/^, D, U": "Pink",
	"U, R, D, TL": "Red",
	"R, L, ^/^, v/v": "Pink",
	"R, L, R, U": "Pink",
	"^/^, ^\\^, U, R": "Blue",
	"U, v\\v, U, ^\\^": "Pink",
	"R, L, R, ^\\^": "Yellow",
	"^/^, L, R, v/v": "Lime",
	"U, v\\v, O, L": "Cyan",
	"U, D, U, D": "Pink",
	"R, ^\\^, D, U": "Pink",
	"R, U, D, U": "Blue",
	"R, TL, R, L": "Pink"
  },

  "BR": {
	"TL, D, R, v/v": "Mint",
	"^\\^, U, R, v/v": "Cyan",
	"L, ^/^, D, U": "Purple",
	"L, U, U, D": "Cyan",
	"U, D, L, ^/^": "Blue",
	"U, D, U, L": "Blue",
	"O, ^\\^, ^/^, L": "Purple",
	"L, U, D, O, R": "Lime",
	"L, U, D, O, ^/^": "Red",
	"L, R, L, ^/^": "Pink",
	"L, ^/^, v/v, ^/^": "Lime",
	"L, R, L, R": "Lime",
	"U, v/v, TR, D": "Purple",
	"U, U, D, L": "Lime",
	"U, D, ^\\^, D": "Lime"
  }
}

func set_random_pattern():
	var random_key = patterns.keys().pick_random()
	var random_location = patterns[random_key]
	var random_pattern = random_location.keys().pick_random()
	var random_correct_key = random_location[random_pattern]
	CurrentNightData.current_limbo_pattern = {"pattern": random_key + ": " + random_pattern, "correct_key": random_correct_key}
	return CurrentNightData.current_limbo_pattern
