extends Node

func transform_current_time_to_timestamp():
	var result = ""
	var elapsed_hours = int(floor((CurrentNightData.time_elapsed / CurrentNightData.night_time) * 6))
	var exact_elapsed_hours = (CurrentNightData.time_elapsed / CurrentNightData.night_time) * 6
	var elapsed_minutes = int(floor((exact_elapsed_hours - int(floor(exact_elapsed_hours))) * 60))
	result += ("12" if elapsed_hours == 0 else str(elapsed_hours)) + ':'
	result += ("%02d" % elapsed_minutes)
	result += " AM"
	return result
