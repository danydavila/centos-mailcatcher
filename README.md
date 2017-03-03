# Docker CentOS Mailcatcher

Run MailCatcher as a linux container using Docker from a CentOS 7 images.

#### About MailCatcher
[MailCatcher](https://mailcatcher.me/) runs a super simple SMTP server which catches any message sent to it to display in a web interface. Run mailcatcher, set your favourite app to deliver to smtp://127.0.0.1:1025 instead of your default SMTP server, then check out http://127.0.0.1:1080 to see the mail that's arrived so far.     

#### Pull from Docker:     

    docker pull danydavila/mailcatcher

visit [danydavila/mailcatcher](https://hub.docker.com/r/danydavila/centos-mailcatcher/) on docker hub for more info

#### Build From Dockerfile:

    docker build -t danydavila/mailcatcher .


#### Run it:

    docker run -d --name mailcatcher -p 127.0.0.1:1025:1025 -p 0.0.0.0:1080:1080 danydavila/mailcatcher

Then send yout emails through your docker host on port 1025 (or any port you want)
You can send emails from your app and check out the web interface: http://localhost:1080/.

#### CentOS Setup

     echo 'relayhost = 127.0.0.1:1025' >> /etc/postfix/main.cf

#### Server Test:


    sudo yum -y install mailx
    sudo systemctl restart postfix
    echo "Email Test" | mail -s "From The Server" noreply@mailcatcher.me