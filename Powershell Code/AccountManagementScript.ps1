$inputXML = @"
<Window x:Class="User_Account_Management.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:User_Account_Management"
        mc:Ignorable="d"
        Title="User Account Management" Height="442" Width="442" ResizeMode="NoResize" WindowStartupLocation="CenterScreen" Background="#FF728BC5">
    <Grid RenderTransformOrigin="0.5,0.5">
        <Grid.RowDefinitions>
            <RowDefinition Height="113*"/>
            <RowDefinition Height="300*"/>
        </Grid.RowDefinitions>
        <Grid.RenderTransform>
            <TransformGroup>
                <ScaleTransform/>
                <SkewTransform/>
                <RotateTransform Angle="-0.274"/>
                <TranslateTransform/>
            </TransformGroup>
        </Grid.RenderTransform>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="48*"/>
            <ColumnDefinition Width="47*"/>
            <ColumnDefinition Width="123*"/>
        </Grid.ColumnDefinitions>
        <TextBox x:Name="UsernameInput" HorizontalAlignment="Left" Height="23" Margin="13,22,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="153" FontFamily="Arial" FontWeight="Bold" Grid.Column="2" Background="#FFF3F8FB" FontSize="16" MaxLines="1" MaxLength="11"/>
        <Label x:Name="UserNameLabel" Content="Enter Student ID:" HorizontalAlignment="Left" Margin="71,19,0,0" VerticalAlignment="Top" Width="135" FontFamily="Arial" Grid.ColumnSpan="3" Height="30" FontSize="16" RenderTransformOrigin="0.5,0.5">
            <Label.RenderTransform>
                <TransformGroup>
                    <ScaleTransform/>
                    <SkewTransform AngleX="-1.497"/>
                    <RotateTransform/>
                    <TranslateTransform X="-0.314"/>
                </TransformGroup>
            </Label.RenderTransform>
        </Label>
        <RadioButton x:Name="CheckAccountStatus" Content="Check Account Status" HorizontalAlignment="Left" Margin="34,79,0,0" VerticalAlignment="Top" Grid.ColumnSpan="3" Height="27" Width="200" FontSize="16"/>
        <RadioButton x:Name="UnlockAccount" Content="Unlock Account" HorizontalAlignment="Left" Margin="34,111,0,0" VerticalAlignment="Top" FontSize="16" Grid.ColumnSpan="2" Grid.RowSpan="2"/>
        <RadioButton x:Name="ResetPassword" Content="Reset Password" HorizontalAlignment="Left" Margin="34,32,0,0" VerticalAlignment="Top" FontSize="16" Grid.Row="1" Grid.ColumnSpan="2"/>
        <RadioButton x:Name="DisableAccount" Content="Disable Account" HorizontalAlignment="Left" Margin="34,99,0,0" VerticalAlignment="Top" FontSize="16" Grid.Row="1" Grid.ColumnSpan="2"/>
        <RadioButton x:Name="EnableAccount" Content="Enable Account" HorizontalAlignment="Left" Margin="34,65,0,0" VerticalAlignment="Top" FontSize="16" Grid.Row="1" Grid.ColumnSpan="2"/>
        <TextBox x:Name="PasswordEntry" HorizontalAlignment="Left" Visibility="Hidden" Height="23" Margin="70,160,0,0" TextWrapping="Wrap" Text="Welcome2ThomasRotherham!" VerticalAlignment="Top" Width="302" Background="#FFF3F8FB" Grid.Row="1" Grid.ColumnSpan="3" BorderBrush="Black" />
        <Button x:Name="Action" Content="" HorizontalAlignment="Left" Margin="56,129,0,0" VerticalAlignment="Top" Width="89" Grid.Row="1" Grid.ColumnSpan="2"/>
        <TextBox x:Name="Results" HorizontalAlignment="Left" IsReadOnly = "True" Height="99" Margin="70,185,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="302" Grid.ColumnSpan="3" Grid.Row="1" RenderTransformOrigin="0.5,0.5" BorderBrush="Black">
            <TextBox.RenderTransform>
                <TransformGroup>
                    <ScaleTransform/>
                    <SkewTransform/>
                    <RotateTransform Angle="-0.111"/>
                    <TranslateTransform/>
                </TransformGroup>
            </TextBox.RenderTransform>
        </TextBox>
        <Button x:Name="Check" Content="Check" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="166,22,0,0" VerticalAlignment="Top" Width="54" FontWeight="Bold"/>
        <Image x:Name="UserImage" Grid.Column="2" HorizontalAlignment="Left" Height="153" Margin="56,89,0,0" VerticalAlignment="Top" Width="150" Stretch="Fill" OpacityMask="Black" Grid.RowSpan="2" />
        <Label x:Name="InfoLabel" Content="" Grid.Column="2" HorizontalAlignment="Left" Margin="56,129,0,132" VerticalAlignment="Center" Height="39" Width="180" ScrollViewer.VerticalScrollBarVisibility="Disabled" FontWeight="Bold" Grid.Row="1" FontSize="16"/>

    </Grid>
