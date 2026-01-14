# Service: Obsidian Sync (CouchDB)

## 🧐 What is it?
A CouchDB backend compatible with the Obsidian "LiveSync" plugin.

## 🛠️ Installation & Deployment

### Docker Compose
```yaml
version: '3'
services:
  couchdb:
    image: couchdb:3.1.1
    environment:
      - COUCHDB_USER=obsidian
      - COUCHDB_PASSWORD=secret
    volumes:
      - ./couchdb_data:/opt/couchdb/data
      - ./local.ini:/opt/couchdb/etc/local.ini
    ports:
      - "5984:5984"
    restart: always
```

### 🔧 Configuration (local.ini)
You must enable CORS for the plugin to work. Create a `local.ini` file:
```ini
[chttpd]
enable_cors = true
bind_address = 0.0.0.0

[cors]
origins = app://obsidian.md,capacitor://localhost,http://localhost
credentials = true
headers = accept, authorization, content-type, origin, referer
methods = GET, PUT, POST, HEAD, DELETE
max_age = 3600
```