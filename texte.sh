#!/data/data/com.termux/files/usr/bin/bash

echo "Coletando informações da rede..."

# Exibe o endereço IP atual
ifconfig

# Mostra as conexões atuais
netstat -tuln

# Exibe a tabela de roteamento
route -n

# Obtém e exibe informações sobre o IP público
echo "Coletando informações sobre o IP público..."
IP=$(ifconfig | grep 'inet ' | awk '{print $2}' | head -n 1) # Obtém o primeiro IP encontrado
curl -s "http://ipinfo.io/$IP"

# Função para coletar informações de um IP específico
function coletar_info_ip() {
    local ip_especifico=$1
    echo "Coletando informações para o IP: $ip_especifico..."
    curl -s "http://ipinfo.io/$ip_especifico"
}

# Chamada da função com um exemplo de IP
coletar_info_ip "140.70.25.174"

echo "Informações coletadas."
