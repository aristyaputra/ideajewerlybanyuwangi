Imports DevExpress.XtraBars.Alerter

Public Class CucianInStok

    Public insert As Integer
    Public edit As Integer
    Dim pesan As String
    Public NoOpname As String


    'conrigure barcode argox CP-2140
    Const IMAGE_BITMAP = 0
    Const LR_LOADFROMFILE = &H10
    Private Declare Function LoadImage Lib "user32" Alias "LoadImageA" (ByVal hInst As Integer, _
            ByVal lpsz As String, ByVal un1 As Integer, ByVal n1 As Integer, ByVal n2 As Integer, _
            ByVal un2 As Integer) As Integer
    Private Declare Function DeleteObject Lib "Gdi32" (ByVal ho As Integer) As Integer
    Const szSavePath As String = "C:\Argox"
    Const szSaveFile As String = "C:\Argox\PPLB_Example.Prn"
    Const sznop1 As String = "nop_front" + vbCrLf
    Const sznop2 As String = "nop_middle" + vbCrLf
    Private Declare Function B_Bar2d_Maxi Lib "WINPPLB.DLL" (ByVal x As Integer, ByVal y As Integer, _
            ByVal cl As Integer, ByVal cc As Integer, ByVal pc As Integer, ByVal data As String) As Integer
    Private Declare Function B_Bar2d_PDF417 Lib "WINPPLB.DLL" (ByVal x As Integer, ByVal y As Integer, _
            ByVal w As Integer, ByVal v As Integer, ByVal s As Integer, ByVal c As Integer, _
            ByVal px As Integer, ByVal py As Integer, ByVal r As Integer, ByVal l As Integer, _
            ByVal t As Integer, ByVal o As Integer, ByVal data As String) As Integer
    Private Declare Function B_Bar2d_PDF417_N Lib "WINPPLB.DLL" (ByVal x As Integer, ByVal y As Integer, _
            ByVal w As Integer, ByVal h As Integer, ByVal Para As String, ByVal data As String) As Integer
    Private Declare Sub B_ClosePrn Lib "WINPPLB.DLL" ()
    Private Declare Function B_CreatePrn Lib "WINPPLB.DLL" (ByVal selection As Integer, _
            ByVal filename As String) As Integer
    Private Declare Function B_Del_Form Lib "WINPPLB.DLL" (ByVal formname As String) As Integer
    Private Declare Function B_Del_Pcx Lib "WINPPLB.DLL" (ByVal pcxname As String) As Integer
    Private Declare Function B_Draw_Box Lib "WINPPLB.DLL" (ByVal x As Integer, ByVal y As Integer, _
            ByVal thickness As Integer, ByVal hor_dots As Integer, ByVal ver_dots As Integer) As Integer
    Private Declare Function B_Draw_Line Lib "WINPPLB.DLL" (ByVal mode As Byte, ByVal x As Integer, _
            ByVal y As Integer, ByVal hor_dots As Integer, ByVal ver_dots As Integer) As Integer
    Private Declare Function B_Error_Reporting Lib "WINPPLB.DLL" (ByVal options As Byte) As Integer
    Private Declare Function B_Get_DLL_Version Lib "WINPPLB.DLL" (ByVal nShowMessage As Integer) As String
    Private Declare Function B_Get_DLL_VersionA Lib "WINPPLB.DLL" (ByVal nShowMessage As Integer) As Integer
    Private Declare Function B_Get_Graphic_ColorBMP Lib "WINPPLB.DLL" (ByVal x As Integer, _
            ByVal y As Integer, ByVal filename As String) As Integer
    Private Declare Function B_Get_Graphic_ColorBMPEx Lib "WINPPLB.DLL" (ByVal x As Integer, _
            ByVal y As Integer, ByVal nWidth As Integer, ByVal nHeight As Integer, _
            ByVal rotate As Integer, ByVal id_name As String, ByVal filename As String) As Integer
    Private Declare Function B_Get_Graphic_ColorBMP_HBitmap Lib "WINPPLB.DLL" (ByVal x As Integer, _
            ByVal y As Integer, ByVal nWidth As Integer, ByVal nHeight As Integer, _
            ByVal rotate As Integer, ByVal id_name As String, ByVal hbm As Integer) As Integer
    Private Declare Function B_Get_Pcx Lib "WINPPLB.DLL" (ByVal x As Integer, ByVal y As Integer, _
            ByVal filename As String) As Integer
    Private Declare Function B_Initial_Setting Lib "WINPPLB.DLL" (ByVal TType As Integer, _
            ByVal Source As String) As Integer
    Private Declare Function B_WriteData Lib "WINPPLB.DLL" (ByVal IsImmediate As Integer, _
            ByVal pbuf As Byte(), ByVal length As ULong) As Integer
    Private Declare Function B_ReadData Lib "WINPPLB.DLL" (ByVal pbuf As Byte(), ByVal length As ULong, _
            ByVal dwTimeoutms As ULong) As Integer
    Private Declare Function B_Load_Pcx Lib "WINPPLB.DLL" (ByVal x As Integer, ByVal y As Integer, _
            ByVal pcxname As String) As Integer
    Private Declare Function B_Open_ChineseFont Lib "WINPPLB.DLL" (ByVal path As String) As Integer
    Private Declare Function B_Print_Form Lib "WINPPLB.DLL" (ByVal labset As Integer, _
            ByVal copies As Integer, ByVal form_out As String, ByVal var As String) As Integer
    Private Declare Function B_Print_MCopy Lib "WINPPLB.DLL" (ByVal labset As Integer, _
            ByVal copies As Integer) As Integer
    Private Declare Function B_Print_Out Lib "WINPPLB.DLL" (ByVal labset As Integer) As Integer
    Private Declare Function B_Prn_Barcode Lib "WINPPLB.DLL" (ByVal x As Integer, ByVal y As Integer, _
            ByVal ori As Integer, ByVal TType As String, ByVal narrow As Integer, ByVal width As Integer, _
            ByVal height As Integer, ByVal human As Byte, ByVal data As String) As Integer
    Private Declare Sub B_Prn_Configuration Lib "WINPPLB.DLL" ()
    Private Declare Function B_Prn_Text Lib "WINPPLB.DLL" (ByVal x As Integer, ByVal y As Integer, _
            ByVal ori As Integer, ByVal font As Integer, ByVal hor_factor As Integer, _
            ByVal ver_factor As Integer, ByVal mode As Byte, ByVal data As String) As Integer
    Private Declare Function B_Prn_Text_Chinese Lib "WINPPLB.DLL" (ByVal x As Integer, ByVal y As Integer, _
            ByVal fonttype As Integer, ByVal id_name As String, ByVal data As String) As Integer
    Private Declare Function B_Prn_Text_TrueType Lib "WINPPLB.DLL" (ByVal x As Integer, _
            ByVal y As Integer, ByVal FSize As Integer, ByVal FType As String, ByVal Fspin As Integer, _
            ByVal FWeight As Integer, ByVal FItalic As Integer, ByVal FUnline As Integer, _
            ByVal FStrikeOut As Integer, ByVal id_name As String, ByVal data As String) As Integer
    Private Declare Function B_Prn_Text_TrueType_W Lib "WINPPLB.DLL" (ByVal x As Integer, _
            ByVal y As Integer, ByVal FHeight As Integer, ByVal FWidth As Integer, ByVal FType As String, _
            ByVal Fspin As Integer, ByVal FWeight As Integer, ByVal FItalic As Integer, _
            ByVal FUnline As Integer, ByVal FStrikeOut As Integer, ByVal id_name As String, _
            ByVal data As String) As Integer
    Private Declare Function B_Select_Option Lib "WINPPLB.DLL" (ByVal object_Renamed As Integer) As Integer
    Private Declare Function B_Select_Option2 Lib "WINPPLB.DLL" (ByVal object_Renamed As Integer, _
            ByVal p As Integer) As Integer
    Private Declare Function B_Select_Symbol Lib "WINPPLB.DLL" (ByVal num_bit As Integer, _
            ByVal symbol As Integer, ByVal country As Integer) As Integer
    Private Declare Function B_Select_Symbol2 Lib "WINPPLB.DLL" (ByVal num_bit As Integer, _
            ByVal symbol As String, ByVal country As Integer) As Integer
    Private Declare Function B_Set_Backfeed Lib "WINPPLB.DLL" (ByVal options As Byte) As Integer
    Private Declare Function B_Set_BMPSave Lib "WINPPLB.DLL" (ByVal nSave As Integer, _
            ByVal pstrBMPFName As String) As Integer
    Private Declare Function B_Set_Darkness Lib "WINPPLB.DLL" (ByVal darkness As Integer) As Integer
    Private Declare Function B_Set_DebugDialog Lib "WINPPLB.DLL" (ByVal nEnable As Integer) As Integer
    Private Declare Function B_Set_Direction Lib "WINPPLB.DLL" (ByVal direction As Byte) As Integer
    Private Declare Function B_Set_Form Lib "WINPPLB.DLL" (ByVal formfile As String) As Integer
    Private Declare Function B_Set_Labgap Lib "WINPPLB.DLL" (ByVal lablength As Integer, _
            ByVal gaplength As Integer) As Integer
    Private Declare Function B_Set_Labwidth Lib "WINPPLB.DLL" (ByVal labwidth As Integer) As Integer
    Private Declare Function B_Set_Originpoint Lib "WINPPLB.DLL" (ByVal hor As Integer, _
            ByVal ver As Integer) As Integer
    Private Declare Function B_Set_Prncomport Lib "WINPPLB.DLL" (ByVal baud As Integer, _
            ByVal parity As Byte, ByVal data As Integer, ByVal stopp As Integer) As Integer
    Private Declare Function B_Set_Prncomport_PC Lib "WINPPLB.DLL" (ByVal nBaudRate As Integer, _
            ByVal nByteSize As Integer, ByVal nParity As Integer, ByVal nStopBits As Integer, _
            ByVal nDsr As Integer, ByVal nCts As Integer, ByVal nXonXoff As Integer) As Integer
    Private Declare Function B_Set_Speed Lib "WINPPLB.DLL" (ByVal speed As Integer) As Integer
    Private Declare Function B_Set_ProcessDlg Lib "WINPPLB.DLL" (ByVal nShow As Integer) As Integer
    Private Declare Function B_Set_ErrorDlg Lib "WINPPLB.DLL" (ByVal nShow As Integer) As Integer
    Private Declare Function B_GetUSBBufferLen Lib "WINPPLB.DLL" () As Integer
    'buf is buffer address, so can use "ByVal buf As String" . You can reference VB_6 example.
    Private Declare Function B_EnumUSB Lib "WINPPLB.DLL" (ByVal buf As Byte()) As Integer
    Private Declare Function B_CreateUSBPort Lib "WINPPLB.DLL" (ByVal nPort As Integer) As Integer
    Private Declare Function B_ResetPrinter Lib "WINPPLB.DLL" () As Integer
    'buf is buffer address, so can use "ByVal buf As String" . You can reference VB_6 example.
    Private Declare Function B_GetPrinterResponse Lib "WINPPLB.DLL" (ByVal pbuf As Byte(), _
            ByVal nMax As Integer) As Integer
    Private Declare Function B_TFeedMode Lib "WINPPLB.DLL" (ByVal nMode As Integer) As Integer
    Private Declare Function B_TFeedTest Lib "WINPPLB.DLL" () As Integer
    Private Declare Function B_CreatePort Lib "WINPPLB.DLL" (ByVal nPortType As Integer, _
            ByVal nPort As Integer, ByVal filename As String) As Integer
    Private Declare Function B_Execute_Form Lib "WINPPLB.DLL" (ByVal form_out As String, _
            ByVal var As String) As Integer
    Private Declare Function B_Bar2d_QR Lib "WINPPLB.DLL" (ByVal x As Integer, ByVal y As Integer, _
            ByVal model As Integer, ByVal scl As Integer, ByVal err As Byte, ByVal dinput As Byte, _
            ByVal c As Integer, ByVal d As Integer, ByVal p As Integer, ByVal data As String) As Integer
    Private Declare Function B_GetNetPrinterBufferLen Lib "WINPPLB.DLL" () As Integer
    'buf is buffer address, so can use "ByVal buf As String" . You can reference VB_6 example.
    Private Declare Function B_EnumNetPrinter Lib "WINPPLB.DLL" (ByVal buf As Byte()) As Integer
    Private Declare Function B_CreateNetPort Lib "WINPPLB.DLL" (ByVal nPort As Integer) As Integer
    'data is buffer address, so can use "ByVal data As Integer" or "ByRef data As Byte". You can reference VB_6 example.
    Private Declare Function B_Prn_Text_TrueType_Uni Lib "WINPPLB.DLL" (ByVal x As Integer, _
            ByVal y As Integer, ByVal FSize As Integer, ByVal FType As String, ByVal Fspin As Integer, _
            ByVal FWeight As Integer, ByVal FItalic As Integer, ByVal FUnline As Integer, _
            ByVal FStrikeOut As Integer, ByVal id_name As String, ByVal data As Byte(), _
            ByVal format As Integer) As Integer
    'data is buffer address, so can use "ByVal data As Integer" or "ByRef data As Byte". You can reference VB_6 example.
    Private Declare Function B_Prn_Text_TrueType_UniB Lib "WINPPLB.DLL" (ByVal x As Integer, _
            ByVal y As Integer, ByVal FSize As Integer, ByVal FType As String, ByVal Fspin As Integer, _
            ByVal FWeight As Integer, ByVal FItalic As Integer, ByVal FUnline As Integer, _
            ByVal FStrikeOut As Integer, ByVal id_name As String, ByVal data As Byte(), _
            ByVal format As Integer) As Integer
    'pDeviceName and pDevicePath are buffer address, so can use "ByVal pDeviceName As String" and "ByVal pDevicePath As String". You can reference VB_6 example.
    Private Declare Function B_GetUSBDeviceInfo Lib "WINPPLB.DLL" (ByVal nPort As Integer, _
            ByVal pDeviceName As Byte(), ByRef pDeviceNameLen As Integer, ByVal pDevicePath As Byte(), _
            ByRef pDevicePathLen As Integer) As Integer
    Private Declare Function B_Set_EncryptionKey Lib "WINPPLB.DLL" (ByVal encryptionKey As String) As Integer
    Private Declare Function B_Check_EncryptionKey Lib "WINPPLB.DLL" (ByVal decodeKey As String, _
            ByVal encryptionKey As String, ByVal dwTimeoutms As ULong) As Integer


    Private Sub frmsetupcashbank_Activated(sender As Object, e As System.EventArgs) Handles Me.Activated
        Me.WindowState = FormWindowState.Maximized
    End Sub

    Private Sub frmsetupcashbank_FormClosed(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosedEventArgs) Handles Me.FormClosed
        close_conn()
        MainMenu.Activate()
    End Sub

    Private Sub frmstockopname_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        open_conn()
        Me.WindowState = FormWindowState.Maximized
        Me.MdiParent = MainMenu
        insert = 1
        edit = 0
        Dim Rows As Integer
        Rows = select_warehouse.Rows.Count - 1
        datagrid_layout()
        GroupControl9.Visible = False
    End Sub
    Private Sub datagrid_layout()
        open_conn()
        With dgcash
            .SelectionMode = DataGridViewSelectionMode.FullRowSelect
            '.AlternatingRowsDefaultCellStyle.BackColor = Color.AliceBlue
            .CellBorderStyle = DataGridViewCellBorderStyle.SingleVertical
            .RowsDefaultCellStyle.SelectionBackColor = Color.FromArgb(var_red, var_grey, var_blue)
            .RowsDefaultCellStyle.SelectionForeColor = Color.Black
        End With
        With dgbank
            .SelectionMode = DataGridViewSelectionMode.FullRowSelect
            .CellBorderStyle = DataGridViewCellBorderStyle.SingleVertical
            '.AlternatingRowsDefaultCellStyle.BackColor = Color.AliceBlue
            .RowsDefaultCellStyle.SelectionBackColor = Color.FromArgb(var_red, var_grey, var_blue)
            .RowsDefaultCellStyle.SelectionForeColor = Color.Black
        End With
        dgbank.ReadOnly = False
        dgbank.Columns(0).ReadOnly = False
        dgbank.Columns(1).ReadOnly = True
        dgbank.Columns(2).ReadOnly = True
        dgbank.Columns(3).ReadOnly = True
        dgbank.Columns(4).ReadOnly = True


        dgcash.ReadOnly = False
        dgcash.Columns(0).ReadOnly = False
        dgcash.Columns(1).ReadOnly = True
        dgcash.Columns(2).ReadOnly = True
        dgbank.Columns(3).ReadOnly = True
        dgbank.Columns(4).ReadOnly = True

        view_data_cash()
        '   view_data_bank()
    End Sub
    Private Sub btn_save2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_save2.Click
        open_conn()
        insert_data()
    End Sub

    Private Sub view_data_cash()
        open_conn()
        Dim DT As DataTable
        Dim z As Integer
        DT = daftar_cucian()
        dgcash.AutoGenerateColumns = False
        dgcash.DataSource = DT

        dgcash.Columns(0).DataPropertyName = "id_item"
        dgcash.Columns(1).DataPropertyName = "item_name"
        dgcash.Columns(2).DataPropertyName = "weight"
        dgcash.Columns(3).DataPropertyName = "kadar"
        dgcash.Columns(4).DataPropertyName = "no_cucian"
        dgcash.Columns(5).DataPropertyName = "qty"
        dgcash.Columns(6).DataPropertyName = "id_unit"
        dgcash.Columns(7).DataPropertyName = "mst_itemcat_nm"
        dgcash.Columns(8).DataPropertyName = "mst_itemjenis_nm"

        'z = DT.Rows.Count - 1
        'For b = 0 To z
        '    dgcash.Rows.Add(1)
        '    dgcash.Item(0, b).Value = DT.Rows(b).Item(0)
        '    dgcash.Item(1, b).Value = DT.Rows(b).Item(1)
        '    If DT.Rows(b).Item(2) = "true" Then
        '        dgcash.Item(2, b).Value = True
        '    ElseIf DT.Rows(b).Item(2) = "false" Then
        '        dgcash.Item(2, b).Value = False
        '    End If
        'Next
    End Sub

    Private Sub view_data_bank()
        open_conn()
        Dim DT As DataTable
        Dim z As Integer
        DT = select_bank_set()
        dgbank.AutoGenerateColumns = False
        dgbank.DataSource = DT
        dgbank.Columns(0).DataPropertyName = "id_account"
        dgbank.Columns(1).DataPropertyName = "account_name"
        dgbank.Columns(2).DataPropertyName = "pilih"

        'z = DT.Rows.Count - 1
        'For b = 0 To z
        '    dgbank.Rows.Add(1)
        '    dgbank.Item(0, b).Value = DT.Rows(b).Item(0)
        '    dgbank.Item(1, b).Value = DT.Rows(b).Item(1)
        '    If DT.Rows(b).Item(2) = "true" Then
        '        dgbank.Item(2, b).Value = True
        '    ElseIf DT.Rows(b).Item(2) = "false" Then
        '        dgbank.Item(2, b).Value = False
        '    End If
        'Next
    End Sub

    Private Sub view_data_employee()
        open_conn()
        Dim Rows As Integer
        Rows = dgbank.Rows.Count - 1
        dg_employee.Rows.Clear()
        For i = 0 To Rows
            dg_employee.Rows.Add()
            dg_employee.Item(0, i).Value = dgbank.Item(0, i).Value
            dg_employee.Item(1, i).Value = dgbank.Item(1, i).Value
            dg_employee.Item(2, i).Value = dgbank.Item(0, i).Value
            dg_employee.Item(3, i).Value = FormatNumber(dgbank.Item(2, i).Value, 2)
            '    dg_employee.Item(4, i).Value = dtcust.Rows(i).Item("qty")
            dg_employee.Item(5, i).Value = dgbank.Item(8, i).Value
            dg_employee.Item(6, i).Value = dgbank.Item(7, i).Value
            dg_employee.Item(7, i).Value = FormatNumber(dgbank.Item(3, i).Value, 2)
            '  dg_marketing.CurrentCell = dg_marketing(0, dg_marketing.CurrentCell.RowIndex + 1)
        Next
    End Sub

    Private Sub insert_data()
        open_conn()
        If insert = 1 Then

            'For i = 0 To dgcash.Rows.Count - 1
            '    If dgcash.Item(2, i).Value = True Then
            '        Call insert_cashbank_setup(dgcash.Item(0, i).Value, i, username, server_datetime(), 1)
            '    End If
            'Next

            For j = 0 To dgbank.Rows.Count - 1
                ' If dgbank.Item(2, j).Value = True Then
                Call insert_stock_cucian(dgbank.Item(0, j).Value, server_datetime(), username, server_datetime(), username, server_datetime(), dgbank.Item(0, j).Value, dgbank.Item(5, j).Value, dgbank.Item(6, j).Value, "INSERT")
                'End If
            Next

            If param_sukses = True Then
                Dim info As AlertInfo = New AlertInfo(msgtitle_save_success, msgbox_save_success)
                alertControl_success.Show(Me, info)

                GroupControl9.Visible = True
                view_data_employee()

                dg_employee.SelectionMode = DataGridViewSelectionMode.FullRowSelect
                dg_marketing.SelectionMode = DataGridViewSelectionMode.FullRowSelect

                Dim row_jml As Integer
                dg_marketing.Rows.Clear()
                For a As Integer = 0 To dg_employee.Rows.Count - 1
                    For z As Integer = 0 To dgbank.Item(5, a).Value - 1
                        dg_marketing.Rows.Add(1)
                        If dg_marketing.Rows.Count = 1 Then
                            dg_marketing.CurrentCell = dg_marketing(0, 0)
                        ElseIf dg_marketing.Rows.Count > 1 Then
                            dg_marketing.CurrentCell = dg_marketing(0, dg_marketing.CurrentCell.RowIndex + 1)
                        End If
                        row_jml = dg_marketing.Rows.GetLastRow(DataGridViewElementStates.Displayed)
                        dg_marketing.Item(0, row_jml).Value = dg_employee.Item(0, a).Value
                        dg_marketing.Item(1, row_jml).Value = dg_employee.Item(1, a).Value
                        dg_marketing.Item(2, row_jml).Value = dg_employee.Item(2, a).Value
                        dg_marketing.Item(3, row_jml).Value = dg_employee.Item(3, a).Value
                        dg_marketing.Item(4, row_jml).Value = dg_employee.Item(4, a).Value
                        dg_marketing.Item(5, row_jml).Value = dg_employee.Item(5, a).Value
                        dg_marketing.Item(6, row_jml).Value = dg_employee.Item(6, a).Value
                        dg_marketing.Item(7, row_jml).Value = dg_employee.Item(7, a).Value
                        ' dg_marketing.CurrentCell = dg_marketing(0, dg_marketing.CurrentCell.RowIndex + 1)
                    Next
                Next

                clean()
            Else
                Dim info As AlertInfo = New AlertInfo(msgtitle_save_failed, msgbox_save_failed)
                alertControl_error.Show(Me, info)
            End If
        ElseIf edit = 1 Then
            'For i = 0 To dgcash.Rows.Count - 1
            '    If dgcash.Item(2, i).Value = True Then
            '        Call insert_cashbank_setup(dgcash.Item(0, i).Value, i, username, server_datetime(), 1)
            '    End If
            'Next

            'For j = 0 To dgbank.Rows.Count - 1
            '    If dgbank.Item(2, j).Value = True Then
            '        Call insert_cashbank_setup(dgbank.Item(0, j).Value, j, username, server_datetime(), 2)
            '    End If
            'Next

            'If param_sukses = True Then
            '    Dim info As AlertInfo = New AlertInfo(msgtitle_save_success, msgbox_save_success)
            '    alertControl_success.Show(Me, info)
            '    clean()
            'Else
            '    Dim info As AlertInfo = New AlertInfo(msgtitle_save_failed, msgbox_save_failed)
            '    alertControl_error.Show(Me, info)
            'End If
        End If
    End Sub

    Private Sub clean()
        open_conn()
        insert = 1
        edit = 0
        dgbank.Rows.Clear()
    End Sub

    'Private Sub DataGridView1_CellEndEdit(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs)
    '    open_conn()
    '    Dim balance As Double
    '    Dim mRow As Integer
    '    mRow = dgcash.CurrentCell.RowIndex
    '    balance = dgcash.Item(4, mRow).Value

    'End Sub


    Private Sub GroupBox1_Enter(sender As System.Object, e As System.EventArgs) Handles GroupBox1.Enter

    End Sub

    Private Sub btn_keluar_Click(sender As System.Object, e As System.EventArgs) Handles btn_keluar.Click
        Me.Close()
    End Sub

    Private Sub btn_next_Click(sender As System.Object, e As System.EventArgs) Handles btn_next.Click
        open_conn()
        On Error Resume Next
        Dim index_row, row_jml As Integer
        If dgcash.Rows.Count > 0 Then
            index_row = dgcash.CurrentCell.RowIndex
        End If
        dgcash.Rows.Add(1)
        If dgbank.Rows.Count = 1 Then
            dgbank.CurrentCell = dgbank(0, 0)
        End If
        row_jml = dgbank.Rows.GetLastRow(DataGridViewElementStates.Displayed)
        dgbank.Item(0, row_jml).Value = dgcash.Item(0, index_row).Value
        dgbank.Item(1, row_jml).Value = dgcash.Item(1, index_row).Value
        dgbank.Item(2, row_jml).Value = dgcash.Item(2, index_row).Value
        dgbank.Item(3, row_jml).Value = dgcash.Item(3, index_row).Value
        dgbank.Item(4, row_jml).Value = dgcash.Item(4, index_row).Value
        dgbank.CurrentCell = dgbank(0, dgbank.CurrentCell.RowIndex + 1)
    End Sub

    Private Sub btn_prev_Click(sender As System.Object, e As System.EventArgs) Handles btn_prev.Click
        open_conn()
        Dim index_row As Integer
        If dgbank.Rows.Count > 0 Then
            index_row = dgbank.CurrentCell.RowIndex
        End If
        'dg_employee.Rows.Add(1)
        'row_jml = dg_employee.Rows.GetLastRow(DataGridViewElementStates.Displayed)
        'dg_employee.Item(0, row_jml).Value = dg_marketing.Item(0, index_row).Value
        'dg_employee.Item(1, row_jml).Value = dg_marketing.Item(1, index_row).Value
        'dg_employee.Item(2, row_jml).Value = dg_marketing.Item(2, index_row).Value
        'dg_employee.Item(3, row_jml).Value = dg_marketing.Item(3, index_row).Value
        'dg_employee.Item(4, row_jml).Value = dg_marketing.Item(4, index_row).Value
        'dg_employee.Item(5, row_jml).Value = dg_marketing.Item(5, index_row).Value
        'dg_employee.Item(6, row_jml).Value = dg_marketing.Item(6, index_row).Value
        'dg_employee.Item(7, row_jml).Value = dg_marketing.Item(7, index_row).Value

        dgbank.Rows.RemoveAt(index_row)
    End Sub

    Private Sub SimpleButton29_Click(sender As System.Object, e As System.EventArgs) Handles SimpleButton29.Click
        For i As Integer = 1 To dg_marketing.Rows.Count
            If i = 1 Then
                Call dalete_temp_printbarcode()
            End If
            If i Mod 2 <> 0 Then
                Call temp_print_barcode(i - 1, dg_marketing.Item(0, i - 1).Value, UCase(dg_marketing.Item(1, i - 1).Value), get_item_weight(dg_marketing.Item(0, i - 1).Value), get_item_kadar(dg_marketing.Item(0, i - 1).Value), "", "", 0, 0)
            Else
                Call update_temp_printbarcode(i - 2, "", "", 0, 0, dg_marketing.Item(0, i - 1).Value, UCase(dg_marketing.Item(1, i - 1).Value), get_item_weight(dg_marketing.Item(0, i - 1).Value), get_item_kadar(dg_marketing.Item(0, i - 1).Value))
            End If
        Next

        Dim dt As New DataTable
        dt = select_temp_print_barcode()

        Dim c As Integer
        c = 0
        For i As Integer = 0 To dt.Rows.Count - 1
            Try
                argox_print(c, dt.Rows(i).Item("id_item_1"), dt.Rows(i).Item("item_nm_1"), dt.Rows(i).Item("berat_1"), dt.Rows(i).Item("kadar_1"), dt.Rows(i).Item("id_item_2"), dt.Rows(i).Item("item_nm_2"), dt.Rows(i).Item("berat_2"), dt.Rows(i).Item("kadar_2"))
            Catch ex As Exception

            End Try

            c = c + 1
        Next
    End Sub

    Private Sub argox_print(ByVal x As Integer, ByVal var_id_item_1 As String, ByVal var_item_nm_1 As String, ByVal var_kadar_1 As Double, ByVal var_berat_1 As Double, ByVal var_id_item_2 As String, ByVal var_item_nm_2 As String, ByVal var_kadar_2 As Double, ByVal var_berat_2 As Double)
        Dim current_y, current_y_kode, current_y_berat, current_y_toko As Integer
        'Test code start

        Dim step_bottom, step_bottom_temp As Integer
        step_bottom = 1
        Dim databarcode
        ' For i As Integer = 1 To dg_marketing.Rows.Count
        open_port_kiri(x, var_id_item_1, var_item_nm_1, var_kadar_1, var_berat_1, var_id_item_2, var_item_nm_2, var_kadar_2, var_berat_2)
        ' open_port_kanan(x, var_id_item_1, var_item_nm_1, var_kadar_1, var_berat_1, var_id_item_2, var_item_nm_2, var_kadar_2, var_berat_2)
        'Call B_Prn_Text_TrueType(445, 75, 30, "Arial", 1, 400, 0, 0, 0, "AA", "SUBUR 2") 'save in printer.


        'If step_bottom <= 1 Then
        '    open_port()

        '    current_y = 18
        '    current_y_kode = 135
        '    current_y_berat = 135
        '    current_y_toko = 175
        '    Call B_Prn_Barcode(445, 18, 0, "2", 2, 5, 58, Asc("B"), dg_marketing.Item(2, i - 1).Value) 'have a counter.
        '    Call B_Prn_Text(455, 135, 0, 4, 1, 1, Asc("N"), dg_marketing.Item(0, i - 1).Value)
        '    Call B_Prn_Text(555, 135, 0, 4, 1, 1, Asc("N"), dg_marketing.Item(3, i - 1).Value & "gr")
        '    Call B_Prn_Text(455, 175, 0, 4, 1, 1, Asc("N"), "SUBUR 2")
        '    current_y = 255 + current_y
        '    current_y_berat = 255 + current_y_berat
        '    current_y_kode = current_y_kode + 255
        '    current_y_toko = current_y_toko + 255
        '    step_bottom = step_bottom + 1
        'Else
        '    open_port()
        '    Call B_Prn_Barcode(445, current_y, 0, "2", 2, 5, 58, Asc("B"), dg_marketing.Item(2, i - 1).Value) 'have a counter.
        '    Call B_Prn_Text(455, current_y_kode, 0, 4, 1, 1, Asc("N"), dg_marketing.Item(0, i - 1).Value)
        '    Call B_Prn_Text(555, current_y_berat, 0, 4, 1, 1, Asc("N"), dg_marketing.Item(3, i - 1).Value & "gr")
        '    Call B_Prn_Text(455, current_y_toko, 0, 4, 1, 1, Asc("N"), "SUBUR 2")
        '    current_y = 255 + current_y
        '    current_y_berat = 255 + current_y_berat
        '    current_y_kode = current_y_kode + 255
        '    current_y_toko = current_y_toko + 255
        '    step_bottom = step_bottom + 1
        'End If

        'Next

        'Call B_Bar2d_QR(420, 200, 1, 3, Asc("M"), Asc("A"), 0, 0, 0, "QR CODE")

        'picture.
        'Call B_Get_Graphic_ColorBMP(420, 280, "bb.bmp") ' Color bmp file.
        'Call B_Get_Graphic_ColorBMPEx(420, 320, 200, 150, 2, "bb1", "bb.bmp") ' 180 angle.
        'Dim himage As Integer
        'himage = LoadImage(0, "bb.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE)
        'Call B_Get_Graphic_ColorBMP_HBitmap(630, 280, 250, 80, 1, "bb2", himage) ' 90 angle.
        'If himage Then
        ' Call DeleteObject(himage)
        ' End If

        ' output.
        'Call B_Print_Out(1) ' copy 2.
        'Call b_e
        ' close port.
        ' Call B_ClosePrn()
    End Sub

    Private Sub open_port_kiri(ByVal a As Integer, ByVal var_id_item_1 As String, ByVal var_item_nm_1 As String, ByVal var_kadar_1 As Double, ByVal var_berat_1 As Double, ByVal var_id_item_2 As String, ByVal var_item_nm_2 As String, ByVal var_kadar_2 As Double, ByVal var_berat_2 As Double)

        ' open port.
        Dim nLen As Integer
        Dim ret As Integer
        Dim sw As Integer
        Dim pbuf(128) As Byte
        Dim nVersion, nMainVersion, nSubVersion As Integer
        Dim strmsg As String
        Dim encAscII = System.Text.Encoding.ASCII
        Dim encUnicode = System.Text.Encoding.Unicode
        Dim DT, DTJ As New DataTable
        Dim categori As String
        Dim jenis As String
        Dim filetoprint As String

        'DT = select_category2(dg_marketing.Item(2, a - 1).Value)
        'DTJ = select_jenis2(dg_marketing.Item(2, a - 1).Value)
        'jenis = DTJ.Rows(0).Item("mst_itemjenis_nm")
        'categori = DT.Rows(0).Item("mst_itemcat_nm")

        ' dll version.
        nVersion = B_Get_DLL_VersionA(0)
        nMainVersion = nVersion / 100
        nSubVersion = nVersion Mod 100

        ' search port.
        nLen = B_GetUSBBufferLen() + 1
        strmsg = "DLL Ver: " + Str(nMainVersion) + "." + Str(nSubVersion) + vbCrLf
        If nLen > 1 Then
            Dim buf1() As Byte
            Dim buf2() As Byte
            Dim len1 As Integer = 128
            Dim len2 As Integer = 128
            ReDim buf1(len1) ' buf1= New Byte(len1) {}
            ReDim buf2(len2) ' buf2= New Byte(len2) {}
            Call B_EnumUSB(pbuf)
            Call B_GetUSBDeviceInfo(1, buf1, len1, buf2, len2)
            sw = 1
            If sw Then
                ret = B_CreatePrn(12, encAscII.GetString(buf2, 0, len2)) ' open usb.
            Else
                ret = B_CreateUSBPort(1) ' must call B_GetUSBBufferLen() function fisrt.
            End If


            If 0 < ret Then
                strmsg += "Open USB fail!"
            Else
                strmsg += "Open USB:" + vbCrLf + "Device name: "
                strmsg += encAscII.GetString(buf1, 0, len1)
                strmsg += vbCrLf + "Device path: "
                strmsg += encAscII.GetString(buf2, 0, len2)
                'sw = 2
                If 2 = sw Then
                    'Immediate Error Report.
                    B_WriteData(1, encAscII.GetBytes("^ee\r\n"), 5)   '^ee
                    ret = B_ReadData(pbuf, 4, 1000)
                End If
            End If
            System.IO.Directory.CreateDirectory(szSavePath)
            filetoprint = Replace(szSaveFile, ".Prn", "") & Format(Now(), "ddmmyy") & Hour(Now()) & Minute(Now()) & Second(Now()) & Rnd(1000) & ".Prn"
            ret = B_CreatePrn(0, filetoprint) ' open file.
        Else
            System.IO.Directory.CreateDirectory(szSavePath)
            filetoprint = Replace(szSaveFile, ".Prn", "") & Format(Now(), "ddmmyy") & Hour(Now()) & Minute(Now()) & Second(Now()) & Rnd(1000) & ".Prn"
            ret = B_CreatePrn(0, filetoprint) ' open file.
            strmsg += "Open "
            strmsg += filetoprint
            If 0 < ret Then
                strmsg += " file fail!"
            Else
                strmsg += " file succeed!"

            End If
        End If
        ' MessageBox.Show(strmsg)
        If 0 < ret Then
            Exit Sub
        End If

        ' sample setting.
        Call B_Set_DebugDialog(1)
        Call B_Set_Originpoint(0, 0)
        Call B_Select_Option(2)
        Call B_Set_Darkness(8)
        'Call B_Del_Pcx("*") ' delete all picture.
        'Call B_WriteData(0, encAscII.GetBytes(sznop2), sznop2.Length)
        'Call B_WriteData(1, encAscII.GetBytes(sznop1), sznop1.Length)

        If var_id_item_1 <> "" Then
            Call B_Prn_Barcode(125, 0, 0, "2", 2, 4, 30, Asc("B"), var_id_item_1) 'have a counter.
            Call B_Prn_Text(125, 77, 0, 2, 1, 1, Asc("N"), var_item_nm_1)
            Call B_Prn_Text(125, 102, 0, 4, 1, 1, Asc("N"), FormatNumber(var_kadar_1, 2) & " Gr")
            Call B_Prn_Text(125, 132, 0, 2, 1, 1, Asc("N"), "Kdr " & FormatNumber(var_berat_1, 2) & "%")
        End If

        If var_id_item_2 <> "" Then
            Call B_Prn_Barcode(588, 0, 0, "2", 2, 4, 30, Asc("B"), var_id_item_2) 'have a counter.
            Call B_Prn_Text(588, 77, 0, 2, 1, 1, Asc("N"), var_item_nm_2)
            Call B_Prn_Text(588, 102, 0, 4, 1, 1, Asc("N"), FormatNumber(var_kadar_2, 2) & " Gr")
            Call B_Prn_Text(588, 132, 0, 2, 1, 1, Asc("N"), "Kdr " & FormatNumber(var_berat_2, 2) & "%")
        End If
        'draw box.
        'Call B_Draw_Box(20, 20, 4, 760,2560)
        'Call B_Draw_Line(Asc("O"), 400, 20, 4, 540)

        'print text, true type text.
        ' Call B_Prn_Text(30, 40, 0, 2, 1, 1, Asc("N"), "PPLB Lib Example")
        ' Call B_Prn_Text_TrueType(30, 100, 30, "Arial", 1, 400, 0, 0, 0, "AA", "TrueType Font") 'save in printer.
        ' Call B_Prn_Text_TrueType_W(30, 160, 20, 20, "Times New Roman", 1, 400, 0, 0, 0, "AB", "TT_W: ¦h¦r¤¸´ú¸Õ")
        ' Call B_Prn_Text_TrueType_Uni(30, 220, 30, "Times New Roman", 1, 400, 0, 0, 0, "AC", encUnicode.GetBytes("TT_Uni: ¦h¦r¤¸´ú¸Õ"), 1) 'UTF-16
        'pbuf(0) = 255 'UTF-16.
        'pbuf(1) = 254
        'encUnicode.GetBytes("TT_UniB: ¦h¦r¤¸´ú¸Õ", 0, 14, pbuf, 2) 'copy mutil byte.
        'pbuf(30) = 0 'null.
        'pbuf(31) = 0
        'Call B_Prn_Text_TrueType_UniB(30, 280, 30, "Times New Roman", 1, 400, 0, 0, 0, "AD", pbuf, 0) 'Byte Order Mark.

        'barcode.
        ' output.
        Call B_Print_Out(1) ' copy 2.

        ' close port.
        Call B_ClosePrn()
        RawPrinterHelper.SendFileToPrinter("ZDesigner GT800 (EPL)", filetoprint)

    End Sub
End Class