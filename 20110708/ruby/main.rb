require 'rubygems'
require 'wx'

class Myapp < Wx::App
    private
    
    def on_init
        Wx::message_box("hello world")
        return false
    end
end

Myapp.new.main_loop
