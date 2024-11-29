# Multi tier webapp 

In deze README file zullen we uitleggen hoe de infrastructuur van onze applicatie in elkaar zit.  

## Architectuur in AWS

Onze infrastructuur zal bestaan uit drie subnets, één public subnet en twee private subnets. De twee subents dienen voor extra beveiliging te bieden aan onze applicatie + database. Hierdoor is er nooit rechtstreekse toegang naar het internet vanaf deze private subnets. Alles zal dus eerst via de NAT gateway naar buiten/binnen gaan. 

![Architecture](img/Architectuur.png)

