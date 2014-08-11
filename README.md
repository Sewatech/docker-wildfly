# Content

* Debian Jessie
* WildFly 8.1.0.Final

# Build

	docker build -t sewatech/wildfly .

# Run

If you want direct access to the applications :

  docker run -p 8080:8080 -p 9990:9990 -d sewatech/wildfly

If you want to access to the applications via a proxy :

	docker run -p 9990:9990 -d sewatech/wildfly

# Connect

If port 8080 is bound :

  http://localhost:8080/

For management :

  http://localhost:9990/

with alexis:hassler
