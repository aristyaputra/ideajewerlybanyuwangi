VERSION 5.00
Object = "{C4847593-972C-11D0-9567-00A0C9273C2A}#8.0#0"; "crviewer.dll"
Begin VB.Form Form2 
   Caption         =   "Nota Cashier"
   ClientHeight    =   3945
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   5385
   Icon            =   "Form2.frx":0000
   LinkTopic       =   "Form2"
   ScaleHeight     =   3945
   ScaleWidth      =   5385
   StartUpPosition =   3  'Windows Default
   Begin CRVIEWERLibCtl.CRViewer CRViewer1 
      Height          =   2175
      Left            =   480
      TabIndex        =   1
      Top             =   360
      Width           =   3015
      DisplayGroupTree=   -1  'True
      DisplayToolbar  =   -1  'True
      EnableGroupTree =   -1  'True
      EnableNavigationControls=   -1  'True
      EnableStopButton=   -1  'True
      EnablePrintButton=   -1  'True
      EnableZoomControl=   -1  'True
      EnableCloseButton=   -1  'True
      EnableProgressControl=   -1  'True
      EnableSearchControl=   -1  'True
      EnableRefreshButton=   -1  'True
      EnableDrillDown =   -1  'True
      EnableAnimationControl=   -1  'True
      EnableSelectExpertButton=   0   'False
      EnableToolbar   =   -1  'True
      DisplayBorder   =   -1  'True
      DisplayTabs     =   -1  'True
      DisplayBackgroundEdge=   -1  'True
      SelectionFormula=   ""
      EnablePopupMenu =   -1  'True
      EnableExportButton=   0   'False
      EnableSearchExpertButton=   0   'False
      EnableHelpButton=   0   'False
   End
   Begin VB.CommandButton Command1 
      Caption         =   "CETAK "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   1800
      TabIndex        =   0
      Top             =   1320
      Width           =   2055
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim db As CRAXDRT.Database
Dim rpt As New CRAXDRT.Report
Dim appl As New CRAXDRT.Application
Dim WithEvents sect As CRAXDRT.Section
Attribute sect.VB_VarHelpID = -1

Private Sub Command1_Click()
'CRViewer1.Refresh

CRViewer1.Top = 0
CRViewer1.DisplayGroupTree = False
CRViewer1.Left = 0
Command1.Visible = False
Me.WindowState = 2
'CRViewer1.PrintReport
'Unload Me
End Sub

Private Sub Form_Load()
Dim rs As New ADODB.Recordset
Dim rs_no_nota As New ADODB.Recordset
Dim var_sales_no As String
    Call koneksiMySQL
    Set appl = Nothing
    Set rpt = Nothing
    
    Screen.MousePointer = vbHourglass
    
    Set appl = New CRAXDRT.Application
    Set rpt = appl.OpenReport(App.Path & "\Report\NotaKasir.rpt")
    Set db = rpt.Database
    Set sect = rpt.Sections("Section5")
    
    Set rs_no_nota = Nothing
    rs_no_nota.Open "SELECT * FROM temp_no_nota", conn, 1, 1
    
    If rs_no_nota.EOF = False Then
        var_sales_no = rs_no_nota.Fields("no_sales")
  Else
        Exit Sub
    End If
    

    Set rs = Nothing
    rs.Open "SELECT * FROM view_ctk_cashier", conn, adOpenDynamic, adLockBatchOptimistic
    rpt.DiscardSavedData
    rpt.Database.SetDataSource rs, 3, 1
    rpt.RecordSelectionFormula = "{view_ctk_cashier.no_sales} ='" & var_sales_no & "'"
 
    
    CRViewer1.ReportSource = rpt
    CRViewer1.ViewReport
    CRViewer1.EnableExportButton = False
    Screen.MousePointer = vbDefault
    Set appl = Nothing
    Set rpt = Nothing
    
    
    Call Command1_Click
    
End Sub

Private Sub Form_Resize()
    'CRViewer1.Top = 0
    'CRViewer1.Left = 0
    'CRViewer1.Height = ScaleHeight
    'CRViewer1.Width = ScaleWidth
    CRViewer1.Height = ScaleHeight
    CRViewer1.Width = ScaleWidth
End Sub

Sub bukacr(opt As String, condition As String)
Dim sqlstr As String

'koneksiMySQL
    cr1.Connect = "DSN=smarterp_tokoemas;uid=root;PWD=L1v326110711;"
    
    
    
    
        cr1.ReportFileName = App.Path & "\Report\NotaKasir.rpt"
        sqlstr = "SELECT * FROM view_ctk_cashier where no_sales = '" & var_sales_no & "'"

        cr1.SQLQuery = sqlstr
        
'sambung_panca ("")
   ' cr1.ParameterFields(0) = "header;" & "Periode " & Format(dtawalper.Value, "dd/mm/yy") & "-" & Format(dtakhirper.Value, "dd/mm/yy") & ";True"

'    cr1.SelectionFormula = sqlstr
'    cr1.WindowShowExportBtn = False
'   MsgBox cr1.SQLQuery
'    cr1.ReplaceSelectionFormula (sqlstr)
    cr1.WindowState = crptMaximized
    cr1.Action = 1

End Sub

Private Sub Form_Unload(Cancel As Integer)
    conn.Close
End Sub

Private Sub sect_Format(ByVal pFormattingInfo As Object)
Dim bmp As StdPicture
    On Error Resume Next
    With sect.ReportObjects
        'Check picture file exist or not using
        'FileSystemObject.FileExists
       
        Set bmp = LoadPicture(Replace(.Item("Field17").Value, "/", "\"))
        'Set bmp = LoadPicture(Replace("C:/03200011409201622.jpg", "/", "\"))
        Set .Item("Picture1").FormattedPicture = bmp
    End With
End Sub
