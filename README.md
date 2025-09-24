# Simple Load Balancer Project

This project demonstrates a basic load balancing setup using **Docker**, **Nginx**, and a **shell script**. It creates an Nginx-based load balancer that distributes HTTP requests across **three identical Node.js backend servers** using the **round-robin** method.

---

## Prerequisites

* Docker & Docker Compose installed
* Basic knowledge of shell commands

---

## Project Structure

```
project-root/
│
├── docker-compose.yml        # Defines load balancer and backend services
├── nginx.conf                # Nginx configuration for round-robin load balancing
├── backend.Dockerfile        # Dockerfile for backend Node.js servers
├── app.js                    # Simple Node.js HTTP server
├── start.sh                  # Shell script to build, run, and test the setup
```

---

## Setup Instructions

1. **Clone or create** the project directory with the files listed above.

2. **Make the shell script executable**:

   ```bash
   chmod +x start.sh
   ```

3. **Run the setup**:

   ```bash
   ./start.sh
   ```

4. **Access the load balancer** in your browser:

   ```
   http://localhost:8080
   ```

5. **Stop all services** when done:

   ```bash
   docker-compose down
   ```

---

## How It Works

### Architecture Diagram

```
          +---------------------+
          |     Your Browser    |
          +---------+-----------+
                    |
                    v
          +---------------------+
          |       Nginx         |  (Load Balancer)
          +---------+-----------+
            |       |       |
            v       v       v
      +--------+ +--------+ +--------+
      |Backend1| |Backend2| |Backend3|
      +--------+ +--------+ +--------+

         All backends run the same Node.js app
```

### Components

* **Nginx**: Serves as the load balancer. Routes HTTP requests to backend servers using the **round-robin** method.
* **Backends**: Three identical Node.js servers running on port `3000`. Each responds with its container hostname.
* **Shell Script (`start.sh`)**: Automates the setup — builds the Docker images, starts the services, and makes test requests.

---

## Testing

Once the setup is running, visit:

```
http://localhost:8080
```

Or observe the curl output from `start.sh`. You should see responses rotating between the backends:

```
Hello from backend on backend1!
Hello from backend on backend2!
Hello from backend on backend3!
```

---

## Extending the Project

* **Sticky Sessions**
  To enable client affinity (sticky sessions), add `ip_hash;` inside the `upstream` block in `nginx.conf`.

* **Scaling Backends**
  Add more backend containers using:

  ```bash
  docker-compose up --scale backend=5
  ```

* **Health Checks**
  Implement health checks in `nginx.conf` or use a separate monitoring script to detect and avoid unhealthy backends.

---
