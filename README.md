Ruby project

This set of scripts will install ruby project.
Just clone config-scripts branch and use scripts in this order.

1. install_ruby.sh
It installs rmv, ruby and bundler.

2. install_mongodb.sh
It installs, starts and enables mongodb. You have to run it with root privileges.

3. deploy.sh
It deploys ruby project and starts puma web server to run it. You have to open tcp 9292 port in your firewall.
