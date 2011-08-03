'C:\WINDOWS\Microsoft.NET\Framework\v4.0.30319>vbc.exe /t:exe /out:.\Test1.exe C:\Documents and Settings\Drew LeSueur\workspace\lcc\power-of-attorney\Test.vb"

' Allow easy reference to the System namespace classes.
Imports System
' This module houses the application's entry point.
Public Module modmain
   ' Main is the application's entry point.
   Sub Main()
     ' Write text to the console.
     Console.WriteLine ("Hello World using Visual Basic!")
     AppActivate("Untitled - Notepad")
     'System.Windows.Forms.SendKeys.Send("%{PRTSC}")
     System.Threading.Thread.Sleep(1000)
     System.Windows.Forms.SendKeys.SendWait("%{PRTSC}")

   End Sub
End Module

