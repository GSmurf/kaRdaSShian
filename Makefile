.PHONY: docker-build docker-run test help
.DEFAULT_GOAL= help

docker-build: ## Génération d'une docker image pour contenairisé le projet
    docker build -f Dockerfile -t gismo/kardasshian:beta .

docker-build-slim: ## Génération d'une docker image slim pour contenairisé le projet
    docker build -f Dockerfile.slim -t gismo/kardasshian:beta-slim .

docker-run: ## Lancement d'une instance de l'image 
    docker run -d -it -p 5000:5000  --name kardasshian gismo/kardasshian:beta

docker-run-slim: ## Lancement d'une instance de l'image slim
    docker run -d -it -p 5001:5000  --name kardasshian-slim gismo/kardasshian:beta-slim
    
test:    
    http://localhost:5000/?url=http://www.someecards.com/combined-rss&content_filters=Kardashian,Kanye,Bieber,Stodden

help: 
    @grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-10s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
