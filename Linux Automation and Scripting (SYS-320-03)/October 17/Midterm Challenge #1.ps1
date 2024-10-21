function Midterm-1 {

$Webreq = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.5/IOC.html
$trs = $Webreq.ParsedHTML.body.getElementsByTagName("tr")
$FullTable = @()
for($i=1; $i -lt $trs.length; $i++){
    $tds0 = $trs[0].getElementsByTagName("td")
    $tds1 = $trs[1].getElementsByTagName("td")
    $tds2 = $trs[2].getElementsByTagName("td")
    $tds3 = $trs[3].getElementsByTagName("td")
    $tds4 = $trs[4].getElementsByTagName("td")
    $tds5 = $trs[5].getElementsByTagName("td")
    $tds6 = $trs[6].getElementsByTagName("td")
    $Pattern = $tds0[0].innerText, $tds1[0].innerText, $tds2[0].innerText, $tds3[0].innerText,$tds4[0].innerText, $tds5[0].innerText, $tds6[0].innerText
    $Explanation = $tds0[1].innerText, $tds1[1].innerText, $tds2[1].innerText, $tds3[1].innerText,$tds4[1].innerText, $tds5[1].innerText, $tds6[1].innerText

    $FullTable += [PSCustomObject]@{
                                    "Pattern" = $Pattern[$i]
                                    "Explanation" = $Explanation[$i]
                                   }
                                   
   Format-Table | return $FullTable
}
    Write-Output $FullTable
}