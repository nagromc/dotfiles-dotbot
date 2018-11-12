classname = ""
keystate = ""

*Capslock::
  WinGetClass, classname, A
  if (classname in "mintty","VirtualConsoleClass","ConsoleWindowClass","PuTTY")
  {
    SetCapsLockState, Off
    Send, {ESC}
  }
  else
  {
    GetKeyState, keystate, CapsLock, T
    if (keystate = "D")
      SetCapsLockState, Off
    else
      SetCapsLockState, On
    return
  }
  return
