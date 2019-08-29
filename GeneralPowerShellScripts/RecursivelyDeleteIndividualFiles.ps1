function Get-Tree($Path,$Include='*') { 
    @(Get-Item $Path -Include $Include -Force) + 
        (Get-ChildItem $Path -Recurse -Include $Include -Force) | 
        sort pspath -Descending -unique
} 

function Remove-Tree($Path,$Include='*') { 
    Get-Tree $Path $Include | Remove-Item -force -recurse
} 
#From Stackoverflow: https://stackoverflow.com/questions/1752677/how-to-recursively-delete-an-entire-directory-with-powershell-2-0 
#
#call: Remove-Tree some_dir
