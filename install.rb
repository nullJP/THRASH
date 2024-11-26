#!/usr/bin/env ruby
#New installer Ver.2000
#Now using this beautiful installer written in Ruby

require 'tty-prompt'
require 'artii'
require 'colorize'
require 'rainbow'

trap("INT") do

        farewell = "THE END"
        system("echo '#{farewell}' | xxd")

        exit
end 


#Practicing the ASCII banner setup
a_1 = Artii::Base.new :font => 'stellar'
a = Artii::Base.new :font => 'trek'
b = Artii::Base.new :font => 'slant'
c = Artii::Base.new :font => 'utopia'
puts a_1.asciify("THRASH").colorize(:cyan)
puts Rainbow("THRASH Master Wizard ver.2000").green.bold
sleep(1)

#Practicing the Menu
prompt = TTY::Prompt.new

choice = prompt.select(Rainbow("CHOOSE: ").cyan.bold) do |menu|
        menu.choice 'Arch', :choose1
        menu.choice 'Fedora', :choose2
        menu.choice 'Ubuntu/Debian', :choose3
        menu.choice 'None/Exit', :exit
end

case choice
when :choose1
        system("clear")
        puts Rainbow(a.asciify("ARCH")).cyan
        puts Rainbow("Initializing PACMAN. Acquiring Elevated Privileges...").cyan.bold
        sleep(1)
        system("sudo pacman -Syu")
when :choose2
        system("clear")
        puts Rainbow(b.asciify("FEDORA")).blue
        puts Rainbow("Initializing DNF. Acquiring Elevated Privileges...").blue.bold
        sleep(1)
        system("sudo dnf upgrade -y")
when :choose3
        system("clear")
        puts Rainbow(c.asciify("Ubuntu")).red
        puts Rainbow("Initializing APT. Acquiring Elevated Privileges...").orange.bold
        sleep(1)
        system("sudo chmod +x udebinstall.sh && ./udebinstall.sh && echo 'COMPLETE' | xxd | lolcat")
when :exit
        system("echo 'THE END' | xxd | lolcat")
        end

