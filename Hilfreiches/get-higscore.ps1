param(
[Parameter(Mandatory=$true)]
[string]$Path,
[int]$Count = 10
)



$a = "<style>"
$a = $a + "BODY{background-color:peachpuff;}"
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$a = $a + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:thistle}"
$a = $a + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:PaleGoldenrod}"
$a = $a + "</style>"
Get-Process | Sort-Object -Property PM -Descending | Select-Object -First $Count -Property ProcessName,@{name="RAM(MB)";expression={"{0:N2}" -f ($PSItem.PM / 1MB)}} | ConvertTo-Html -Head $a -Body "<h2>Ressourcenhungrigster Prozess</h2>" | Out-File -FilePath $Path

