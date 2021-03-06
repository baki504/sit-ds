# Dev Servers

Dev Servers is a Docker Compose asset to setup server tools for CI / CD.
It setups the following tools with Docker and makes them available immediately.

* Souce Code Management : GitBucket
* Continuous Integration : Jenkins
* Static Code Analysis : SonarQube
* Issue Tracking System : Redmine

Each server tool is configured as a service of Docker Compose.
Each service has the following settings necessary for team development.

* LDAP Authentication
  * You can log in to all tools with the same user ID / password.
* Proxy Server
  * It can be accessed via the same proxy server.
* Self Service Password
  * Users can change passwords and send reminders.
* E-mail
  * You can set the connection information of the SMTP server of each service in one place.
  * The e-mail address of the LDAP user account is used as the mail transmission destination.


## Quick Start

1. Install Docker.
  * Windows 10 Pro / Mac
    * https://store.docker.com/search?type=edition&offering=community
  * Another Windows
    * https://docs.docker.com/toolbox/toolbox_install_windows/
1. Set the memory allocation of Docker to 4 GB or more.
  * Windows 10 Pro
    * Settings > Advanced > Memory
  * Mac
    * Preferences > Advanced > Memory
1. Get the resource of SIT-DS and execute each Docker Compose Service with the following command.

```
git clone https://github.com/sitoolkit/sit-ds.git
cd sit-ds
docker-compose up -d
docker-compose exec work psql -h dbms -d redmine -U redmine -f /tmp/insert-auth_sources.sql
```

The endpoint URL to each service and the connection information of the admin user are as follows.

|        Server         |             Endpoint URL (*1)             |         userId / password          |
| --------------------- | ----------------------------------------- | ---------------------------------- |
| GitBucket             | http://localhost/gitbucket                | root  / root                       |
| Jenkins               | http://localhost/jenkins                  | admin / admin                      |
| SonarQube             | http://localhost/sonarqube                | admin / admin                      |
| Redmne                | http://localhost/redmine                  | admin / admin                      |
| PostgreSQL            | jdbc:postgresql://localhost:5432/postgres | postgres / postgres                |
| Self Service Password | https://localhost/passchg                 | admin / admin                      |
| phpLDAPAdmin          | https://localhost:6443                    | cn=admin,dc=example,dc=org / admin |

* *1 For Docker Toolbox, it is an IP address that can be confirmed with docker-machine ls command instead of localhost.


### Add users

1. Add the user information you want to add to the following file.
  * service/work/mount/add-users.ldif
2. Execute the following command.

```
docker-compose exec work ldapadd -h ldap -x -D "cn=admin,dc=example,dc=org" -w admin -f /tmp/add-users.ldif
```

You can log in to each tool with the following user ID / password.

* user001 / password
* user002 / password
* user003 / password
