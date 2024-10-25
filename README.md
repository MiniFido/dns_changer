# DNS Change Script

Dette repository indeholder scripts til hurtigt at ændre DNS-indstillingerne på en Windows-maskine til:
- **Primær DNS**: `1.1.1.1` cloudflare
- **Sekundær DNS**: `8.8.8.8` Google

### Filoversigt
- **ChangeDNS.bat**: En batch-fil, der starter PowerShell-scriptet for at udføre DNS-ændringen.
- **Set-DNS.ps1**: Et PowerShell-script, der udfører selve DNS-konfigurationen.

---

## 📋 Krav
- **Windows** OS

## 🚀 Sådan bruger du scriptet
1. Download filerne **ChangeDNS.bat** og **Set-DNS.ps1**.
2. Kør **ChangeDNS.bat**. Dette vil:
   - Starte PowerShell-scriptet, som ændrer DNS til de angivne indstillinger.
3. Bekræft dine DNS-indstillinger ved at åbne kommandoprompt og skrive:
   ```shell
   nslookup
