class InvalidAppNameException < Exception
end

class AppName
  VERSION            = "0.3.0"
  FAIL_TO_GUESS_NAME = "UNKNOWN"

  @@single = AppName.new
  property name : String
  @is_unknown : Bool = false

  def self.exec_name
    @@single.name
  end
  
  def initialize(name : String? = nil)
    @name = name || exec_name
  end

  def to_s
    "#{@name} [#{Process.pid}]"
  end

  def to_s(io : IO)
    io << @name << " [" << Process.pid << "]"
  end

  def name=(new_name : String)
    raise InvalidAppNameException.new("application name can not be empty string") unless new_name.size > 0
    raise InvalidAppNameException.new("application name could not contain any of this symbols: [, ], /") if new_name =~ /[\[\]\/]/
    @name = new_name
  end
  
  def is_unknown?
    @is_unknown
  end

  def exec_name
    if path = Process.executable_path
      path[((path.rindex("/") || -1) + 1)..-1].gsub(/(?:^crystal-run-(?!spec\.tmp$)|\.tmp$)/, "")
    else
      @is_unknown = true
      FAIL_TO_GUESS_NAME
    end
  end
end
