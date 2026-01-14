# Service: Nextcloud

## 🧐 What is it?
Your private productivity cloud.

## 🛠️ Installation & Deployment

### Docker Compose
```yaml
version: '2'

volumes:
  nextcloud:
  db:

services:
  db:
    image: mariadb:10.6
    restart: always
    command: --transaction-isolation=READ-COMMITTED --binlog-format=ROW
    volumes:
      - db:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=strongpassword
      - MYSQL_PASSWORD=strongpassword
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud

  app:
    image: nextcloud
    restart: always
    ports:
      - 8080:80
    links:
      - db
    volumes:
      - nextcloud:/var/www/html
      - /mnt/hdd_1tb/nextcloud_data:/var/www/html/data # <--- STORE DATA ON HDD
    environment:
      - MYSQL_PASSWORD=strongpassword
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
      - MYSQL_HOST=db
```

### ⚠️ Performance Tuning
Nextcloud can be slow. After installation, edit `config.php` inside the container:
1.  Add `'default_phone_region' => 'BG',`
2.  Ensure Redis is used for file locking (requires adding a Redis container to the stack).