# Data Minded Academy - Containerization with Docker
## Exercise 6 - Run a frontend-backend stack

Reproduce the frontend-backend example from the course. The source is in `example-frontend` and
`example-backend`. Each app's `README.md` explains how to build and run it.

1. Write the Dockerfile of the frontend app. Build it, run it, and check that you can open the UI.

2. Write the Dockerfile of the backend app. Build it, run it, and check that the server starts.

3. Make the **Test connection to the backend** button work. You will need the right environment
   variables on the frontend (and, if needed, on the backend). See the note on `localhost` below.

4. Write a `docker-compose.yml` that runs frontend and backend together. Check that
   `docker compose up` still lets the button succeed.

5. Add a **Postgres** service to that Compose file, with a **named volume** on its data directory.
   Point the backend at it and make **Test connection to the backend -> PostGresDB** succeed.

**Codespaces:** published ports do not show up as `localhost` on your laptop. Open the **Ports**
tab. Use the forwarded URL of the **backend** port as `BACKEND_URL`. Those URLs are private by
default: set the backend port (and the frontend port) to **Public**, or the browser will get a
redirect and a CORS error.

Then answer:

* The backend port was Private and `/ping` returned 302. Why did the browser report that as CORS?
* What was the value of `POSTGRES_HOST` and not `localhost`.
* The volume belongs on the Postgres service, at `/var/lib/postgresql/data`. What happens if you dont mount it on the Postgres service?
