'C:\WINDOWS\Microsoft.NET\Framework\v4.0.30319\vbc.exe /t:exe /out:.\app-printscreen.exe app-print-screen.vb'
Imports System
Imports Clipboard = System.Windows.Forms.Clipboard
Imports ConsoleApplicationBase = Microsoft.VisualBasic.ApplicationServices.ConsoleApplicationBase

Public Module modmain
   Sub Main()
     Dim consoleApp as ConsoleApplicationBase
     consoleApp = New ConsoleApplicationBase()
     Console.WriteLine ("send keys")
     Dim app as String
     Dim keys as String
     app = consoleApp.CommandLineArgs(0)
     keys = consoleApp.CommandLineArgs(1) 
     Console.WriteLine ("Going to try to open '" & app &"'")
     AppActivate(app)
     System.Threading.Thread.Sleep(500)
     Console.WriteLine ("Going to try to send the keys '" & keys &"'")
     System.Windows.Forms.SendKeys.SendWait(keys)
   End Sub
End Module


