class App::Name
  VERSION = "0.1.0"
  property name : String
	def initialize(name : String? = nil)
# @name = name || self.exec_name	-> leads to compile-time exception
		@name = name || self.class.exec_name
	end
	
	def to_s
		"#{@name} [#{Process.pid}]"
	end
	
	def to_s(io : IO)	
		io << @name << " [" << Process.pid << "]"
	end
	
	def self.exec_name
		if path = Process.executable_path
			path[((path.rindex("/") || -1) + 1)..-1].gsub(/(?:^crystal-run-|\.tmp$)/,"")
		else
			"UNKNOWN"
		end
	end
end
