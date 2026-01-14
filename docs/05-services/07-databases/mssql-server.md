# Service: Microsoft SQL Server (MSSQL)

## 🧐 What is it?
Enterprise-grade SQL database.

## 🛠️ Installation & Deployment

### Docker Compose
**Note:** MSSQL has strict password requirements (Upper, Lower, Number, Symbol).

```yaml
version: "3"
services:
  mssql:
    image: mcr.microsoft.com/mssql/server:2022-latest
    container_name: mssql
    environment:
      - ACCEPT_EULA=Y
      - MSSQL_SA_PASSWORD=Strong!Passw0rd
      - MSSQL_PID=Developer # Free edition for dev use
    ports:
      - "1433:1433"
    volumes:
      - ./mssql_data:/var/opt/mssql
    restart: always
```

### ⚡ Connection
Use Azure Data Studio or SSMS to connect:
*   **Server:** `localhost,1433`
*   **User:** `sa`
*   **Password:** `Strong!Passw0rd`