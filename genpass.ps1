[CmdletBinding()]
param (
    [parameter(Position=0)][int32]$letters = 5,
    [parameter(Position=1)][int32]$caps = 1,
    [parameter(Position=2)][int32]$numbers = 1,
    [parameter(Position=3)][int32]$specialchars = 1
)

function Get-RandomCharacters($length, $characters) {
    $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
    $private:ofs=""
    return [String]$characters[$random]
}
 
function Scramble-String([string]$inputString){     
    $characterArray = $inputString.ToCharArray()   
    $scrambledStringArray = $characterArray | Get-Random -Count $characterArray.Length     
    $outputString = -join $scrambledStringArray
    return $outputString 
}
 
$password = Get-RandomCharacters -length $letters -characters 'abcdefghiklmnoprstuvwxyz'
$password += Get-RandomCharacters -length $caps -characters 'ABCDEFGHKLMNOPRSTUVWXYZ'
$password += Get-RandomCharacters -length $numbers -characters '1234567890'
$password += Get-RandomCharacters -length $specialchars -characters '!"$%()?@+'

$password = Scramble-String $password
 
Write-Host $password