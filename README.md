# Docker CentOS Mailcatcher

Run MailCatcher as a linux container using Docker from a CentOS 7 images.

[Source Repository / Contribute / Fork this project on Github.](https://github.com/danydavila/centos-mailcatcher)

#### About MailCatcher
[MailCatcher](https://mailcatcher.me/) runs a super simple SMTP server which catches any message sent to it to display in a web interface. Run mailcatcher, set your favourite app to deliver to smtp://127.0.0.1:1025 instead of your default SMTP server, then check out http://127.0.0.1:1080 to see the mail that's arrived so far. Read more at [mailcatcher.me](https://mailcatcher.me/)     

![MailCatcher Preview](https://raw.githubusercontent.com/danydavila/centos-mailcatcher/master/mailcatcher-preview.png)

#### Pull from Docker:     

    docker pull danydavila/centos-mailcatcher

visit [danydavila/centos-mailcatcher](https://hub.docker.com/r/danydavila/centos-mailcatcher/) on docker hub for more info

#### Build From Dockerfile:

    docker build -t danydavila/centos-mailcatcher .


#### Run it:

    docker run -d --name mailcatcher -p 127.0.0.1:1025:1025 -p 0.0.0.0:1080:1080 danydavila/centos-mailcatcher

Then send yout emails through your docker host on port 1025 (or any port you want)
You can send emails from your app and check out the web interface: http://localhost:1080/.

#### CentOS Setup

     echo 'relayhost = 127.0.0.1:1025' >> /etc/postfix/main.cf

#### Server Test:


    sudo yum -y install mailx
    sudo systemctl restart postfix
    echo "Email Test" | mail -s "From The Server" noreply@mailcatcher.me

#### Nginx vhost:
    server {
		    listen     80;
		    server_name  mailcatcher.io;
		    location / {
		                  proxy_pass http://127.0.0.1:1080;
		                  proxy_http_version 1.1;
		                  proxy_set_header Upgrade $http_upgrade;
		                  proxy_set_header Connection "upgrade";
		      }
    }
#### The Hosts File
 You must add the "mailcatcher.io" for your Nginx sites to the hosts file on your machine. The hosts file will redirect requests for your mailcatcher sites into your machine. On Mac and Linux, this file is located at /etc/hosts. On Windows, it is located at C:\Windows\System32\drivers\etc\hosts. The lines you add to this file will look like the following:

    127.0.0.1  mailcatcher.io

Make sure the IP address listed is the one where the container is running. Once you have added the domain to your hosts file, you will be able to access the site via your web browser:

    http://mailcatcher.io