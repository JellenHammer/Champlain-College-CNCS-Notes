function Midterm-1 {

    $Webreq = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.5/IOC.html
    $trs = $Webreq.ParsedHTML.body.getElementsByTagName("tr")
    $FullTable = @()
    for($i=1; $i -lt $trs.length; $i++){

        $tds = $trs[$i].getElementsbyTagName("td")
        $FullTable += [PSCustomObject]@{
                                    "Pattern" = $tds[0].innerText
                                    "Explanation" = $tds[1].innerText
                                   }
                                   
   Format-Table | return $FullTable
}
    Write-Output $FullTable
}