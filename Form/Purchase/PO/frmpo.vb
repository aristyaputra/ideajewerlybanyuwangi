Imports DevExpress.XtraSplashScreen
Imports DevExpress.XtraWaitForm
Imports DevExpress.XtraBars.Alerter

Public Class frmpo

    Dim i As Integer
    Dim a As Integer
    Public mCol As Integer
    Public mRow As Integer
    Public insert As Integer
    Public edit As Integer
    Dim pesan As String
    Public NoBuktiPO As String
    Dim IndexRowDg As Integer


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

    Private Sub frmpo_Activated(sender As Object, e As System.EventArgs) Handles Me.Activated
        Me.WindowState = FormWindowState.Maximized
    End Sub

    Private Sub frmpo_FormClosed(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosedEventArgs) Handles Me.FormClosed
        close_conn()
        MainMenu.Activate()
    End Sub

    Private Sub frmpo_KeyDown(sender As Object, e As System.Windows.Forms.KeyEventArgs) Handles Me.KeyDown
        If e.KeyCode = Keys.F5 Then
            'Dim NewDisplayAcc As New frm_display_ro
            frm_display_ro.formsource_po_item = True
            frm_display_ro.Show()
            ' MainMenu.Enabled = False
            'Me.Enabled = False
        End If
    End Sub

    Private Sub fillComboBox()
        Dim DT As DataTable
        DT = select_combo_supplier()
        Lookup_Pelanggan.Properties.DataSource = DT
        Lookup_Pelanggan.Properties.DisplayMember = "id_supplier"
        Lookup_Pelanggan.Properties.ValueMember = "id_supplier"
        Lookup_Pelanggan.Properties.PopulateViewColumns()
        Lookup_Pelanggan.Properties.BestFitMode = DevExpress.XtraEditors.Controls.BestFitMode.BestFitResizePopup
        Lookup_Pelanggan.Properties.View.OptionsView.ShowAutoFilterRow = True
        Lookup_Pelanggan.Properties.View.Columns("id_supplier").Caption = "ID Supplier"
        Lookup_Pelanggan.Properties.View.Columns("name").Caption = "Nama"
        Lookup_Pelanggan.Properties.View.Columns("address").Caption = "Alamat"

        Dim DTAccount As DataTable
        DTAccount = select_combo_cashbank()
        txt_account_um.Properties.DataSource = DTAccount
        txt_account_um.Properties.DisplayMember = "account_name"
        txt_account_um.Properties.ValueMember = "id_account"
        txt_account_um.Properties.PopulateViewColumns()
        txt_account_um.Properties.BestFitMode = DevExpress.XtraEditors.Controls.BestFitMode.BestFitResizePopup
        txt_account_um.Properties.View.OptionsView.ShowAutoFilterRow = True
        txt_account_um.Properties.View.Columns("id_account").Caption = "No Akun"
        txt_account_um.Properties.View.Columns("account_name").Caption = "Nama Akun"
    End Sub


    Private Sub frmreceiptmoney_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        open_conn()
        Dim DT As New DataTable
        Dim Rows As Integer
        Dim i As Integer
        insert = 1
        edit = 0
        Me.WindowState = FormWindowState.Maximized
        PanelControl3.Visible = False
        Me.MdiParent = MainMenu
        var_bulan = Month(txt_date.Value)
        var_tahun = Year(txt_date.Value)
        Call insert_no_trans("PO", Month(txt_date.Value), Year(txt_date.Value))
        Call select_control_no("PO", "TRANS")
        cbo_search.Text = "PO No"
        txt_po_no.Text = no_master
        cbo_curr.Text = get_def_curr()
        cbo_curr.Items.Clear()
        DT = select_curr()
        Panel1.Visible = False
        GroupControl9.Visible = False
        Rows = DT.Rows.Count - 1
        For i = 0 To Rows
            cbo_curr.Items.Add(DT.Rows(i).Item(0))
        Next
        DataGridView1.Focus()
        btn_del2.Enabled = False
        btn_cetak.Enabled = False
        insert = 1
        edit = 0
        DataGridView2.SelectionMode = DataGridViewSelectionMode.FullRowSelect
        Call init_number()
        chk_date.Checked = False
        tglakhir.Enabled = False
        tglawal.Enabled = False
        datagrid_layout()
        txt_tax_nominal.Text = 0
        ' LoadComboBox_MtgcComboBoxPOApproved()
        lbl_kurs.Text = get_def_curr()
        txt_kurs.Text = 1
        DataGridView1.Rows.Clear()
        DataGridView1.Rows.Add(250)
        fillComboBox()
        'GridList_Customer.OptionsView.ColumnAutoWidth = False
        cbo_unit2.Visible = False
        SimpleButton1.Visible = False
        view_data()

    End Sub

    Private Sub LoadComboBox_MtgcComboBoxPOApproved()
        open_conn()
        Dim dtLoading As New DataTable("UsStates")
        dtLoading = select_combo_supplier()

        cbo_supplier2.SelectedIndex = -1
        cbo_supplier2.Items.Clear()
        cbo_supplier2.LoadingType = MTGCComboBox.CaricamentoCombo.DataTable
        cbo_supplier2.SourceDataString = New String(2) {"id_supplier", "name", "address"}
        cbo_supplier2.SourceDataTable = dtLoading
        cbo_supplier2.DropDownStyle = MTGCComboBox.CustomDropDownStyle.DropDownList
    End Sub


    Private Sub init_number()
        open_conn()
        txt_tax.Text = FormatPercent(0, 0)
        txt_subtotal.Text = 0
        txt_amount.Text = 0
        txt_freight.Text = 0
    End Sub
    Private Sub datagrid_layout()
        open_conn()
        With DataGridView2
            .SelectionMode = DataGridViewSelectionMode.FullRowSelect
            .CellBorderStyle = DataGridViewCellBorderStyle.SingleVertical
            .RowsDefaultCellStyle.SelectionBackColor = Color.FromArgb(var_red, var_grey, var_blue)
            .DefaultCellStyle.SelectionForeColor = Color.Black
        End With
        DataGridView1.Columns(0).ReadOnly = True
        DataGridView1.Columns(1).ReadOnly = True
        DataGridView1.Columns(2).ReadOnly = True
        DataGridView1.Columns(3).ReadOnly = False
        DataGridView1.Columns(4).ReadOnly = True
        DataGridView1.Columns(5).ReadOnly = True
        DataGridView1.Columns(6).ReadOnly = False
        DataGridView1.Columns(7).ReadOnly = True
        DataGridView1.Columns(8).ReadOnly = True
        DataGridView1.Columns(10).ReadOnly = True

        DataGridView1.Columns(9).ReadOnly = False

        DataGridView1.Columns(0).DefaultCellStyle.BackColor = Color.WhiteSmoke
        DataGridView1.Columns(1).DefaultCellStyle.BackColor = Color.WhiteSmoke
        DataGridView1.Columns(2).DefaultCellStyle.BackColor = Color.WhiteSmoke
        DataGridView1.Columns(4).DefaultCellStyle.BackColor = Color.White
        DataGridView1.Columns(5).DefaultCellStyle.BackColor = Color.WhiteSmoke
        DataGridView1.Columns(7).DefaultCellStyle.BackColor = Color.WhiteSmoke
        DataGridView1.Columns(8).DefaultCellStyle.BackColor = Color.WhiteSmoke
        DataGridView1.Columns(10).DefaultCellStyle.BackColor = Color.WhiteSmoke

        With DataGridView1
            .CellBorderStyle = DataGridViewCellBorderStyle.SingleVertical
            .RowsDefaultCellStyle.SelectionBackColor = Color.FromArgb(var_red, var_grey, var_blue)
            .DefaultCellStyle.SelectionForeColor = Color.Black
        End With
    End Sub
    Private Sub cbo_supplier_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        open_conn()
        Dim NewDisplayAcc As New frm_display_supp
        NewDisplayAcc.formsource_ro_po = True
        NewDisplayAcc.Show()
        '  NewDisplayAcc.MdiParent = MainMenu
    End Sub

    'Private Sub cbo_supplier_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbo_supplier.SelectedIndexChanged
    '    Dim Rows As Integer
    '    Dim DT As DataTable
    '    DT = select_master("select_supplier", "ID Supplier", cbo_supplier.SelectedItem, 0)
    '    Rows = DT.Rows.Count - 1
    '    open_conn()
    '    For i = 0 To Rows
    '        txt_supp_nm.Text = DT.Rows(i).Item("NAME")
    '        txt_supp_address.Text = DT.Rows(i).Item("address")
    '    Next
    '    'txt_supp_nm.Text = cbo_supplier.SelectedItem
    '    'DataGridView1.Rows.Clear()
    '    'For i = 0 To Rows
    '    '    DataGridView1.
    '    'Next

    'End Sub

    Private Sub btn_save2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        open_conn()
        insert_data()
    End Sub

    'fungsi simpan
    Private Sub insert_data()

        open_conn()
        Dim i As Integer
        Dim a As Integer
        Dim b As Integer
        'For a = 0 To DataGridView1.Rows.Count - 1
        '    If DataGridView1.Item(9, a).Value = True Then
        '        b = b + 1
        '    End If
        'Next
        'If b > 0 Then
        If insert = 1 Then
            Call insert_po(Trim(txt_po_no.Text), Lookup_Pelanggan.EditValue, Format(txt_date.Value, "yyyy-MM-dd"), _
                           Trim(txt_comment.Text), txt_subtotal.Text, txt_freight.Text, Replace(txt_tax.Text, "%", ""), txt_amount.Text, _
                           "", server_datetime(), server_datetime(), (username), 0, "", "", 0, "", 0, 0, "", 0, 0, "", Replace(txt_kurs.Text, ",", ""), Replace(txtum.Text, ",", ""), txt_account_um.EditValue, 0, 0)
            For i = 0 To DataGridView1.Rows.Count - 1
                If DataGridView1.Item(1, i).Value <> "" Or DataGridView1.Item(1, i).Value <> Nothing Then
                    Call insert_po(Trim(txt_po_no.Text), "", Format(txt_date.Value, "yyyy-MM-dd"), _
                          "", 0, 0, 0, 0, _
                           "", Format(server_datetime, "yyyy-MM-dd"), Format(server_datetime, "yyyy-MM-dd"), username, DataGridView1.Item(0, i).Value, DataGridView1.Item(1, i).Value, DataGridView1.Item(3, i).Value, _
                           DataGridView1.Item(4, i).Value, DataGridView1.Item(5, i).Value, DataGridView1.Item(6, i).Value, DataGridView1.Item(7, i).Value, cbo_curr.Text, 1, 0, DataGridView1.Item(8, i).Value, Replace(txt_kurs.Text, ",", ""), Replace(txtum.Text, ",", ""), txt_account_um.EditValue, Replace(DataGridView1.Item(10, i).Value, ",", ""), Replace(DataGridView1.Item(11, i).Value, ",", ""))
                End If
            Next
            If param_sukses = True Then
                Dim info As AlertInfo = New AlertInfo(msgtitle_save_success, msgbox_save_success)
                alertControl_success.Show(Me, info)
                open_conn()
                GroupControl9.Visible = True
                disableMain()

                update_no_trans(txt_date.Value, "PO")

                view_data_employee()
                dg_employee.SelectionMode = DataGridViewSelectionMode.FullRowSelect
                dg_marketing.SelectionMode = DataGridViewSelectionMode.FullRowSelect


                Dim row_jml As Integer
                dg_marketing.Rows.Clear()
                For x As Integer = 0 To dg_employee.Rows.Count - 1
                    For z As Integer = 0 To DataGridView1.Item(4, x).Value - 1
                        dg_marketing.Rows.Add(1)
                        If dg_marketing.Rows.Count = 1 Then
                            dg_marketing.CurrentCell = dg_marketing(0, 0)
                        ElseIf dg_marketing.Rows.Count > 1 Then
                            dg_marketing.CurrentCell = dg_marketing(0, dg_marketing.CurrentCell.RowIndex + 1)
                        End If
                        row_jml = dg_marketing.Rows.GetLastRow(DataGridViewElementStates.Displayed)
                        dg_marketing.Item(0, row_jml).Value = dg_employee.Item(0, x).Value
                        dg_marketing.Item(1, row_jml).Value = dg_employee.Item(1, x).Value
                        dg_marketing.Item(2, row_jml).Value = dg_employee.Item(2, x).Value
                        dg_marketing.Item(3, row_jml).Value = dg_employee.Item(3, x).Value
                        dg_marketing.Item(4, row_jml).Value = dg_employee.Item(4, x).Value
                        dg_marketing.Item(5, row_jml).Value = dg_employee.Item(5, x).Value
                        dg_marketing.Item(6, row_jml).Value = dg_employee.Item(6, x).Value
                        dg_marketing.Item(7, row_jml).Value = dg_employee.Item(7, x).Value
                        ' dg_marketing.CurrentCell = dg_marketing(0, dg_marketing.CurrentCell.RowIndex + 1)
                    Next
                Next




                '        pesan = MsgBox("Cetak PO?", MsgBoxStyle.Question + MsgBoxStyle.YesNo, "Konfirmasi")
                'If pesan = vbYes Then
                '    Dim DisplayNota As New FormNotaPO
                '    NoBuktiPO = Trim(txt_po_no.Text)
                '    With DisplayNota
                '        .Show()
                '        '  .MdiParent = MainMenu
                '        .WindowState = FormWindowState.Maximized
                '    End With
                'End If

                clean()
            Else
                Dim info As AlertInfo = New AlertInfo(msgtitle_save_failed, msgbox_save_failed)
                alertControl_error.Show(Me, info)
            End If
        ElseIf edit = 1 Then
            If select_validate("Purchase Order", Trim(txt_po_no.Text)) > 0 Then
                Dim info As AlertInfo = New AlertInfo("Cek Kevaliditasan Data", "PO telah di proses pada faktur beli")
                alertControl_warning.Show(Me, info)
                Exit Sub
            End If
            Call update_po(Trim(txt_po_no.Text), Lookup_Pelanggan.EditValue, Format(txt_date.Value, "yyyy-MM-dd"), _
                           Trim(txt_comment.Text), txt_subtotal.Text, txt_freight.Text, Replace(txt_tax.Text, "%", ""), txt_amount.Text, _
                           "", server_datetime(), server_datetime(), (username), 0, "", "", 0, "", 0, 0, "", 0, 0, "", Replace(txt_kurs.Text, ",", ""), Replace(txtum.Text, ",", ""), txt_account_um.EditValue, 0, 0)
            For i = 0 To DataGridView1.Rows.Count - 1
                If DataGridView1.Item(1, i).Value <> "" Or DataGridView1.Item(1, i).Value <> Nothing Then
                    Call update_po(Trim(txt_po_no.Text), "", Format(txt_date.Value, "yyyy-MM-dd"), _
                          "", 0, 0, 0, 0, _
                           "", Format(server_datetime, "yyyy-MM-dd"), Format(server_datetime, "yyyy-MM-dd"), username, DataGridView1.Item(0, i).Value, DataGridView1.Item(1, i).Value, DataGridView1.Item(3, i).Value, _
                           DataGridView1.Item(4, i).Value, DataGridView1.Item(5, i).Value, DataGridView1.Item(6, i).Value, DataGridView1.Item(7, i).Value, cbo_curr.Text, 1, 0, DataGridView1.Item(8, i).Value, Replace(txt_kurs.Text, ",", ""), Replace(txtum.Text, ",", ""), txt_account_um.EditValue, Replace(DataGridView1.Item(10, i).Value, ",", ""), Replace(DataGridView1.Item(11, i).Value, ",", ""))
                End If
            Next
            If param_sukses = True Then
                Dim info As AlertInfo = New AlertInfo(msgtitle_update_success, msgbox_update_success)
                alertControl_success.Show(Me, info)
                GroupControl9.Visible = True
                view_data_employee()
                dg_employee.SelectionMode = DataGridViewSelectionMode.FullRowSelect
                dg_marketing.SelectionMode = DataGridViewSelectionMode.FullRowSelect

                Dim row_jml As Integer
                dg_marketing.Rows.Clear()
                For x As Integer = 0 To dg_employee.Rows.Count - 1
                    For z As Integer = 0 To DataGridView1.Item(4, x).Value - 1
                        dg_marketing.Rows.Add(1)
                        If dg_marketing.Rows.Count = 1 Then
                            dg_marketing.CurrentCell = dg_marketing(0, 0)
                        ElseIf dg_marketing.Rows.Count > 1 Then
                            dg_marketing.CurrentCell = dg_marketing(0, dg_marketing.CurrentCell.RowIndex + 1)
                        End If
                        row_jml = dg_marketing.Rows.GetLastRow(DataGridViewElementStates.Displayed)
                        dg_marketing.Item(0, row_jml).Value = dg_employee.Item(0, x).Value
                        dg_marketing.Item(1, row_jml).Value = dg_employee.Item(1, x).Value
                        dg_marketing.Item(2, row_jml).Value = dg_employee.Item(2, x).Value
                        dg_marketing.Item(3, row_jml).Value = dg_employee.Item(3, x).Value
                        dg_marketing.Item(4, row_jml).Value = dg_employee.Item(4, x).Value
                        dg_marketing.Item(5, row_jml).Value = dg_employee.Item(5, x).Value
                        dg_marketing.Item(6, row_jml).Value = dg_employee.Item(6, x).Value
                        dg_marketing.Item(7, row_jml).Value = dg_employee.Item(7, x).Value
                        ' dg_marketing.CurrentCell = dg_marketing(0, dg_marketing.CurrentCell.RowIndex + 1)
                    Next
                Next
                'pesan = MsgBox("Cetak PO?", MsgBoxStyle.Question + MsgBoxStyle.YesNo, "Konfirmasi")
                'If pesan = vbYes Then
                '    Dim DisplayNota As New FormNotaPO
                '    NoBuktiPO = Trim(txt_po_no.Text)
                '    With DisplayNota
                '        .Show()
                '        '  .MdiParent = MainMenu
                '        .WindowState = FormWindowState.Maximized
                '    End With
                'End If
                clean()
            Else
                Dim info As AlertInfo = New AlertInfo(msgtitle_update_failed, msgbox_update_failed)
                alertControl_error.Show(Me, info)
            End If
        End If
        'Else
        'MsgBox("Tidak ada data RO yang dipilih", MsgBoxStyle.Information + MsgBoxStyle.OkOnly, "Informasi")
        'Exit Sub
        'End If

    End Sub

    Private Sub clean()
        open_conn()
        insert = 1
        edit = 0
        With Me
            .txt_jmlberat.Text = ""
            .txt_jmlqty.Text = ""
            .txt_supp_nm.Text = ""
            .txt_supp_address.Text = ""
            .txt_subtotal.Text = ""
            .txt_freight.Text = 0
            .txt_comment.Text = ""
            .txt_amount.Text = 0
            .txt_tax.Text = 0
            .txt_date.Value = Now
            '  .cbo_supplier.Text = ""
        End With
        Call select_control_no("PO", "TRANS")
        txt_po_no.Text = no_master
        txt_date.Value = Now
        init_number()
        cbo_curr.Text = get_def_curr()
        btn_del2.Enabled = True
        btn_cetak.Enabled = True
        ' view_data_ro(cbo_supplier2.Text)
        cbo_supplier2.Text = ""
        chk_ppn.Checked = False
        txt_kurs.Text = 1
        DataGridView1.Rows.Clear()
        DataGridView1.Rows.Add(200)
        DataGridView1.CurrentCell.Value = DataGridView1.Item(0, 0).Value
        Lookup_Pelanggan.EditValue = Nothing
        btn_cetak.Enabled = False
        btn_del2.Enabled = False
        txtum.Text = 0
        txt_amount.Text = 0
        txt_subtotal.Text = 0
        SimpleButton1.Visible = False
    End Sub

    Private Sub btn_reset2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_reset2.Click
        open_conn()
        clean()
    End Sub

    Private Sub txt_search_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs)
        open_conn()
        'ganti ke text changed

        'Dim Rows As Integer
        'Dim DT As DataTable
        'DT = select_view_po()
        'Rows = DT.Rows.Count - 1
        'open_conn()
        'DataGridView2.Rows.Clear()
        'For i = 0 To Rows
        '    DataGridView2.Rows.Add()
        '    DataGridView2.Item(0, i).Value = DT.Rows(i).Item("no_purchase_order")
        '    DataGridView2.Item(1, i).Value = DT.Rows(i).Item("nm_supplier")
        '    DataGridView2.Item(2, i).Value = DT.Rows(i).Item("date_trn")
        'Next
    End Sub

    Private Sub txt_search_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        open_conn()
        view_data()
    End Sub

    Private Sub DataGridView1_CellClick(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        open_conn()
        mRow = DataGridView1.CurrentCell.RowIndex
        mCol = DataGridView1.CurrentCell.ColumnIndex
        i = DataGridView1.CurrentCell.ColumnIndex
        If i = 1 Or i = 2 Then
            'Dim NewDisplayAcc As New frm_display_item
            'NewDisplayAcc.formsource_po_item = True
            'NewDisplayAcc.Show()
            'NewDisplayAcc.MdiParent = MainMenu
        End If
        If i = 5 Then
            'Dim NewDisplayAcc As New frm_display_unit
            'NewDisplayAcc.formsource_po_unit = True
            'NewDisplayAcc.Show()
            'NewDisplayAcc.MdiParent = MainMenu
            'Dim dgvcc As DataGridViewComboBoxCell
            'dgvcc = DataGridView1.Rows(mRow).Cells(5)
            'dgvcc.Items.Clear()
            'Rows = select_unit.Rows.Count - 1
            'For i = 0 To Rows
            '    dgvcc.Items.Add(select_unit.Rows(i).Item(0))
            'Next


        End If
        If i = 6 Then
            
        End If
    End Sub

    Dim TSubTotal As Double
    Private Sub DataGridView1_CellEndEdit(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView1.CellEndEdit
        open_conn()
        Dim columnIndex As Integer
        TSubTotal = 0
        columnIndex = DataGridView1.CurrentCell.ColumnIndex
        If columnIndex = 6 Or columnIndex = 4 Then
            If IsNumeric(DataGridView1.Item(6, DataGridView1.CurrentCell.RowIndex).Value) = False Then
                ' Dim info As AlertInfo = New AlertInfo("Cek Kevaliditasan Data", "Masukkan Nominal Angka")
                'alertControl_warning.Show(Me, info)
                DataGridView1.Item(6, DataGridView1.CurrentCell.RowIndex).Value = 0
                ' Exit Sub
            End If
            If IsNumeric(DataGridView1.Item(4, DataGridView1.CurrentCell.RowIndex).Value) = False Then
                'Dim info As AlertInfo = New AlertInfo("Cek Kevaliditasan Data", "Masukkan Nominal Angka")
                'alertControl_warning.Show(Me, info)
                DataGridView1.Item(4, DataGridView1.CurrentCell.RowIndex).Value = 0
                ' DataGridView1.Item(6, DataGridView1.CurrentCell.RowIndex).Value = 0
                'Exit Sub
            End If
           
            DataGridView1.Item(7, DataGridView1.CurrentCell.RowIndex).Value = DataGridView1.Item(4, DataGridView1.CurrentCell.RowIndex).Value * DataGridView1.Item(6, DataGridView1.CurrentCell.RowIndex).Value
            DataGridView1.Item(6, DataGridView1.CurrentCell.RowIndex).Value = FormatNumber(DataGridView1.Item(6, DataGridView1.CurrentCell.RowIndex).Value, 0)
            Dim hargabeli, weight As Double
            hargabeli = Replace(DataGridView1.Item(6, mRow).Value, ",", "")
            weight = Replace(DataGridView1.Item(10, mRow).Value, ",", "")
            DataGridView1.Item(11, mRow).Value = FormatNumber(Math.Round(hargabeli / weight, 1), 0)

            Dim i As Integer
            For i = 0 To DataGridView1.Rows.Count - 1
                'If columnIndex = 6 Then
                TSubTotal = TSubTotal + DataGridView1.Item(7, i).Value
                'End If
            Next
            txt_subtotal.Text = FormatNumber(TSubTotal, 0)


            If chk_ppn.Checked = True Then
                Dim DT As DataTable
                DT = get_tax_rate("PPN")
                txt_tax.Text = DT.Rows(0).Item(0)
                txt_tax_nominal.Text = FormatNumber((DT.Rows(0).Item(0) / 100) * (CDbl(Replace(txt_subtotal.Text, ",", ""))), 0)
            ElseIf chk_ppn.Checked = False Then
                txt_tax.Text = 0
                txt_tax_nominal.Text = 0
            End If

            hitung_nominal()
        End If

        If columnIndex = 11 Or columnIndex = 10 Then
            If IsNumeric(DataGridView1.Item(11, DataGridView1.CurrentCell.RowIndex).Value) = False Then
                'Dim info As AlertInfo = New AlertInfo("Cek Kevaliditasan Data", "Masukkan Nominal Angka")
                'alertControl_warning.Show(Me, info)
                DataGridView1.Item(11, DataGridView1.CurrentCell.RowIndex).Value = 0
                ' DataGridView1.Item(6, DataGridView1.CurrentCell.RowIndex).Value = 0
                'Exit Sub
            End If
            DataGridView1.Item(11, DataGridView1.CurrentCell.RowIndex).Value = FormatNumber(DataGridView1.Item(11, DataGridView1.CurrentCell.RowIndex).Value, 0)
            Dim hargapergram, weight As Double
            hargapergram = Replace(DataGridView1.Item(11, mRow).Value, ",", "")
            weight = Replace(DataGridView1.Item(10, mRow).Value, ",", "")
            DataGridView1.Item(6, mRow).Value = FormatNumber(Math.Round(hargapergram * weight), 0)

            DataGridView1.Item(7, DataGridView1.CurrentCell.RowIndex).Value = DataGridView1.Item(4, DataGridView1.CurrentCell.RowIndex).Value * DataGridView1.Item(6, DataGridView1.CurrentCell.RowIndex).Value
            DataGridView1.Item(6, DataGridView1.CurrentCell.RowIndex).Value = FormatNumber(DataGridView1.Item(6, DataGridView1.CurrentCell.RowIndex).Value, 0)


            Dim i As Integer
            For i = 0 To DataGridView1.Rows.Count - 1
                'If columnIndex = 6 Then
                TSubTotal = TSubTotal + DataGridView1.Item(7, i).Value
                'End If
            Next
            txt_subtotal.Text = FormatNumber(TSubTotal, 0)


            If chk_ppn.Checked = True Then
                Dim DT As DataTable
                DT = get_tax_rate("PPN")
                txt_tax.Text = DT.Rows(0).Item(0)
                txt_tax_nominal.Text = FormatNumber((DT.Rows(0).Item(0) / 100) * (CDbl(Replace(txt_subtotal.Text, ",", ""))), 0)
            ElseIf chk_ppn.Checked = False Then
                txt_tax.Text = 0
                txt_tax_nominal.Text = 0
            End If

            hitung_nominal()
        End If

    End Sub

    Private Sub hitung_nominal()
        open_conn()
        Dim TNett As Double
        Dim Ttotal As Double
        Dim Tchange As Double

        TNett = 0
        Ttotal = 0
        Tchange = 0

        'menghitung netto
        'TNett = TSubTotal - (TSubTotal * CDbl(Replace(txt_disc.Text, "%", "")) / 100)
        'txt_netto.Text = FormatNumber(TNett, 0)
        Ttotal = (TSubTotal) + ((TSubTotal) * (CDbl(Replace(txt_tax.Text, "%", "")) / 100)) + CDbl(Replace(txt_freight.Text, ",", ""))

        'menghitung total
        txt_amount.Text = FormatNumber(Ttotal, 0)


        Dim jmlqty, jmlberat As Double
        For i As Integer = 0 To DataGridView1.Rows.Count - 1
            If DataGridView1(4, i).Value > 0 Or DataGridView1(4, i).Value <> Nothing Then
                jmlqty = jmlqty + DataGridView1(4, i).Value
            End If
            If DataGridView1(10, i).Value > 0 Or DataGridView1(10, i).Value <> Nothing Then
                jmlberat = jmlberat + (DataGridView1(4, i).Value * DataGridView1(10, i).Value)
            End If
        Next
        txt_jmlqty.Text = FormatNumber(jmlqty, 0)
        txt_jmlberat.Text = FormatNumber(jmlberat, 2)
        'menghitung change
        'Tchange = (CDbl(txt_paid.Text)) - Ttotal
        'txt_change.Text = FormatNumber(Tchange, 0)
    End Sub

    Private Sub DataGridView1_CellEnter(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView1.CellEnter
        open_conn()
        mRow = DataGridView1.CurrentCell.RowIndex
        mCol = DataGridView1.CurrentCell.ColumnIndex


        If DataGridView1.Item(8, mRow).Value = "" Then
            DataGridView1.Rows(mRow).Cells(4).ReadOnly = False
        Else
            DataGridView1.Rows(mRow).Cells(4).ReadOnly = True
        End If

        If mCol = 5 And DataGridView1.Item(1, mRow).Value <> "" And DataGridView1.Item(8, mRow).Value = "" Then

            Dim DT As DataTable
            DT = select_combo_unit_item(DataGridView1.Item(1, mRow).Value)
            cbo_unit2.Properties.DataSource = DT
            cbo_unit2.Properties.DisplayMember = "unit"
            cbo_unit2.Properties.ValueMember = "id_unit"
            cbo_unit2.Properties.PopulateViewColumns()
            cbo_unit2.Properties.BestFitMode = DevExpress.XtraEditors.Controls.BestFitMode.BestFitResizePopup
            cbo_unit2.Properties.View.OptionsView.ShowAutoFilterRow = True
            cbo_unit2.Properties.View.Columns("id_unit").Caption = "Kode"
            cbo_unit2.Properties.View.Columns("unit").Caption = "Unit"

            cbo_unit2.Visible = True
            cbo_unit2.Left = DataGridView1.GetCellDisplayRectangle(mCol, mRow, True).Left + 1
            cbo_unit2.Top = DataGridView1.GetCellDisplayRectangle(mCol, mRow, True).Bottom - 1

        Else
            cbo_unit2.Visible = False
        End If

        'i = DataGridView1.CurrentCell.ColumnIndex
        'If i = 1 Or i = 2 Then
        '    Dim NewDisplayAcc As New frm_display_acc_detail
        '    NewDisplayAcc.formsource_journal_noacc = True
        '    NewDisplayAcc.Show()
        'End If
        'DataGridView1.Item(0, mRow).Value = mRow + 1
    End Sub


    Private Sub txt_tax_GotFocus(ByVal sender As Object, ByVal e As System.EventArgs)
        open_conn()
        txt_tax.SelectionStart = 0
        txt_tax.SelectionLength = Len(txt_tax.Text)
    End Sub

    Private Sub txt_tax_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs)
        open_conn()
        If txt_tax.Text = "" Then
            txt_tax.Text = FormatPercent(0, 0)
        Else
            txt_tax.Text = FormatPercent(CDbl(Replace(txt_tax.Text, "%", "")) / 100, 0)
        End If
        hitung_nominal()
    End Sub

    Private Sub txt_freight_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_freight.LostFocus
        open_conn()
        TSubTotal = 0
        If txt_freight.Text = "" Then
            txt_freight.Text = FormatNumber(0, 0)
        Else
            txt_freight.Text = FormatNumber(CDbl(Replace(txt_freight.Text, ",", "")), 0)
        End If
        Dim rows As Integer
        rows = DataGridView1.Rows.Count - 1
        Dim i As Integer
        For i = 0 To rows
            'Dim checkbox_cell As DataGridViewCheckBoxCell = CType(DataGridView1.Rows(i).Cells(9), DataGridViewCheckBoxCell)
            'If checkbox_cell.EditedFormattedValue = True Then
            TSubTotal = TSubTotal + Replace(DataGridView1.Item(7, i).Value, ",", "")
            ' End If
        Next
        hitung_nominal()
    End Sub

    Private Sub TabControl1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TabControl1.SelectedPageChanged
        open_conn()
        view_data()
        'Dim Total_Width_Column, Total_Width_Column2 As Integer
        'Dim Width_Table, Width_Table2 As Integer
        'Dim selisih_col, selisih_col2 As Integer

        'With DataGridView1
        '    Total_Width_Column = .Columns(0).Width + .Columns(1).Width + .Columns(2).Width + .Columns(3).Width + .Columns(4).Width + .Columns(5).Width + .Columns(6).Width + .Columns(7).Width + .Columns(8).Width + .Columns(9).Width
        '    Width_Table = .Width
        '    selisih_col = Width_Table - Total_Width_Column - 65
        '    .Columns(3).Width = .Columns(3).Width + selisih_col
        'End With
        'With DataGridView2
        '    Total_Width_Column2 = .Columns(0).Width + .Columns(1).Width + .Columns(2).Width + .Columns(3).Width + .Columns(4).Width + .Columns(5).Width + .Columns(6).Width + .Columns(7).Width + .Columns(8).Width
        '    Width_Table2 = .Width
        '    selisih_col2 = Width_Table2 - Total_Width_Column2 - 65
        '    .Columns(7).Width = .Columns(7).Width + selisih_col2
        'End With
    End Sub

    Private Sub view_data()
        open_conn()
        '   If TabControl1.SelectedTabPage Is TabList Then
        Try
            SplashScreenManager.ShowForm(Me, GetType(WaitForm1), True, True, False)
            SplashScreenManager.Default.SetWaitFormCaption("Please Wait")
            SplashScreenManager.Default.SetWaitFormDescription("Loading Data . . .")
            Dim Rows As Integer
            Dim DT As DataTable
            Dim date_filter As Integer
            If chk_date.Checked = True Then
                date_filter = 1
            ElseIf chk_date.Checked = False Then
                date_filter = 0
            End If
            DT = select_purchase_order(Trim(cbo_search.Text), Trim(txt_search.Text), 0, date_filter, Format(tglawal.Value, "yyyy-MM-dd"), Format(tglakhir.Value, "yyyy-MM-dd"))
            GridControl.DataSource = DT
            GridList_Customer.Columns("no_purchase_order").Caption = "No PO"
            GridList_Customer.Columns("no_purchase_order").Width = 170
            GridList_Customer.Columns("nama").Caption = "Supplier"
            GridList_Customer.Columns("nama").Width = 200
            GridList_Customer.Columns("date_trn").Caption = "Tanggal"
            GridList_Customer.Columns("date_trn").Width = 110
            GridList_Customer.Columns("date_trn").DisplayFormat.FormatType = DevExpress.Utils.FormatType.DateTime
            GridList_Customer.Columns("date_trn").DisplayFormat.FormatString = "dd-MMM-yyyy"
            GridList_Customer.Columns("subtotal").Caption = "Sub Total"
            GridList_Customer.Columns("subtotal").Width = 160
            GridList_Customer.Columns("subtotal").DisplayFormat.FormatType = DevExpress.Utils.FormatType.Numeric
            GridList_Customer.Columns("subtotal").DisplayFormat.FormatString = "N0"
            GridList_Customer.Columns("freight").Caption = "B.Kirim"
            GridList_Customer.Columns("freight").Width = 160
            GridList_Customer.Columns("freight").DisplayFormat.FormatType = DevExpress.Utils.FormatType.Numeric
            GridList_Customer.Columns("freight").DisplayFormat.FormatString = "N0"
            GridList_Customer.Columns("tax").Caption = "PPN"
            GridList_Customer.Columns("tax").Width = 160
            GridList_Customer.Columns("tax").DisplayFormat.FormatType = DevExpress.Utils.FormatType.Numeric
            GridList_Customer.Columns("tax").DisplayFormat.FormatString = "N0"
            GridList_Customer.Columns("total").Caption = "Total"
            GridList_Customer.Columns("total").Width = 160
            GridList_Customer.Columns("total").DisplayFormat.FormatType = DevExpress.Utils.FormatType.Numeric
            GridList_Customer.Columns("total").DisplayFormat.FormatString = "N0"
            GridList_Customer.Columns("um").Caption = "Uang Muka"
            GridList_Customer.Columns("um").Width = 160
            GridList_Customer.Columns("um").DisplayFormat.FormatType = DevExpress.Utils.FormatType.Numeric
            GridList_Customer.Columns("um").DisplayFormat.FormatString = "N0"
            GridList_Customer.Columns("id_supplier").Visible = False
            GridList_Customer.Columns("notes").Visible = False
            '    GridList_Customer.BestFitColumns()


            'Rows = DT.Rows.Count - 1
            'DataGridView2.Rows.Clear()
            'Dim i As Integer
            'If DT.Rows.Count > 0 Then
            '    For i = 0 To Rows
            '        DataGridView2.Rows.Add()
            '        DataGridView2.Item(0, i).Value = DT.Rows(i).Item(0)
            '        DataGridView2.Item(1, i).Value = DT.Rows(i).Item(1)
            '        DataGridView2.Item(2, i).Value = Format(DT.Rows(i).Item(2), "yyyy-MM-dd")
            '        DataGridView2.Item(3, i).Value = FormatNumber(DT.Rows(i).Item(3), 0)
            '        DataGridView2.Item(4, i).Value = FormatNumber(DT.Rows(i).Item(4), 0)
            '        DataGridView2.Item(5, i).Value = FormatNumber(DT.Rows(i).Item(5), 0)
            '        DataGridView2.Item(6, i).Value = FormatNumber(DT.Rows(i).Item(6), 0)
            '        DataGridView2.Item(7, i).Value = DT.Rows(i).Item(7)

            '    Next
            'End If
        Finally
            SplashScreenManager.CloseForm(False)
        End Try
        'End If
    End Sub

    Private Sub view_data_ro(ByVal Criteria As String)
        open_conn()
        Dim Rows As Integer
        Dim DT As DataTable
        Dim date_filter As Integer
        date_filter = 0
        DT = select_ro_po("No Permintaan", Criteria, 0, date_filter, Format(server_datetime(), "yyyy-MM-dd"), Format(server_datetime(), "yyyy-MM-dd"))
        Rows = DT.Rows.Count - 1
        DataGridView1.Rows.Clear()
        Dim i As Integer
        If DT.Rows().Count > 0 Then
            For i = 0 To Rows
                DataGridView1.Rows.Add()
                DataGridView1.Item(0, i).Value = i + 1
                DataGridView1.Item(1, i).Value = DT.Rows(i).Item(0)
                DataGridView1.Item(2, i).Value = DT.Rows(i).Item(1)
                DataGridView1.Item(3, i).Value = DT.Rows(i).Item(2)
                DataGridView1.Item(4, i).Value = FormatNumber(DT.Rows(i).Item(3), 0)
                DataGridView1.Item(5, i).Value = DT.Rows(i).Item(4)
                DataGridView1.Item(6, i).Value = FormatNumber(DT.Rows(i).Item(5), 0)
                DataGridView1.Item(7, i).Value = FormatNumber(DT.Rows(i).Item(6), 0)
                DataGridView1.Item(8, i).Value = DT.Rows(i).Item(7)
            Next
        End If
    End Sub

    Private Sub detail(ByVal criteria As String)
        open_conn()
        'current_row = cbo_acc_group.SelectedIndex
        Dim DT As DataTable
        Dim rows As Integer
        Dim date_filter As Integer
        insert = 0
        edit = 1
        update_field_po()
        If getTemplateAkses(username, "MN_PO_EDIT_UM") = True Then
            SimpleButton1.Visible = True
        Else
            SimpleButton1.Visible = False
        End If


        If chk_date.Checked = True Then
            date_filter = 1
        ElseIf chk_date.Checked = False Then
            date_filter = 0
        End If
        DT = select_purchase_order("no_purchase_order", criteria, 1, date_filter, Format(tglawal.Value, "yyyy-MM-dd"), Format(tglakhir.Value, "yyyy-MM-dd"))

        rows = DT.Rows.Count - 1
        If DT.Rows.Count > 0 Then
            ' cbo_supplier.Text = DT.Rows(0).Item("id_supplier")
            ' cbo_supplier2.Text = ""
            ' cbo_supplier2.SelectedText = DT.Rows(0).Item("id_supplier")
            Lookup_Pelanggan.EditValue = DT.Rows(0).Item("id_supplier")
            txt_supp_nm.Text = DT.Rows(0).Item("nama")
            txt_supp_address.Text = DT.Rows(0).Item("address")
            txt_po_no.Text = DT.Rows(0).Item("no_purchase_order")
            txt_date.Value = DT.Rows(0).Item("date_trn")
            cbo_curr.Text = DT.Rows(0).Item("id_curr")
            txt_comment.Text = DT.Rows(0).Item("notes")
            txt_subtotal.Text = FormatNumber(DT.Rows(0).Item("subtotal"), 0)
            txt_tax_nominal.Text = (DT.Rows(0).Item("tax") / 100 * (DT.Rows(0).Item("subtotal") + DT.Rows(0).Item("freight")))
            btn_del2.Enabled = True
            btn_cetak.Enabled = True
            DataGridView1.Rows.Clear()
            DataGridView1.Rows.Add(250)
            txt_account_um.EditValue = DT.Rows(0).Item("account_um")
            Dim i As Integer
            For i = 0 To rows
                DataGridView1.Item(0, i).Value = i + 1
                DataGridView1.Item(1, i).Value = DT.Rows(i).Item("id_item")
                DataGridView1.Item(2, i).Value = DT.Rows(i).Item("item_name")
                DataGridView1.Item(3, i).Value = DT.Rows(i).Item("description")
                DataGridView1.Item(4, i).Value = FormatNumber(DT.Rows(i).Item("qty"), 0)
                DataGridView1.Item(5, i).Value = DT.Rows(i).Item("id_unit")
                'dgvcc.Value = DT.Rows(i).Item("id_unit")
                DataGridView1.Item(6, i).Value = FormatNumber(DT.Rows(i).Item("price"), 0)
                DataGridView1.Item(7, i).Value = FormatNumber(DT.Rows(i).Item("total"), 0)
                DataGridView1.Item(8, i).Value = DT.Rows(i).Item("no_request_order")
                DataGridView1.Item(9, i).Value = True
                DataGridView1.Item(10, i).Value = FormatNumber(DT.Rows(i).Item("weight"), 2)
                DataGridView1.Item(11, i).Value = FormatNumber(DT.Rows(i).Item("priceperweight"), 0)
            Next
            txt_freight.Text = FormatNumber(DT.Rows(0).Item("freight"), 0)
            If DT.Rows(0).Item("tax") > 0 Then
                chk_ppn.Checked = True
            Else
                chk_ppn.Checked = False
            End If
            txt_amount.Text = FormatNumber(DT.Rows(0).Item("total_head"), 0)
            txtum.Text = FormatNumber(DT.Rows(0).Item("um"), 0)


            Dim jmlqty, jmlberat As Double
            For a As Integer = 0 To DataGridView1.Rows.Count - 1
                If DataGridView1(4, a).Value > 0 Or DataGridView1(4, a).Value <> Nothing Then
                    jmlqty = jmlqty + DataGridView1(4, a).Value
                End If
                If DataGridView1(10, a).Value > 0 Or DataGridView1(10, a).Value <> Nothing Then
                    jmlberat = jmlberat + (DataGridView1(4, a).Value * DataGridView1(10, a).Value)
                End If
            Next
            txt_jmlqty.Text = FormatNumber(jmlqty, 0)
            txt_jmlberat.Text = FormatNumber(jmlberat, 2)
        End If
    End Sub

    Private Sub DataGridView2_DoubleClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataGridView2.DoubleClick
        open_conn()
        Dim jml_po As Integer
        Dim a As Integer
        a = DataGridView2.CurrentCell.RowIndex
        jml_po = select_validate("PO REC", DataGridView2.Item(0, a).Value)
        If jml_po > 0 Then
            Dim info As AlertInfo = New AlertInfo("Informasi", "Barang di PO Sudah diterima")
            alertControl_warning.Show(Me, info)
            Exit Sub
        End If
        edit = 1
        insert = 0
        btn_del2.Enabled = True
        btn_cetak.Enabled = True
        a = DataGridView2.CurrentCell.RowIndex
        detail(DataGridView2.Item(0, a).Value)
        TabControl1.SelectedTabPage = TabInput
    End Sub

    Private Sub btn_del2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_del2.Click
        open_conn()

        If edit = 1 Then
            If getTemplateAkses(username, "MN_PO_DELETE") <> True Then
                Dim info As AlertInfo = New AlertInfo("Cek Kevaliditasan Data", "Anda tidak memiliki hak akses")
                alertControl_warning.Show(Me, info)
                Exit Sub
            End If
        End If

        If edit = 1 Then
            If select_validate("Purchase Order", Trim(txt_po_no.Text)) > 0 Then
                Dim info As AlertInfo = New AlertInfo("Cek Kevaliditasan Data", "PO telah di proses di faktur pembelian")
                alertControl_warning.Show(Me, info)
                Exit Sub
            End If
            pesan = MessageBox.Show("Hapus Data?", "Konfirmasi", MessageBoxButtons.YesNo, MessageBoxIcon.Question)
            If pesan = vbYes Then
                Call delete_po(Trim(txt_po_no.Text), Lookup_Pelanggan.EditValue, Format(txt_date.Value, "yyyy-MM-dd"), _
                               Trim(txt_comment.Text), txt_subtotal.Text, txt_freight.Text, Replace(txt_tax.Text, "%", ""), txt_amount.Text, _
                               "", server_datetime(), server_datetime(), (username), 0, "", "", 0, "", 0, 0, "", 0, 0, "", txt_account_um.EditValue, 0, 0)
                If param_sukses = True Then
                    Dim info As AlertInfo = New AlertInfo(msgtitle_delete_success, msgbox_delete_success)
                    alertControl_success.Show(Me, info)
                    clean()
                End If
            Else
                Dim info As AlertInfo = New AlertInfo(msgtitle_delete_failed, msgbox_delete_failed)
                alertControl_error.Show(Me, info)
                Exit Sub
            End If
        End If
    End Sub

    Private Sub txt_date_ValueChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_date.ValueChanged
        open_conn()
        If insert = 1 Then
            var_bulan = Month(txt_date.Value)
            var_tahun = Year(txt_date.Value)
            Call insert_no_trans("PO", Month(txt_date.Value), Year(txt_date.Value))
            Call select_control_no("PO", "TRANS")
            txt_po_no.Text = no_master
        End If
    End Sub

    Private Sub chk_date_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles chk_date.CheckedChanged
        open_conn()
        date_filter()
    End Sub
    Private Sub date_filter()
        open_conn()
        If chk_date.Checked = True Then
            tglawal.Enabled = True
            tglakhir.Enabled = True
        ElseIf chk_date.Checked = False Then
            tglawal.Enabled = False
            tglakhir.Enabled = False
        End If
    End Sub
    Private Sub reset_list()
        open_conn()
        chk_date.Checked = False
        tglakhir.Enabled = False
        tglawal.Enabled = False
        tglakhir.Value = Now
        tglawal.Value = Now
        cbo_search.Text = "PO No"
        txt_search.Text = ""
    End Sub
    Private Sub btn_reset_cust_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_reset_cust.Click
        open_conn()
        reset_list()
    End Sub

    Private Sub DataGridView1_CellContentClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView1.CellContentClick
        open_conn()
        Dim rows As Integer
        Dim columnIndex, rowIndex As Integer
        Dim i As Integer
        rows = DataGridView1.Rows.Count - 1

        TSubTotal = 0

        columnIndex = DataGridView1.CurrentCell.ColumnIndex
        rowIndex = DataGridView1.CurrentCell.RowIndex
        If columnIndex = 9 Then

            For i = 0 To rows
                Dim checkbox_cell As DataGridViewCheckBoxCell = CType(DataGridView1.Rows(i).Cells(9), DataGridViewCheckBoxCell)
                If checkbox_cell.EditedFormattedValue = True Then
                    TSubTotal = TSubTotal + Replace(DataGridView1.Item(7, i).Value, ",", "")
                End If
            Next
            txt_subtotal.Text = FormatNumber(TSubTotal, 0)

            hitung_nominal()
        End If
    End Sub

    Private Sub btn_save2_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_save2.Click
        open_conn()
        If insert = 1 Then
            If getTemplateAkses(username, "MN_PO_ADD") <> True Then
                Dim info As AlertInfo = New AlertInfo("Cek Kevaliditasan Data", "Anda tidak memiliki hak akses")
                alertControl_warning.Show(Me, info)
                Exit Sub
            End If
        End If

        If Trim(txtum.Text) = "" Or IsNumeric(txtum.Text) = False Then
            txtum.Text = 0
        End If

        If Lookup_Pelanggan.EditValue = Nothing Then
            Dim info As AlertInfo = New AlertInfo("Validasi", "Isi Supplier")
            alertControl_warning.Show(Me, info)
            Exit Sub
        End If

        If edit = 1 Then
            If txt_account_um.EditValue = Nothing Then
                Dim info As AlertInfo = New AlertInfo("Cek Kevaliditasan Data", "Detail Pembayaran Uang Muka Melalui belum di isi")
                alertControl_warning.Show(Me, info)
                Dim sender2 As System.Object
                Dim e2 As System.EventArgs
                SimpleButton1_Click(sender2, e2)
                Exit Sub
            End If
        End If

        If edit = 1 Then
            If getTemplateAkses(username, "MN_PO_EDIT") <> True Then
                Dim info As AlertInfo = New AlertInfo("Cek Kevaliditasan Data", "Anda tidak memiliki hak akses")
                alertControl_warning.Show(Me, info)
                Exit Sub
            End If
        End If
        If trial = True Then
            If get_count_data("trn_purchase_order_head", "no_purchase_order") > row_trial Then
                Dim info As AlertInfo = New AlertInfo("Cek Kevaliditasan Data", "Batas untuk input versi trial telah habis, silahkan membeli produk ini")
                alertControl_warning.Show(Me, info)
                Exit Sub
            End If
        End If
        insert_data()

    End Sub

    Private Sub btn_cari_cust_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_cari_cust.Click
        open_conn()
        view_data()
    End Sub

    Private Sub btn_cetak_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_cetak.Click
        open_conn()
        Dim DisplayNota As New FormNotaPO
        NoBuktiPO = Trim(txt_po_no.Text)
        With DisplayNota
            .Show()
            '  .MdiParent = MainMenu
            .WindowState = FormWindowState.Maximized
        End With
    End Sub

    Private Sub DataGridView2_CellContentClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView2.CellContentClick
        open_conn()
        Dim colIndex As Integer
        colIndex = DataGridView2.CurrentCell.ColumnIndex
        If colIndex = 8 Then
            Dim DisplayNota As New FormNotaPO
            NoBuktiPO = Trim(DataGridView2.Item(0, DataGridView2.CurrentCell.RowIndex).Value)
            With DisplayNota
                .Show()
                '  .MdiParent = MainMenu
                .WindowState = FormWindowState.Maximized
            End With
        End If
    End Sub

    Private Sub DataGridView2_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles DataGridView2.KeyDown
        open_conn()
        If e.KeyCode = Keys.Enter Then
            edit = 1
            insert = 0
            Dim a As Integer
            btn_del2.Enabled = True
            btn_cetak.Enabled = True
            a = DataGridView2.CurrentCell.RowIndex
            detail(DataGridView2.Item(0, a).Value)
            TabControl1.SelectedTabPage = TabInput
        End If
    End Sub


    Private Sub chk_ppn_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles chk_ppn.CheckedChanged
        open_conn()
        Dim i As Integer
        TSubTotal = 0
        If chk_ppn.Checked = True Then
            Dim DT As DataTable
            DT = get_tax_rate("PPN")
            txt_tax.Text = DT.Rows(0).Item(0)
            txt_tax_nominal.Text = FormatNumber((DT.Rows(0).Item(0) / 100) * (CDbl(Replace(txt_subtotal.Text, ",", ""))), 0)
        ElseIf chk_ppn.Checked = False Then
            txt_tax.Text = 0
            txt_tax_nominal.Text = 0
        End If

        For i = 0 To DataGridView1.Rows.Count - 1
            ' Dim checkbox_cell As DataGridViewCheckBoxCell = CType(DataGridView1.Rows(i).Cells(9), DataGridViewCheckBoxCell)
            'If checkbox_cell.EditedFormattedValue = True Then
            TSubTotal = TSubTotal + Replace(DataGridView1.Item(7, i).Value, ",", "")
            'End If
        Next
        txt_subtotal.Text = FormatNumber(TSubTotal, 0)
        hitung_nominal()

    End Sub

    Private Sub cbo_supplier2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbo_supplier2.Click
        open_conn()
        cbo_supplier2.DroppedDown = True
    End Sub

    Private Sub cbo_supplier2_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbo_supplier2.LostFocus
        open_conn()
        cbo_supplier2.DroppedDown = False
    End Sub

    Private Sub cbo_supplier2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbo_supplier2.SelectedIndexChanged
        open_conn()
        txt_supp_address.Text = cbo_supplier2.SelectedItem.Col3
        txt_supp_nm.Text = cbo_supplier2.SelectedItem.Col2
        'If insert = 1 Then
        '    view_data_ro(cbo_supplier2.Text)
        'End If
    End Sub

    Private Sub Panel1_Paint(ByVal sender As System.Object, ByVal e As System.Windows.Forms.PaintEventArgs)

    End Sub

    'Private Sub frmpo_SizeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.SizeChanged
    '    open_conn()
    '    Dim Total_Width_Column, Total_Width_Column2 As Integer
    '    Dim Width_Table, Width_Table2 As Integer
    '    Dim selisih_col, selisih_col2 As Integer

    '    With DataGridView1
    '        Total_Width_Column = .Columns(0).Width + .Columns(1).Width + .Columns(2).Width + .Columns(3).Width + .Columns(4).Width + .Columns(5).Width + .Columns(6).Width + .Columns(7).Width + .Columns(8).Width + .Columns(9).Width
    '        Width_Table = .Width
    '        selisih_col = Width_Table - Total_Width_Column - 65
    '        .Columns(3).Width = .Columns(3).Width + selisih_col
    '    End With
    '    With DataGridView2
    '        Total_Width_Column2 = .Columns(0).Width + .Columns(1).Width + .Columns(2).Width + .Columns(3).Width + .Columns(4).Width + .Columns(5).Width + .Columns(6).Width + .Columns(7).Width + .Columns(8).Width
    '        Width_Table2 = .Width
    '        selisih_col2 = Width_Table2 - Total_Width_Column2 - 65
    '        .Columns(7).Width = .Columns(7).Width + selisih_col2
    '    End With
    'End Sub

    Private Sub Label7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label7.Click

    End Sub

    Private Sub txt_subtotal_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txt_subtotal.TextChanged

    End Sub

    Private Sub txt_tax_nominal_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txt_tax_nominal.TextChanged

    End Sub

    Private Sub txt_freight_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txt_freight.TextChanged

    End Sub

    Private Sub Label10_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label10.Click

    End Sub

    Private Sub txt_amount_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txt_amount.TextChanged

    End Sub

    Private Sub Label8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label8.Click

    End Sub

    Private Sub btn_chk_all_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        open_conn()
        Dim i As Integer
        For i = 0 To DataGridView1.Rows.Count - 1
            DataGridView1.Item(9, i).Value = True
        Next
        hitung_check()
    End Sub

    Private Sub hitung_check()
        open_conn()
        Dim rows As Integer
        Dim columnIndex, rowIndex As Integer
        Dim i As Integer
        rows = DataGridView1.Rows.Count - 1

        TSubTotal = 0

        For i = 0 To rows
            Dim checkbox_cell As DataGridViewCheckBoxCell = CType(DataGridView1.Rows(i).Cells(9), DataGridViewCheckBoxCell)
            If checkbox_cell.EditedFormattedValue = True Then
                TSubTotal = TSubTotal + Replace(DataGridView1.Item(7, i).Value, ",", "")
            End If
        Next
        txt_subtotal.Text = FormatNumber(TSubTotal, 0)

        hitung_nominal()

    End Sub

    Private Sub btn_clear_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        open_conn()
        Dim i As Integer
        For i = 0 To DataGridView1.Rows.Count - 1
            DataGridView1.Item(9, i).Value = False
        Next
        hitung_check()
    End Sub

    Private Sub DataGridView1_CellDoubleClick(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView1.CellDoubleClick
        'open_conn()
        'mRow = DataGridView1.CurrentCell.RowIndex
        'mCol = DataGridView1.CurrentCell.ColumnIndex
        'Dim Rows As Integer
        'i = DataGridView1.CurrentCell.ColumnIndex
        'If i = 1 Or i = 2 Then

        'End If
    End Sub

    Private Sub cbo_curr_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbo_curr.SelectedIndexChanged
        txt_kurs.Text = FormatNumber(get_def_convertcurr(Trim(cbo_curr.Text)), 0)
    End Sub

    Private Sub DataGridView1_KeyDown(sender As Object, e As System.Windows.Forms.KeyEventArgs) Handles DataGridView1.KeyDown
        open_conn()
        IndexRowDg = DataGridView1.CurrentCell.RowIndex
        If e.KeyCode = Keys.Delete Then
            pesan = MessageBox.Show("Data ingin di hapus?", "Konfirmasi", MessageBoxButtons.YesNo)
            If pesan = vbYes Then
                DataGridView1.Rows.RemoveAt(IndexRowDg)
                Dim i As Integer
                For i = 0 To DataGridView1.Rows.Count - 1
                    'If columnIndex = 6 Then
                    TSubTotal = TSubTotal + DataGridView1.Item(7, i).Value
                    'End If
                Next
                txt_subtotal.Text = FormatNumber(TSubTotal, 0)


                If chk_ppn.Checked = True Then
                    Dim DT As DataTable
                    DT = get_tax_rate("PPN")
                    txt_tax.Text = DT.Rows(0).Item(0)
                    txt_tax_nominal.Text = FormatNumber((DT.Rows(0).Item(0) / 100) * (CDbl(Replace(txt_subtotal.Text, ",", ""))), 0)
                ElseIf chk_ppn.Checked = False Then
                    txt_tax.Text = 0
                    txt_tax_nominal.Text = 0
                End If

                hitung_nominal()
            End If

        End If
    End Sub

    Private Sub GridList_Customer_DoubleClick(sender As Object, e As System.EventArgs) Handles GridList_Customer.DoubleClick
        disableMain()
        PanelControl3.Visible = True
        detail(GridList_Customer.GetRowCellValue(GridList_Customer.FocusedRowHandle, "no_purchase_order"))
    End Sub

    Private Sub GridList_Customer_KeyDown(sender As Object, e As System.Windows.Forms.KeyEventArgs) Handles GridList_Customer.KeyDown
        If e.KeyCode = Keys.Enter Then
            disableMain()
            PanelControl3.Visible = True
            detail(GridList_Customer.GetRowCellValue(GridList_Customer.FocusedRowHandle, "no_purchase_order"))
        End If
    End Sub

    Private Sub btn_keluar_Click(sender As System.Object, e As System.EventArgs) Handles btn_keluar.Click
        PanelControl3.Visible = False
        enableMain()
        Try
            SplashScreenManager.ShowForm(Me, GetType(WaitForm1), True, True, False)
            SplashScreenManager.Default.SetWaitFormCaption("Please Wait")
            SplashScreenManager.Default.SetWaitFormDescription("Refresh Data . . .")
            view_data()
        Finally
            SplashScreenManager.CloseForm(False)
        End Try
    End Sub

    Private Sub Lookup_Pelanggan_EditValueChanged(sender As Object, e As System.EventArgs) Handles Lookup_Pelanggan.EditValueChanged
        If Lookup_Pelanggan.EditValue <> Nothing Then
            Dim rowSupplier As DataRowView
            rowSupplier = TryCast(Lookup_Pelanggan.Properties.GetRowByKeyValue(Lookup_Pelanggan.EditValue), DataRowView)
            txt_supp_nm.Text = rowSupplier.Item("name").ToString
            txt_supp_address.Text = rowSupplier.Item("address").ToString
        End If
    End Sub

    Private Sub disableMain()
        GridControl.Enabled = False
        PanelControl5.Enabled = False
    End Sub

    Private Sub enableMain()
        GridControl.Enabled = True
        PanelControl5.Enabled = True
    End Sub

    Private Sub SimpleButton3_Click(sender As System.Object, e As System.EventArgs) Handles SimpleButton3.Click
        PanelControl3.Visible = True
        disableMain()
        clean()
    End Sub

    Private Sub SimpleButton8_Click(sender As System.Object, e As System.EventArgs) Handles SimpleButton8.Click
        Try
            SplashScreenManager.ShowForm(Me, GetType(WaitForm1), True, True, False)
            SplashScreenManager.Default.SetWaitFormCaption("Please Wait")
            SplashScreenManager.Default.SetWaitFormDescription("Refresh Data . . .")
            view_data()
        Finally
            SplashScreenManager.CloseForm(False)
        End Try
    End Sub

    Private Sub SimpleButton4_Click(sender As System.Object, e As System.EventArgs) Handles SimpleButton4.Click
        Me.Close()
    End Sub

    Private Sub SimpleButton1_Click(sender As System.Object, e As System.EventArgs) Handles SimpleButton1.Click
        Panel1.Visible = True
        txt_totalcsh.Text = FormatNumber(txt_amount.Text, 0)
        txt_bayarum.Text = FormatNumber(txtum.Text, 0)
        txt_sisa_tagihan.Text = FormatNumber(CDbl(txt_totalcsh.Text) - CDbl(txt_bayarum.Text), 0)
        SimpleButton1.Visible = False
    End Sub

    Private Sub Button5_Click(sender As System.Object, e As System.EventArgs) Handles Button5.Click
        Panel1.Visible = False
        SimpleButton1.Visible = True
    End Sub

    Private Sub txt_bayarum_LostFocus(sender As Object, e As System.EventArgs) Handles txt_bayarum.LostFocus
        txt_sisa_tagihan.Text = FormatNumber(CDbl(txt_totalcsh.Text) - CDbl(txt_bayarum.Text))
    End Sub

    Private Sub txt_bayarum_TextChanged(sender As System.Object, e As System.EventArgs) Handles txt_bayarum.TextChanged

    End Sub

    Private Sub Panel1_Paint_1(sender As System.Object, e As System.Windows.Forms.PaintEventArgs) Handles Panel1.Paint

    End Sub




    Private Sub Button1_Click(sender As System.Object, e As System.EventArgs) Handles Button1.Click
        Panel1.Visible = False
        SimpleButton1.Visible = True
    End Sub

    Private Sub PanelControl3_Paint(sender As System.Object, e As System.Windows.Forms.PaintEventArgs) Handles PanelControl3.Paint

    End Sub

    Private Sub cbo_unit2_EditValueChanged(sender As Object, e As System.EventArgs) Handles cbo_unit2.EditValueChanged
        If cbo_unit2.EditValue <> Nothing Then
            DataGridView1.Item(5, DataGridView1.CurrentCell.RowIndex).Value = cbo_unit2.EditValue
            cbo_unit2.Visible = False
        End If
    End Sub

    Private Sub cbo_unit2_LostFocus(sender As Object, e As System.EventArgs) Handles cbo_unit2.LostFocus

    End Sub

    Private Sub SimpleButton2_Click(sender As System.Object, e As System.EventArgs) Handles SimpleButton2.Click

        open_conn()
        GroupControl9.Visible = True
        disableMain()
        Dim row_jml As Integer

        view_data_employee()
        dg_employee.SelectionMode = DataGridViewSelectionMode.FullRowSelect
        dg_marketing.SelectionMode = DataGridViewSelectionMode.FullRowSelect

        dg_marketing.Rows.Clear()
        For a As Integer = 0 To dg_employee.Rows.Count - 1
            For i As Integer = 0 To DataGridView1.Item(4, a).Value - 1
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

            Next
        Next
    End Sub

    Private Sub view_data_employee()
        open_conn()
        Dim Rows As Integer
        Dim dtcust As DataTable

        dtcust = select_detail_po(txt_po_no.Text)
        Rows = dtcust.Rows.Count - 1
        dg_employee.Rows.Clear()
        For i = 0 To Rows
            dg_employee.Rows.Add()
            dg_employee.Item(0, i).Value = dtcust.Rows(i).Item("id_item")
            dg_employee.Item(1, i).Value = dtcust.Rows(i).Item("item_name")
            dg_employee.Item(2, i).Value = dtcust.Rows(i).Item("id_item")
            dg_employee.Item(3, i).Value = FormatNumber(dtcust.Rows(i).Item("weight"), 2)
            '    dg_employee.Item(4, i).Value = dtcust.Rows(i).Item("qty")
            dg_employee.Item(5, i).Value = dtcust.Rows(i).Item("type")
            dg_employee.Item(6, i).Value = dtcust.Rows(i).Item("category")
            dg_employee.Item(7, i).Value = FormatNumber(dtcust.Rows(i).Item("kadar"), 2)
        Next
    End Sub



    Private Sub SimpleButton24_Click(sender As System.Object, e As System.EventArgs) Handles SimpleButton24.Click
        GroupControl9.Visible = False
    End Sub

    Private Sub btn_next_Click(sender As System.Object, e As System.EventArgs) Handles btn_next.Click
        open_conn()
        On Error Resume Next
        Dim index_row, row_jml As Integer
        If dg_employee.Rows.Count > 0 Then
            index_row = dg_employee.CurrentCell.RowIndex
        End If
        dg_marketing.Rows.Add(1)
        If dg_marketing.Rows.Count = 1 Then
            dg_marketing.CurrentCell = dg_marketing(0, 0)
        End If
        row_jml = dg_marketing.Rows.GetLastRow(DataGridViewElementStates.Displayed)
        dg_marketing.Item(0, row_jml).Value = dg_employee.Item(0, index_row).Value
        dg_marketing.Item(1, row_jml).Value = dg_employee.Item(1, index_row).Value
        dg_marketing.Item(2, row_jml).Value = dg_employee.Item(2, index_row).Value
        dg_marketing.Item(3, row_jml).Value = dg_employee.Item(3, index_row).Value
        dg_marketing.Item(4, row_jml).Value = dg_employee.Item(4, index_row).Value
        dg_marketing.Item(5, row_jml).Value = dg_employee.Item(5, index_row).Value
        dg_marketing.Item(6, row_jml).Value = dg_employee.Item(6, index_row).Value
        dg_marketing.Item(7, row_jml).Value = dg_employee.Item(7, index_row).Value
        dg_marketing.CurrentCell = dg_marketing(0, dg_marketing.CurrentCell.RowIndex + 1)
        'dg_employee.Rows.RemoveAt(index_row)
    End Sub

    Private Sub btn_prev_Click(sender As System.Object, e As System.EventArgs) Handles btn_prev.Click
        open_conn()
        Dim index_row, row_jml As Integer
        If dg_marketing.Rows.Count > 0 Then
            index_row = dg_marketing.CurrentCell.RowIndex
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

        dg_marketing.Rows.RemoveAt(index_row)
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
        ' Call B_Print_Out(1) ' copy 2.
        'Call b_e
        ' close port.
        'Call B_ClosePrn()
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

    Private Sub frmpo_LocationChanged(sender As Object, e As System.EventArgs) Handles Me.LocationChanged

    End Sub
End Class