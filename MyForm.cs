using System;
using System.Drawing;
using System.Windows.Forms;
using System.Threading;

class MyForm : Form
{
     public MyForm()
     {                   
     }

     public static void Main()
     {
            Application.Run(new MyForm());
	    Thread.Sleep(5000);
            System.Windows.Forms.SendKeys.Send("%{PRTSC}");
     }
}

