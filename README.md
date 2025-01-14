# Multi tier webapp 

In deze README file zullen we uitleggen hoe de infrastructuur van onze applicatie in elkaar zit.  

## Architectuur in AWS

Onze infrastructuur zal bestaan uit drie subnets, één public subnet en twee private subnets. De twee subents dienen voor extra beveiliging te bieden aan onze applicatie + database. Hierdoor is er nooit rechtstreekse toegang naar het internet vanaf deze private subnets. Alles zal dus eerst via de NAT gateway naar buiten/binnen gaan. 

![Architecture](img/Architectuur.png)

## Overzicht

Dit project is voor de hosting van de data registratie webapplicatie voor het Gladiolen Festival. Het maakt gebruik van een CI/CD-pipeline met GitHub Actions om de workflow te stroomlijnen, specifiek voor het starten van de hostingstructuur in AWS.

## Hoe te gebruiken

### Vereisten

- Een GitHub-account
- Basiskennis van Git
- AWS-account (voor hosting)

### Stap voor Stap

1. **Fork de Repository**:
   - Ga naar de project pagina op GitHub kies de "AWS" repo en klik op de "Fork" knop in de rechterbovenhoek.

2. **Clone je Fork**:
   - Gebruik de volgende Git-opdracht om je geforkte repository te clonen naar je lokale machine:
     ```bash
     git clone https://github.com/DataDumpsters/AWS.git

3. **Navigeren naar de Projectmap**:
   - Ga naar de map waar je het project hebt gekloond:
     ```bash
     cd AWS
     ```
4. **Variabelen Configureren voor AWS**:
   - Het is noodzakelijk om de variabelen van jou AWS omgeving in te stellen binnen github voor de github actions workflow.
   - De variabelen kan je veranderen in de AWS repo in github onder "Settings" > "Secrets and variables" > "Actions".

5. **Bucket aanmaken in AWS Console voor de statefile**:
   - Momenteel is het noodzakelijk om een bucket aan te maken voor de opslag van de statefile.
   - Een statefile in AWS, vooral bij het gebruik van Infrastructure as Code (IaC) tools zoals Terraform, houdt de huidige staat van je infrastructuur bij. Hier is een korte beschrijving:

     - Het houdt bij wat er in AWS is geïmplementeerd en wat de huidige configuratie is.
     - Wanneer je wijzigingen aanbrengt in je configuratiebestanden, vergelijkt Terraform de gewenste staat (uit je code) met de werkelijke staat (uit de statefile) om te bepalen wat er moet worden toegevoegd, gewijzigd of verwijderd.
     - Het zorgt ervoor dat de infrastructuur consistent blijft met wat gedefinieerd is in je code, door te voorkomen dat handmatige of ongedocumenteerde wijzigingen conflicteren met je IaC definities. 

   - Log in op jouw AWS Console en navigeer naar de service "S3". Een bucket is een opslageenheid die dient om objecten (bestanden) te organiseren en op te slaan..
   - Klik op <strong>"Create Bucket"</strong> en stel de gewenste parameters in (naam, publieke toegankelijkheid of privé, etc.).
   - Ga vervolgens naar het "deploy.yml" bestand in je AWS-map en selecteer de naam van de S3-bucket -> s3://<strong>bucketname</strong>/terraform.tfstate. Gebruik daarna de toetsencombinatie Ctrl + Shift + L. 
     Vervolgens voer je de naam van je aangemaakte bucket in. (Deze toetsencombinatie zorgt ervoor dat overal waar de bucketnaam nodig is, deze wordt aangepast.)
    

6. **Pipeline Starten met GitHub Actions**:
   - Voeg je wijzigingen toe en commit ze:
     ```bash
     git add .
     git commit -m "Update configuration variables"
     ```
   - Push je wijzigingen naar je fork:
     ```bash
     git push origin *Naam branch*
     ```
   - De GitHub Actions workflow zal automatisch starten indien je een push doet naar een branch die staat vermeld in de "deploy.yml" op lijn 3 ("branches"). Je kunt de voortgang volgen via de "Actions" tab op GitHub.

### Bijkomende info terraform documenten.

In de "AWS" map kan je verschillende terraform bestanden vinden. Hier kan je naamwijzigingen doen als ook veranderingen maken in de architectuur van AWS. Aangezien dit project niet volledig af is moet dit uiteraard via terraform ook nog verder uitgebouwd worden.

### Notities

- **Beveiliging**: Zorg ervoor dat je geen gevoelige informatie zoals AWS-sleutels in je commits plaatst.
- **Updates**: De infrastructuur wordt beheerd door Terraform. Als je wijzigingen aanbrengt in de `.tf` bestanden, zorg er dan voor dat je deze goed test, want ze kunnen invloed hebben op de AWS-omgeving.


