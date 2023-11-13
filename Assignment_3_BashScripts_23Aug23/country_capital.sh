#!/bin/bash

# Sample data for countries and capitals (50 entries)
data="USA Washington,UK London,Canada Ottawa,Australia Canberra,Germany Berlin,France Paris,India New Delhi,China Beijing,Russia Moscow,Brazil Brasilia,Argentina Buenos Aires,Mexico Mexico City,Japan Tokyo,South Korea Seoul,Thailand Bangkok,Indonesia Jakarta,Italy Rome,Spain Madrid,Portugal Lisbon,Greece Athens,Turkey Ankara,Egypt Cairo,Kenya Nairobi,South Africa Pretoria,Nigeria Abuja,Algeria Algiers,Morocco Rabat,New Zealand Wellington,Canada Toronto,Sweden Stockholm,Denmark Copenhagen,Norway Oslo,Finland Helsinki,Switzerland Bern,Austria Vienna,Czech Republic Prague,Hungary Budapest,Pakistan Islamabad,India Mumbai,Vietnam Hanoi,Philippines Manila,Singapore Singapore,Myanmar Naypyidaw,Cambodia Phnom Penh,Malaysia Kuala Lumpur,Chile Santiago,Colombia Bogota,Bolivia La Paz,Peru Lima"

# Check if a letter is provided as an argument
if [ $# -eq 1 ]; then
  letter="$1"
  echo "Countries and Capitals Starting with the Letter '$letter':"
  echo "$data" | awk -F ',' -v letter="$letter" '$1 ~ "^"letter {print $1, $2}'
else
  echo "Countries and Capitals:"
  IFS=',' read -ra entries <<< "$data"
  for entry in "${entries[@]}"; do
    echo "$entry"
  done
fi