</Window>




































"@ 

$inputXML = $inputXML -replace 'mc:Ignorable="d"','' -replace "x:N",'N' -replace '^<Win.*', '<Window'

[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')

[xml]$XAML = $inputXML

#Read XAML

$reader=(New-Object System.Xml.XmlNodeReader $xaml)

try{

    $Form=[Windows.Markup.XamlReader]::Load( $reader )

}

catch{

    Write-Warning "Unable to parse XML, with error: $($Error[0])`n Ensure that there are NO SelectionChanged or TextChanged properties in your textboxes (PowerShell cannot process them)"

    throw

}

 

#===========================================================================

# Load XAML Objects In PowerShell

#===========================================================================

  

$xaml.SelectNodes("//*[@Name]") | %{"trying item $($_.Name)";

    try {Set-Variable -Name "WPF$($_.Name)" -Value $Form.FindName($_.Name) -ErrorAction Stop}

    catch{throw}

    }

 

Function Get-FormVariables{

if ($global:ReadmeDisplay -ne $true){Write-host "If you need to reference this display again, run Get-FormVariables" -ForegroundColor Yellow;$global:ReadmeDisplay=$true}

write-host "Found the following interactable elements from our form" -ForegroundColor Cyan

get-variable WPF*

}

Get-FormVariables

#===========================================================================

# Use this space to add code to the various form elements in your GUI

#===========================================================================

$CurrentUser = $env:USERNAME
$CurrentDate = (Get-Date).ToString('MMM-yyyy')
$CurrentDate2 = (Get-Date).ToString('dd-MM-yy')
$global:CurrentTimeTwo = Get-Date -Format HH:mm
$txt = ".txt"
$LogOutput = $CurrentDate2 + "," + $CurrentTimeTwo + "," + $CurrentUser + ","
$LogfileName = $CurrentDate + $txt
$Logfile = "..\Logs" + $LogfileName


Function LogWrite
{
   Param ([string]$logstring)

   Add-content $Logfile -value $logstring
}

$CheckAccountStatus=0
$UnlockAccount=0
$PasswordReset=0
$DisableAccount=0
$EnableAccount=0
$global:UserName=$WPFUserNameLabel.text
write-host $global:UserName
Function Get-Data {
    if ($WPFCheckAccountStatus.IsChecked){
    $global:CheckAccountStatus=1
    $global:UnlockAccount=0
    $global:PasswordReset=0
    $global:DisableAccount=0
    $global:EnableAccount=0
    }
    if ($WPFUnlockAccount.IsChecked){
    $global:UnlockAccount=1
    $global:CheckAccountStatus=0
    $global:PasswordReset=0
    $global:DisableAccount=0
    $global:EnableAccount=0
    }
    if ($WPFResetPassword.IsChecked){
    $global:PasswordReset=1
    $global:CheckAccountStatus=0
    $global:UnlockAccount=0
    $global:DisableAccount=0
    $global:EnableAccount=0
    }
    if ($WPFDisableAccount.IsChecked){
    $global:DisableAccount=1
    $global:CheckAccountStatus=0
    $global:UnlockAccount=0
    $global:PasswordReset=0
    $global:EnableAccount=0
    }
    if ($WPFEnableAccount.IsChecked){
    $global:EnableAccount=1
    $global:CheckAccountStatus=0
    $global:UnlockAccount=0
    $global:PasswordReset=0
    $global:DisableAccount=0
    }
}

$WPFCheck.Add_Click({
$WPFUserImage.Source = $string5
$WPFInfoLabel.Content = ''
IF($WPFUsernameInput.text -match "^\d+$"){
    Try{
    $global:UserName = $WPFUsernameInput.text
    $string =".jpg"
    $string2 = "file:\\INSERT DIRECTORY HERE $global:UserName"
    $string3 = $string2 + $string
    $string4 = "file:\\INSERT DIRECTORY HERE "
    $string5 = $string4 + $string
    $WPFPasswordEntry.Visibility = 'Hidden'
    $WPFInfoLabel.Visibility = 'Visible'
    $WPFUserImage.Visibility = 'Visible'
    $WPFUserImage.Source = $string3
    $WPFInfoLabel.Content = Get-ADUser -Identity $global:UserName -Properties displayName | Select-Object -ExpandProperty DisplayName
    }
    Catch
    {}
  }
ELSE{}
    

})

$WPFCheckAccountStatus.Add_Click({
    $WPFAction.Content = 'Check'
    $global:UserName = $WPFUsernameInput.text
    $WPFPasswordEntry.Visibility = 'Hidden'
    $WPFResults.Visibility = 'Visible'
    $WPFResults.Text = "User ID: `rAccount Enabled: `rPassword Expired: `nAccount Locked:"

})


$WPFUnlockAccount.Add_Click({
    $WPFAction.Content = 'Unlock'
    $WPFPasswordEntry.Visibility = 'Hidden'
    $global:UserName = $WPFUsernameInput.text
    if ($WPFResults.Visibility -ne 'Visible')
        {$WPFResults.Visibility = 'Visible'}

    $WPFResults.Text = "Unlock account selected - username is: $global:UserName"
})   
         
$WPFResetPassword.Add_Click({
    $WPFAction.Content = 'Reset'
    if ($WPFPasswordEntry.Visibility -ne 'Visible')
    {$WPFPasswordEntry.Visibility = 'Visible'}
    $WPFResults.Visibility = 'Hidden'

})

$WPFEnableAccount.Add_Click({
    $WPFAction.Content = 'Enable'
    $global:UserName = $WPFUsernameInput.text
    $WPFPasswordEntry.Visibility = 'Hidden'
    if ($WPFResults.Visibility -ne 'Visible')
        {$WPFResults.Visibility = 'Visible'}

    $WPFResults.Text = "Enable account selected - username is: $global:UserName"
})

$WPFDisableAccount.Add_Click({
    $WPFAction.Content = 'Disable'
    $global:UserName = $WPFUsernameInput.text
    $WPFPasswordEntry.Visibility = 'Hidden'
    if ($WPFResults.Visibility -ne 'Visible')
        {$WPFResults.Visibility = 'Visible'}

    $WPFResults.Text = "Disable account selected - username is: $global:UserName"
})                                                              

$WPFAction.Add_Click({
    Get-Data
    $global:UserName = $WPFUsernameInput.text
        
        IF(($CheckAccountStatus -eq 1 -and ($global:UserName))){
         Try{
          $global:UserName = $WPFUsernameInput.text
          if ($WPFResults.Visibility -ne 'Visible')
          {$WPFResults.Visibility = 'Visible'}
          $WPFUserImage.Visibility = 'Hidden'
          $WPFInfoLabel.Visibility = 'Hidden'
          $Status1 = Get-ADUser -Identity $global:UserName -Properties * | Select-Object -ExpandProperty Name
          $Status2 = Get-ADUser -Identity $global:UserName -Properties * | Select-Object -ExpandProperty Enabled
          $Status3 = Get-ADUser -Identity $global:UserName -Properties * | Select-Object -ExpandProperty PasswordExpired
          $Status4 = Get-ADUser -Identity $global:UserName -Properties * | Select-Object -ExpandProperty LockedOut
          $WPFResults.Text = "User ID: $Status1 `rAccount Enabled: $Status2`rPassword Expired: $Status3`nAccount Locked: $Status4"
          LogWrite "$LogOutput $global:UserName was account status checked."
          
           }
         Catch{}
        }

        IF(($UnlockAccount -eq 1) -and ($global:UserName)){
         Try{
            $global:UserName = $WPFUsernameInput.text
            $WPFUserImage.Visibility = 'Hidden'
            $WPFInfoLabel.Visibility = 'Hidden'
            Unlock-ADAccount -Identity $global:UserName
            $a = new-object -comobject wscript.shell
            $b = $a.popup("User account $global:UserName has been unlocked. ",2,"",0)
            LogWrite "$LogOutput $global:UserName was unlocked."
            }
         Catch{}
        }

        IF(($PasswordReset -eq 1) -and ($global:UserName)){
         Try{
            $global:UserName = $WPFUsernameInput.text
            $WPFUserImage.Visibility = 'Hidden'
            $WPFInfoLabel.Visibility = 'Hidden'
            $NewPassword = ConvertTo-SecureString -String $WPFPasswordEntry.text -AsPlainText -Force
            Set-ADAccountPassword $global:UserName -NewPassword $NewPassword -Reset -PassThru | Set-ADuser -ChangePasswordAtLogon $True
            $a = new-object -comobject wscript.shell
            $b = $a.popup("Password has been changed. ",2,"",0)
            LogWrite "$LogOutput $global:UserName had their password reset."
            }
         Catch{}
        }

        IF(($EnableAccount -eq 1) -and ($global:UserName)){
         Try{
            if ($WPFResults.Visibility -ne 'Visible')
            {$WPFResults.Visibility = 'Visible'}
            $WPFUserImage.Visibility = 'Hidden'
            $WPFInfoLabel.Visibility = 'Hidden'
            $global:UserName = $WPFUsernameInput.text
            Enable-ADAccount -Identity $global:UserName
            $WPFResults.Text = "Enabled account for username: $global:UserName"
            ##If AD account is actually found, then do the following;
            $a = new-object -comobject wscript.shell
            $b = $a.popup("User account $global:UserName has been enabled. ",2,"",0)
            LogWrite "$LogOutput $global:UserName was enabled."
            }
         Catch{}
        }

        IF(($DisableAccount -eq 1 ) -and ($global:UserName)){
         Try{
            if ($WPFResults.Visibility -ne 'Visible')
            {$WPFResults.Visibility = 'Visible'}
            $WPFUserImage.Visibility = 'Hidden'
            $WPFInfoLabel.Visibility = 'Hidden'
            $global:UserName = $WPFUsernameInput.text
            Disable-ADAccount -Identity $global:UserName
            $WPFResults.Text = "Disabled account for username: $global:UserName"
            $a = new-object -comobject wscript.shell
            $b = $a.popup("User account $global:UserName has been disabled. ",2,"",0)
            LogWrite "$LogOutput $global:UserName was disabled."
            }
            Catch{}
            }    

})      

#Action Button to click     

# Results text box that appears





#===========================================================================

# Shows the form

#===========================================================================

write-host "To show the form, run the following" -ForegroundColor Cyan

'$Form.ShowDialog() | out-null'

function Show-Form{

$Form.ShowDialog() | out-null

}
Show-Form
