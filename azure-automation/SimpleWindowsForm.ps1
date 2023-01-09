[void] [reflection.assembly]::LoadWithPartialName("System.Windows.Forms")
$form = New-Object Windows.Forms.Form
$form.Text = "My first Form"
$button = New-Object Windows.Forms.Button
$button.Text = "Push Me!"
$button.Dock = 'fill'
$button.add_click({$form.close()})
$form.controls.add($button)
$form.Add_Shown({$form.Activate()})
$form.ShowDialog()
