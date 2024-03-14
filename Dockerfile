FROM debian:bullseye


#Install powershell 7
RUN \
 apt-get update && \
 apt-get install wget -y && \
 apt-get install software-properties-common -y && \
 wget -q https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb && \
 dpkg -i packages-microsoft-prod.deb && \
 apt-get update && \
 apt-get install -y powershell \
 rm packages-microsoft-prod.deb

#install baton
 RUN go install github.com/conductorone/baton/cmd/baton@main
 RUN go install github.com/conductorone/baton-ms365/cmd/baton-ms365@main
 RUN go install github.com/conductorone/baton-jira/cmd/baton-jira@main

 #cleanup 
 RUN apt clean