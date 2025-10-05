extends CanvasLayer

func set_time(time, night_length):
	var minutes = int(floor(fmod(time, 3600) / 60))
	var seconds = int(floor(fmod(time, 60)))
	var tenths = int(fmod(time, 1) * 10)
	var elapsed_hours = int(floor((time / night_length) * 6))
	$TimeLabel.text = ("12" if elapsed_hours == 0 else str(elapsed_hours)) + " AM"
	$MinutesLabel.text = str(minutes) + ":"
	$SecondsLabel.text = "%02d." % seconds
	$TenthsLabel.text = str(tenths)
