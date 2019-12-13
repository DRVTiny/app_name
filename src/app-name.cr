class InvalidAppName < Exception
end

class App::Name
  VERSION = "0.3.0"
  property name : String
	def initialize(name : String? = nil)
		@name = name || self.class.exec_name
	end
	
	def to_s
		"#{@name} [#{Process.pid}]"
	end
	
	def to_s(io : IO)	
		io << @name << " [" << Process.pid << "]"
	end
	
	def name=(new_name : String)		
		raise InvalidAppName.new("application name can not be empty string") unless new_name.size > 0
		raise InvalidAppName.new("application name could not contain any of this symbols: [, ], /") if new_name =~ /[\[\]\/]/
		@name = new_name
	end
	
	def self.exec_name
		if path = Process.executable_path
			path[((path.rindex("/") || -1) + 1)..-1].gsub(/(?:^crystal-run-(?!spec\.tmp$)|\.tmp$)/, "")
		else
			"UNKNOWN"
		end
	end
	
	
end
