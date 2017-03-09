class View
	def self.print_list(list)
		list.each do |task|
      task[2] == "true" ? state = "\u2714" : state = "\u2620"#"\u2717"  2620
      printf "    %-3s %s\n", state, "#{task[0]}.  #{task[1]}"
    end
	end
end