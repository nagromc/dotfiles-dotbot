classname = ""
keystate = ""

*Capslock::
  WinGetClass, classname, A
  if (classname = "mintty")
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
