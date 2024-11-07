. (Join-Path $PSScriptRoot "Midterm Challenge #1.ps1")
. (Join-Path $PSScriptRoot "Midterm Challenge #2.ps1")

$logs = Get-Content 'C:\Users\champuser\CNCS-Tech-Portfolio\Linux Automation and Scripting (SYS-320-03)\October 17\access.log'
 

function Midterm-3 ($pattern, $logs) {
       
    $tableFull = @()

    for($i=0; $i -lt $logs.Count; $i++){
    
        $line = $logs[$i] -split " "

        for($j=0; $j -lt $pattern.count){
            
            if($logs[$i].Page -contains($pattern[$j])){

                $tableFull += [PSCustomObject]@{
                    "IP" =  $line | Select-Object -index 0
                    "Date/Time" =  $line | Select-Object -index 3
                    "Method" =  $line | Select-Object -index 4
                    "Request" =  $line | Select-Object -index 5, 7
                    "Page" = $line | Select-Object -index 6
                    "Status Code" =  $line | Select-Object -index 8
                    "Browser" =  $line | Select-Object -index 18
                    "Referrer" =  $line | Select-Object -index 10
    
            }
    }
    }
    
}

return $tableFull
}

$pattern = Midterm-1
$results = Midterm-3 $pattern.Pattern $logs
$results | Format-Table -AutoSize -Wrap
