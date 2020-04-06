/**
 * 
 */
Function bytes2BSTR(vIn)
  dim i
  strReturn = ""
  For i = 1 To LenB(vIn)
  ThisCharCode = AscB(MidB(vIn,i,1))
  If ThisCharCode < &H80 Then
  strReturn = strReturn & Chr(ThisCharCode)
  Else
  NextCharCode = AscB(MidB(vIn,i+1,1))
  strReturn = strReturn & Chr(CLng(ThisCharCode) * &H100 + CInt(NextCharCode))
  i = i + 1
  End If
  Next
  bytes2BSTR = strReturn
End Function
