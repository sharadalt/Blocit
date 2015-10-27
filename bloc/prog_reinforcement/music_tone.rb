def pitch_class note
  note_num = {"A" => 9, "B" => 11, "C" => 0, "D" => 2, "E" => 4, "F" => 5, "G" => 7,"A#" => 10, "B#" => 0, "C#" => 1,"D#" => 3,"E#" => 5,"F#" => 6,"G#" => 8,"Ab" => 8, "Bb" => 10,"Cb" => 11,"Db" => 1,"Eb" => 3,"Fb" => 4,"Gb" =>6}

  if note_num.has_key?(note)
     puts note_num.fetch(note)
  else
     puts "note is not a valid note"
  end
end

pitch_class ARGV[0] 
