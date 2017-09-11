# Code stolen from here: 
# https://blogs.technet.microsoft.com/heyscriptingguy/2013/01/17/use-powershell-to-change-the-mouse-pointer-scheme/

# In SystemParametersInfo, SPI_SETCURSORSHADOW = 0x101B

# Code for all SystemParametersInfo variables from MSDN here: 
# https://msdn.microsoft.com/en-us/library/windows/desktop/ms724947(v=vs.85).aspx

$uiAction = 0x101B # Set to the value of SPI_SETCURSORSHADOW
$uiParam = 0  # Default
$pvParam = 0  # Set this to 0 to disable the cursor shadow, or 1 to enabled it.
$fWinIni = 0  # Default

$CSharpSig = @'
[DllImport("user32.dll", EntryPoint = "SystemParametersInfo")]
public static extern bool SystemParametersInfo(
                 uint uiAction,
                 uint uiParam,
                 uint pvParam,
                 uint fWinIni);
'@

$CursorShadow = Add-Type -MemberDefinition $CSharpSig -Name WinAPICall -Namespace SystemParamInfo –PassThru

#$CursorShadow::SystemParametersInfo(0x101B,0,0,0)
#$CursorShadow::SystemParametersInfo(SPI_SETCURSORSHADOW,0,0,0)
$CursorShadow::SystemParametersInfo($uiAction,$uiParam,$pvParam,$fWinIni)