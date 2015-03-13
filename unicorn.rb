# Replace [APP_NAME] with your folder name
@dir = "/var/www/[APP_NAME]/"

worker_processes 4
working_directory @dir

timeout 30

# Make certain tmp/sockets and tmp/pid exist

# Socket for unicorn to listen to for nginx
listen "#{@dir}tmp/sockets/unicorn.sock", :backlog => 64

# process id path
pid "#{@dir}tmp/pids/unicorn.pid"

# Log file for unicorn 
stderr_path "#{@dir}log/unicorn.log"
stdout_path "#{@dir}log/unicorn.log"
