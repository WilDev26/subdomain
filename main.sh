#!/bin/bash

# Banner Keren
echo -e "\e[1;36m"
cat << "EOF"

  ____                                            
 |  _ \ _ __  ___   ___  ___ __ _ _ __   ___ _ __ 
 | | | | '_ \/ __| / __|/ __/ _` | '_ \ / _ \ '__|
 | |_| | | | \__ \ \__ \ (_| (_| | | | |  __/ |   
 |____/|_| |_|___/ |___/\___\__,_|_| |_|\___|_|   
                                                  

EOF
echo -e "\e[0m"
echo -e "\e[1;32mSubdomain Finder \e[0m"
echo -e "\e[1;33mCreated by: Bagas Oscarius\e[0m"
echo ""

# Fungsi untuk mencari subdomain
find_subdomains() {
    local domain=$1
    echo -e "\e[1;34m[*] Searching for subdomains of $domain...\e[0m"

    # Menggunakan API DNSDumpster (non-resmi)
    response=$(curl -s "https://api.hackertarget.com/hostsearch/?q=$domain")

    if [[ $response == *"error"* ]]; then
        echo -e "\e[1;31m[!] Error: Unable to fetch subdomains. Please check your domain or try again later.\e[0m"
    else
        echo -e "\e[1;32m[+] Subdomains found:\e[0m"
        echo "$response" | awk -F, '{print $1}'
    fi
}

# Input domain
read -p "Enter the domain (e.g., example.com): " domain

# Validasi input
if [[ -z "$domain" ]]; then
    echo -e "\e[1;31m[!] Error: Domain cannot be empty.\e[0m"
    exit 1
fi

# Panggil fungsi untuk mencari subdomain
find_subdomains "$domain"
