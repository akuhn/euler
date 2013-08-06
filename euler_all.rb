#  
#
# Runs all Euler problems 

$timeout = 90

def timeout(pid)
  fork do 
    begin
      sleep $timeout
      Process.kill("KILL",pid)
      puts "#{" "*40}Timeout::Error"
    rescue Errno::ESRCH
    end 
  end 
end

`ls problem_*.rb`.each_line do |file|
  fname = file.chomp
  puts "#{"-"*39} #{fname}"
  time = Time.now
  IO.popen("ruby #{fname}") do |pipe|
    watchdog = timeout(pipe.pid)
    pipe.each { |line| puts "$>\t#{line}" }
    Process.kill("KILL",watchdog)
  end
  puts "Finished after %.2f seconds." % (Time.now-time)
end