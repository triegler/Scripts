; Set the mouse shadow to disabled

Shadow_Enabled = 0 ;Set to 0 for disable, and 1 for enabled
SPI_SETCURSORSHADOW = 0x101B
DllCall("SystemParametersInfo", UINT, SPI_SETCURSORSHADOW, UINT, 0, UINT, Shadow_Enabled, UINT, 0)

