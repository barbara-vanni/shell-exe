#!/usr/bin/bash

# L'URL complète de la page alcasart avant connexion 
URL="https://alcasar.laplateforme.io/intercept.php?res=notyet&uamip=10.10.0.1&uamport=3990&challenge=53d80577253e3858bafd345dc3bc7214&called=68-05-CA-3A-2E-49&mac=C8-CB-9E-CB-38-29&ip=10.10.6.37&nasid=alcasar.laplateforme.io&sessionid=1695996576000001d0&ssl=https%3a%2f%2f1.0.0.1%3a3991%2f&userurl=http%3a%2f%2fneverssl.com%2f&md=23A624332E8509B9A044063FEED7B977i"

# Paramètres de l'URL
res=$(echo "$URL" | grep -o 'res=[^&]*' | cut -d'=' -f2)
uamip=$(echo "$URL" | grep -o 'uamip=[^&]*' | cut -d'=' -f2)
uamport=$(echo "$URL" | grep -o 'uamport=[^&]*' | cut -d'=' -f2)
challenge=$(echo "$URL" | grep -o 'challenge=[^&]*' | cut -d'=' -f2)
called=$(echo "$URL" | grep -o 'called=[^&]*' | cut -d'=' -f2)
mac=$(echo "$URL" | grep -o 'mac=[^&]*' | cut -d'=' -f2)
ip=$(echo "$URL" | grep -o 'ip=[^&]*' | cut -d'=' -f2)
nasid=$(echo "$URL" | grep -o 'nasid=[^&]*' | cut -d'=' -f2)
sessionid=$(echo "$URL" | grep -o 'sessionid=[^&]*' | cut -d'=' -f2)
ssl=$(echo "$URL" | grep -o 'ssl=[^&]*' | cut -d'=' -f2)
userurl=$(echo "$URL" | grep -o 'userurl=[^&]*' | cut -d'=' -f2)
md=$(echo "$URL" | grep -o 'md=[^&]*' | cut -d'=' -f2)

#récuperer le challenge ?
curl -i $URL

recupchallenge="$(echo $(curl -i $URL) | grep -oP 'challenge=.*?' | cut -d '=' -f 2)"

# Afficher les paramètres
echo "res: $res"
echo "uamip: $uamip"
echo "uamport: $uamport"
echo "challenge: $challenge"
echo "called: $called"
echo "mac: $mac"
echo "ip: $ip"
echo "nasid: $nasid"
echo "sessionid: $sessionid"
echo "ssl: $ssl"
echo "userurl: $userurl"
echo "md: $md"

# Construire l'URL de la requête curl
URL="https://alcasar.laplateforme.io/intercept.php?res=$res&uamip=$uamip&uamport=$uamport&challenge=$challenge&called=$called&mac=$mac&ip=$ip&nasid=$nasid&sessionid=$sessionid&ssl=$ssl&userurl=$userurl&md=$md"

# Arguments 
EMAIL="$1"
PASSWORD="$2"

# Utiliser curl pour effectuer la connexion
RESPONSE=$(curl -X POST "$URL" -H "Content-Type: application/x-www-form-urlencoded" --data "login=$EMAIL&password=$PASSWORD&challenge=$recupchallenge" --cookie "sessionid=$SESSION_ID")

# Vérifier si la connexion a réussi (comme dans votre script précédent)
if echo "$RESPONSE" | grep -q "stillconnected";
then
    echo "Connexion réussie !"
else
    echo "Échec de la connexion."
fi

