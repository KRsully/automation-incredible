Param(
	[System.IO.FileInfo]
	$IncredibleFile = "$PSScriptRoot\automation.txt",
	[String]
	$DateFormat		= "yyyy-MM-dd",
	[String]
	$GitRemoteName  = "automation"
)

$wordGeneratorURI = "https://corporatebs-generator.sameerkumar.website/"
$contentTemplate = "Wow, can you believe that this is automated?

The buzzword of the day on {0} is: {1}!"

$word = Get-Random ((ConvertFrom-Json((Invoke-WebRequest -Uri $wordGeneratorURI).content)).phrase -Split ' ')

Set-Content -Path $IncredibleFile -Value $($contentTemplate -f $(Get-Date -Format $DateFormat),$word)

git add $IncredibleFile
git commit -m "[Automated Process] Updating today's buzzword!"
git push $GitRemoteName