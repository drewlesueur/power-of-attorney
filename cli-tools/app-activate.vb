'C:\WINDOWS\Microsoft.NET\Framework\v4.0.30319\vbc.exe /t:exe /out:.\app-printscreen.exe app-print-screen.vb'
Imports System
Imports Clipboard = System.Windows.Forms.Clipboard
Imports ConsoleApplicationBase = Microsoft.VisualBasic.ApplicationServices.ConsoleApplicationBase

Public Module modmain
   Sub Main()
     Dim consoleApp as ConsoleApplicationBase
     consoleApp = New ConsoleApplicationBase()
     Console.WriteLine ("App Activate By Drew LeSueur")
     Dim app as String
     app = consoleApp.CommandLineArgs(0)
     Console.WriteLine ("Going to try to open '" & app &"'")
     AppActivate(app)
   End Sub
End Module

