'C:\WINDOWS\Microsoft.NET\Framework\v4.0.30319\vbc.exe /t:exe /out:.\app-printscreen.exe app-print-screen.vb'
Imports System
Imports Clipboard = System.Windows.Forms.Clipboard
Imports ConsoleApplicationBase = Microsoft.VisualBasic.ApplicationServices.ConsoleApplicationBase

Public Module modmain
   Sub Main()
     Dim consoleApp as ConsoleApplicationBase
     consoleApp = New ConsoleApplicationBase()
     Console.WriteLine ("App Print Screen By Drew LeSueur")
     Dim app as String
     Dim dest as String
     app = consoleApp.CommandLineArgs(0)
     dest = consoleApp.CommandLineArgs(1)
     Console.WriteLine ("Going to try to open '" & app &"'")
     AppActivate(app)
     'System.Windows.Forms.SendKeys.Send("%{PRTSC}")
     System.Threading.Thread.Sleep(500)
     System.Windows.Forms.SendKeys.SendWait("%{PRTSC}")
     Dim image As System.Drawing.Image = Nothing
     If Clipboard.ContainsImage() Then
       image = Clipboard.GetImage()
       Console.WriteLine ("Going to save to '" & dest &"'")
       image.Save(dest)
     End If
   End Sub
End Module

