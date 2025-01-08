$fichier = "C:\Users\timothee.dagany\Documents\sql\dump\dumpGSBFRAIS.sql"
C:\wamp64\bin\mysql\mysql8.3.0\bin\mysqldump.exe -u root gsb_frais --result-file=$fichier

$lignes = Get-Content -Path $fichier
$lignesModifiees = $lignes[0..($lignes.Count - 4)]
$lignesModifiees | Set-Content -Path $fichier

$depo = "C:\Users\timothee.dagany\Documents\sql"
Set-Location -Path $depo
$changements = (& git status --porcelain).Lenght -gt 0

if(-not $changements){
	Write-Host "Aucun changements"
}else{
	write-Host "changement detetcte"
	git add dumpGSBFrais.sql
	git commit -m "$(Get-Date -Format 'yyyyMMddhhmm'): changement detetcte"
}
exit(0)