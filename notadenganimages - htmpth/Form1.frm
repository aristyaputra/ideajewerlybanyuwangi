VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   1410
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   2325
   LinkTopic       =   "Form1"
   ScaleHeight     =   1410
   ScaleWidth      =   2325
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Print Report"
      Height          =   495
      Left            =   600
      TabIndex        =   0
      Top             =   480
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'This project is using
'Crystal Report Developer 8.5
'File name: Report1.rpt
'Microsoft Access 2000 Database (Password protected)
'File name: MyDatabase
'Database Password: report
'connect by ADO
'Set Project Reference to
'Microsoft ActiveX Data Objects 2.7 Library

Private Sub cmdPrint_Click()
    Form2.WindowState = 2
    Form2.Show
    Unload Me
End Sub

Private Sub Form_Load()
On Error GoTo checkErr
    Dim cmd As String

    'Set cn = New ADODB.Connection
    
    'cn.Provider = "Microsoft.Jet.OLEDB.4.0"
    'cn.ConnectionString = "Data Source=" & App.Path & "\MyDatabase.mdb"
    'cn.Properties("Jet OLEDB:Database Password") = "report"
    'cn.Open
    
    Call koneksiMySQL
    
    OpenDatabase = True
    Exit Sub
checkErr:
    MsgBox Error
End Sub


