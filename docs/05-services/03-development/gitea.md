# Service: Gitea

## 🧐 What is it?
Your private GitHub.

## 🛠️ Installation & Deployment

### Docker Compose (Full Stack)
```yaml
version: "3"

networks:
  gitea:
    external: false

services:
  server:
    image: gitea/gitea:latest
    container_name: gitea
    environment:
      - USER_UID=1000
      - USER_GID=1000
      - GITEA__database__DB_TYPE=mysql
      - GITEA__database__HOST=db:3306
      - GITEA__database__NAME=gitea
      - GITEA__database__USER=gitea
      - GITEA__database__PASSWD=gitea
    restart: always
    volumes:
      - ./gitea:/data
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
    ports:
      - "3000:3000"
      - "222:22" # SSH Port Mapping
    networks:
      - gitea
    depends_on:
      - db

  db:
    image: mysql:8
    container_name: gitea-db
    restart: always
    environment:
      - MYSQL_ROOT_PASSWORD=gitea
      - MYSQL_USER=gitea
      - MYSQL_PASSWORD=gitea
      - MYSQL_DATABASE=gitea
    networks:
      - gitea
    volumes:
      - ./mysql:/var/lib/mysql
```

### 📝 Post-Install Setup
1.  Go to `http://<your-ip>:3000`.
2.  You will see the **Install Configuration** screen.
3.  **Database Settings:** Leave as is (Host: `db:3306`).
4.  **Server Domain:** Set this to your machine's IP or `git.home.lan`.
5.  **SSH Server Port:** Change from `22` to `222`. **This is critical** because Docker maps 222->22. If you leave it as 22 in the config, the clone URLs will be wrong.
6.  **Administrator Account:** Create the first user now.