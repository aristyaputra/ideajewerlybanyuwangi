Imports CrystalDecisions.CrystalReports.Engine
Imports DevExpress.XtraSplashScreen
Imports DevExpress.XtraWaitForm
Imports DevExpress.XtraBars.Alerter
Public Class frmPinjam

    Dim insert, insert_bayar As Integer
    Dim edit, edit_bayar As Integer
    Public param_focus As Integer
    Dim i As Integer
    Dim pesan As String
    Public NoFakturJual As String
    Public no_bayar As String
    Dim IndexRowDg As Integer

    Private Sub datagrid_layout()
        open_conn()

        For Each column As DataGridViewColumn In DataGridView2.Columns
            column.SortMode = DataGridViewColumnSortMode.NotSortable
            If column.Index = 3 Or column.Index = 10 Then
                column.ReadOnly = False
            Else
                column.ReadOnly = True
            End If
        Next


        With DataGridView1
            .SelectionMode = DataGridViewSelectionMode.FullRowSelect
            .CellBorderStyle = DataGridViewCellBorderStyle.SingleVertical
            .RowsDefaultCellStyle.SelectionBackColor = Color.WhiteSmoke
            .DefaultCellStyle.SelectionForeColor = Color.Black
        End With
        With DataGridView3
            .SelectionMode = DataGridViewSelectionMode.CellSelect
            .CellBorderStyle = DataGridViewCellBorderStyle.SingleVertical
            .RowsDefaultCellStyle.SelectionBackColor = Color.WhiteSmoke
            .DefaultCellStyle.SelectionForeColor = Color.Black
        End With
    End Sub

    Private Sub frmPinjam_Activated(sender As Object, e As System.EventArgs) Handles Me.Activated
        Me.WindowState = FormWindowState.Maximized
    End Sub

    Private Sub frmCurrency_FormClosed(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosedEventArgs) Handles Me.FormClosed
        close_conn()
        'MainMenu.Activate()
    End Sub


    Private Sub tutup_akses_button()
        If insert = 1 Then
            If getTemplateAkses(username, "MN_SIMPAN_PINJAM_ADD") <> True Then
                btn_save.Visible = False
            Else
                btn_save.Visible = True
            End If
        End If

        If edit = 1 Then
            If getTemplateAkses(username, "MN_SIMPAN_PINJAM_EDIT") <> True Then
                btn_save.Visible = False
            Else
                btn_save.Visible = True
            End If
        End If

        If edit = 1 Then
            If getTemplateAkses(username, "MN_SIMPAN_PINJAM_DELETE") <> True Then
                btn_delete.Visible = False
            Else
                btn_delete.Visible = True
            End If
        End If
    End Sub

    Private Sub fillComboBox()
        Dim DT As DataTable
        DT = getComboPelanggan()
        txt_pemb_before.Properties.DataSource = DT
        txt_pemb_before.Properties.DisplayMember = "nama"
        txt_pemb_before.Properties.ValueMember = "id_customer"
        txt_pemb_before.Properties.PopulateViewColumns()
        txt_pemb_before.Properties.BestFitMode = DevExpress.XtraEditors.Controls.BestFitMode.BestFitResizePopup
        txt_pemb_before.Properties.View.OptionsView.ShowAutoFilterRow = True
        txt_pemb_before.Properties.View.Columns("id_customer").Caption = "ID"
        txt_pemb_before.Properties.View.Columns("nama").Caption = "Nama"
    End Sub

    Private Sub frmPinjam_KeyDown(sender As Object, e As System.Windows.Forms.KeyEventArgs) Handles Me.KeyDown
        If e.KeyCode = Keys.F5 Then
            'Dim NewDisplayAcc As New frm_display_item
            frm_display_item_simpan.formsource_simpan = True
            frm_display_item_simpan.Show()
            ' MainMenu.Enabled = False
            'Me.Enabled = False
        End If
    End Sub

    Private Sub frmkatbarang_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DataCustomer.Customer' table. You can move, or remove it, as needed.
        open_conn()
        Me.WindowState = FormWindowState.Maximized
        Me.MdiParent = MainMenu
        'Me.Customer.Fill(Me.DataCustomer.Customer)
        'TODO: This line of code loads data into the 'DataCustomer.Customer' table. You can move, or remove it, as needed.
        DataGridView3.Rows.Add(200)
        DataGridView3.Focus()
        datagrid_layout()
        fillComboBox()
        insert = 1
        edit = 0
        btn_delete.Enabled = False
        Me.WindowState = FormWindowState.Maximized
        var_bulan = Month(txt_date.Value)
        var_tahun = Year(txt_date.Value)
        If insert = 1 Then
            Call insert_no_trans("PINJAMAN", Month(txt_date.Value), Year(txt_date.Value))
            Call select_control_no("PINJAMAN", "TRANS")
            txt_nota_pinjam.Text = no_master
        End If
        'DataGridView2.Rows.Add(36)
        insert_bayar = 1
        edit_bayar = 0
        'If username <> "admin" Then
        '    Button5.Visible = False
        'End If

        If getTemplateAkses(username, "MN_BAYAR_PINJAMAN_EDIT") <> True Then
            Button2.Visible = False
        Else
            Button2.Visible = True
            DataGridView2.Columns(2).ReadOnly = False
        End If
        view_data_new()
        tutup_akses_button()
    End Sub

    Private Sub clean()
        open_conn()
        insert = 1
        edit = 0
        Button1.Enabled = False
        btn_help.Enabled = False
        txt_item_name.Text = ""
        txt_nota_pinjam.Text = ""
        txt_alamat.Text = ""
        btn_delete.Enabled = False
        CheckBox1.Checked = False
        txt_item_name.Enabled = True
        txt_nominal.Text = 0
        txt_berat.Text = 0
        txt_date.Enabled = True
        DataGridView3.Rows.Clear()
        DataGridView3.Rows.Add(200)
        Call select_control_no("PINJAMAN", "TRANS")
        txt_nota_pinjam.Text = no_master
        txt_pemb_before.EditValue = Nothing
        DataGridView2.Rows.Clear()
        txt_nominal.Enabled = True
        txt_sisalunas.Text = 0
        txt_belum_bayar.Text = 0
        tutup_akses_button()
        If username <> "admin" Then
            Button5.Visible = False
        End If
    End Sub

    Private Sub view_data_new()
        Dim dtcust As DataTable
        dtcust = select_pinjam("", 0)
        GridControl.DataSource = dtcust
        GridList_Customer.Columns("no_pinjam").Caption = "No Pinjaman"
        GridList_Customer.Columns("nama_customer").Width = 120
        GridList_Customer.Columns("nama_customer").Caption = "Peminjam"
        GridList_Customer.Columns("nama_customer").Width = 200
        GridList_Customer.Columns("date_trn").Caption = "Tanggal"
        GridList_Customer.Columns("date_trn").Width = 95
        GridList_Customer.Columns("date_trn").DisplayFormat.FormatType = DevExpress.Utils.FormatType.DateTime
        GridList_Customer.Columns("date_trn").DisplayFormat.FormatString = "dd-MM-yyyy"
        GridList_Customer.Columns("nominal").Caption = "Nominal"
        GridList_Customer.Columns("nominal").Width = 120
        GridList_Customer.Columns("nominal").DisplayFormat.FormatType = DevExpress.Utils.FormatType.Numeric
        GridList_Customer.Columns("nominal").DisplayFormat.FormatString = "N0"
        GridList_Customer.Columns("address").Caption = "Alamat"
        GridList_Customer.Columns("address").Width = 225
       
    End Sub


    Public Sub insert_data()
        open_conn()
        Dim flag As Integer
        If cbo_surat.Text = "Dengan Surat" Then
            flag = 1
        ElseIf cbo_surat.Text = "Tidak Ada Surat" Then
            flag = 0
        End If
        If insert = 1 Then
            Call insert_pinjam(Trim(txt_nota_pinjam.Text), Trim(txt_pemb_before.EditValue), "", Trim(txt_item_name.Text), Replace(txt_nominal.Text, ",", ""), Format(txt_date.Value, "yyyy-MM-dd"), flag, Replace(txt_berat.Text, ",", ""), "INSERT", username, server_datetime(), username, server_datetime(), 0, 0, "", 0, Replace(txt_bunga.Text, ",", ""), "", txt_jw.Text)

            For a As Integer = 0 To DataGridView3.Rows.Count - 1
                If DataGridView3.Item(1, a).Value <> Nothing Then
                    Call insert_pinjam(Trim(txt_nota_pinjam.Text), Trim(txt_pemb_before.EditValue), "", Trim(txt_item_name.Text), Replace(txt_nominal.Text, ",", ""), Format(txt_date.Value, "yyyy-MM-dd"), flag, Replace(txt_berat.Text, ",", ""), "INSERT", username, server_datetime(), username, server_datetime(), 1, DataGridView3.Item(0, a).Value, DataGridView3.Item(1, a).Value, Replace(DataGridView3.Item(3, a).Value, ",", ""), Replace(txt_bunga.Text, ",", ""), DataGridView3.Item(2, a).Value, txt_jw.Text)
                End If
            Next

            If param_sukses = True Then
                ' MsgBox("Data Was Saved", MsgBoxStyle.Information + MsgBoxStyle.OkOnly, "Save Success")
                Dim info As AlertInfo = New AlertInfo(msgtitle_save_success, msgbox_save_success)
                alertControl_success.Show(Me, info)
                update_no_trans(txt_date.Value, "PINJAMAN")

                'pesan = MsgBox("Print Kartu?", MsgBoxStyle.Question + MsgBoxStyle.YesNo, "Konfirmasi")
                'If pesan = vbYes Then
                '    Dim DisplayNota As New NotaKoperasi
                '    NoFakturJual = Trim(txt_nota_pinjam.Text)
                '    With DisplayNota
                '        .Show()
                '        '  .MdiParent = MainMenu
                '        .WindowState = FormWindowState.Maximized
                '    End With

                '    'Dim R As New ReportDocument
                '    'Dim pathfilereport As String
                '    'pathfilereport = Application.StartupPath & "\Report\KartuPinjam.rpt"
                '    'R.Load(pathfilereport)
                '    'R.Refresh()
                '    'R.RecordSelectionFormula = "{trn_pinjam1.no_pinjam} ='" & Trim(txt_nota_pinjam.Text) & "'"
                '    'R.PrintToPrinter(1, False, 1, 1)
                'End If
                clean()
            End If
        ElseIf edit = 1 Then
            Call update_pinjam(Trim(txt_nota_pinjam.Text), Trim(txt_pemb_before.EditValue), "", Trim(txt_item_name.Text), Replace(txt_nominal.Text, ",", ""), txt_date.Value, flag, Replace(txt_berat.Text, ",", ""), "UPDATE", username, server_datetime(), username, server_datetime(), 0, 0, "", 0, Replace(txt_bunga.Text, ",", ""), "", txt_jw.Text)
            For a As Integer = 0 To DataGridView3.Rows.Count - 1
                If DataGridView3.Item(1, a).Value <> Nothing Then
                    Call update_pinjam(Trim(txt_nota_pinjam.Text), Trim(txt_pemb_before.EditValue), "", Trim(txt_item_name.Text), Replace(txt_nominal.Text, ",", ""), Format(txt_date.Value, "yyyy-MM-dd"), flag, Replace(txt_berat.Text, ",", ""), "UPDATE", username, server_datetime(), username, server_datetime(), 1, DataGridView3.Item(0, a).Value, DataGridView3.Item(1, a).Value, Replace(DataGridView3.Item(3, a).Value, ",", ""), Replace(txt_bunga.Text, ",", ""), DataGridView3.Item(2, a).Value, txt_jw.Text)
                End If
            Next
            If param_sukses = True Then
                MsgBox("Data Was Updated", MsgBoxStyle.Information + MsgBoxStyle.OkOnly, "Save Success")
                Dim info As AlertInfo = New AlertInfo(msgtitle_update_success, msgbox_update_success)
                alertControl_success.Show(Me, info)
                'pesan = MsgBox("Print Kartu?", MsgBoxStyle.Question + MsgBoxStyle.YesNo, "Konfirmasi")
                'If pesan = vbYes Then
                '    Dim DisplayNota As New NotaKoperasi
                '    NoFakturJual = Trim(txt_nota_pinjam.Text)
                '    With DisplayNota
                '        .Show()
                '        '  .MdiParent = MainMenu
                '        .WindowState = FormWindowState.Maximized
                '    End With
                '    'Dim R As New ReportDocument
                '    'Dim pathfilereport As String
                '    'pathfilereport = Application.StartupPath & "\Report\KartuPinjam.rpt"
                '    'R.Load(pathfilereport)
                '    'R.Refresh()
                '    'R.RecordSelectionFormula = "{trn_pinjam1.no_pinjam} ='" & Trim(txt_nota_pinjam.Text) & "'"
                '    'R.PrintToPrinter(1, False, 1, 1)
                'End If
                clean()
            End If
        End If
    End Sub

    Private Sub btn_save_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_save2.Click
        open_conn()
        If insert = 1 Then
            If getTemplateAkses(username, "MN_SIMPAN_PINJAM_ADD") <> True Then
                MsgBox("you do not have access rights!", MsgBoxStyle.Information, "User Right")
                Exit Sub
            End If
        End If

        If edit = 1 Then
            If getTemplateAkses(username, "MN_SIMPAN_PINJAM_EDIT") <> True Then
                MsgBox("you do not have access rights!", MsgBoxStyle.Information, "User Right")
                Exit Sub
            End If
        End If
        If Trim(txt_pemb_before.Text.ToString) = "" Then
            MsgBox("Penjual belum dipilih", MsgBoxStyle.Information, "Perhatian")
            Exit Sub
        End If

        If Trim(txt_jw.Text) = "" Or txt_jw.Text = 0 Then
            MsgBox("Jangka Waktu Belum Dimasukkan", MsgBoxStyle.Information, "Perhatian")
            Exit Sub
        End If

        If Trim(txt_bunga.Text) = "" Then

            txt_bunga.Text = 0
        End If
        'If Trim(txt_item_name.Text.ToString) = "" Then
        '    MsgBox("Keterangan barang belum di isi", MsgBoxStyle.Information, "Perhatian")
        '    Exit Sub
        'End If
        If Trim(txt_nominal.Text) = "" Or txt_nominal.Text = 0 Then
            MsgBox("Nominal belum di isi", MsgBoxStyle.Information, "Perhatian")
            Exit Sub
        End If
        If Trim(cbo_surat.Text) = "" Then
            MsgBox("Keterangan ada / tidak surat harus di pilih", MsgBoxStyle.Information, "Perhatian")
            Exit Sub
        End If
        insert_data()
    End Sub

    Private Sub btn_delete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_del2.Click
        open_conn()

        If edit = 1 Then
            If getTemplateAkses(username, "MN_SIMPAN_PINJAM_DELETE") <> True Then
                MsgBox("you do not have access rights!", MsgBoxStyle.Information, "User Right")
                Exit Sub
            End If
        End If

        Dim flag As Integer
        If cbo_surat.Text = "Dengan Surat" Then
            flag = 1
        ElseIf cbo_surat.Text = "Tidak Ada Surat" Then
            flag = 0
        End If
        If edit = 1 Then
            pesan = MessageBox.Show("Ingin hapus data?", "Delete", MessageBoxButtons.YesNo)
            If pesan = vbYes Then
                Call delete_pinjam(Trim(txt_nota_pinjam.Text), Trim(txt_pemb_before.Text), "", Trim(txt_item_name.Text), Replace(txt_nominal.Text, ",", ""), txt_date.Value, flag, Replace(txt_berat.Text, ",", ""), "DELETE", username, server_datetime(), username, server_datetime(), 0, 0, "", 0)
                If param_sukses = True Then
                    MsgBox("Data Was Deleted", MsgBoxStyle.Information + MsgBoxStyle.OkOnly, "Save Success")
                    clean()
                End If
            Else
                Exit Sub
            End If
        End If
    End Sub

    Private Sub view_data()
        open_conn()
        Dim i As Integer
        Dim Rows As Integer
        Dim DT As DataTable
        DT = select_pinjam("", 0)
        Rows = DT.Rows.Count - 1
        DataGridView1.Rows.Clear()
        For i = 0 To Rows
            DataGridView1.Rows.Add()
            DataGridView1.Item(0, i).Value = DT.Rows(i).Item("no_pinjam")
            DataGridView1.Item(1, i).Value = DT.Rows(i).Item("id_customer")
            DataGridView1.Item(2, i).Value = Format(DT.Rows(i).Item("date_trn"), "dd-MMM-yyyy")
            DataGridView1.Item(3, i).Value = DT.Rows(i).Item("id_item")
            DataGridView1.Item(4, i).Value = DT.Rows(i).Item("item_name")
            DataGridView1.Item(5, i).Value = FormatNumber(DT.Rows(i).Item("nominal"), 2)

        Next
    End Sub

    'Private Sub view_konversi_data()
    '    open_conn()
    '    Dim i As Integer
    '    Dim Rows As Integer
    '    Dim DT As DataTable
    '    DT = select_currency("", 2)
    '    Rows = DT.Rows.Count - 1
    '    DataGridView2.Rows.Clear()
    '    For i = 0 To Rows
    '        DataGridView2.Rows.Add()
    '        DataGridView2.Item(0, i).Value = DT.Rows(i).Item(0)
    '        DataGridView2.Item(1, i).Value = DT.Rows(i).Item(1)
    '        DataGridView2.Item(2, i).Value = DT.Rows(i).Item(2)
    '        DataGridView2.Item(3, i).Value = DT.Rows(i).Item(3)
    '        DataGridView2.Item(4, i).Value = DT.Rows(i).Item(4)
    '    Next
    'End Sub

    Dim total_bunga_belum_bayar As Double
    Private Sub hitung_pelunasan_bunga()
        total_bunga_belum_bayar = 0
        For i As Integer = 0 To DataGridView2.Rows.Count - 1
            If DataGridView2.Item(4, i).Value = False Then
                Dim checkbox_cell As DataGridViewCheckBoxCell = CType(DataGridView2.Rows(i).Cells(10), DataGridViewCheckBoxCell)
                If checkbox_cell.EditedFormattedValue = True Then
                    total_bunga_belum_bayar = total_bunga_belum_bayar + DataGridView2.Item(3, i).Value
                End If

            End If
        Next
    End Sub


    Private Sub detail_bayar(ByVal criteria As String)
        open_conn()
        Dim DT, DT_Bayar As DataTable
        DT = select_pinjam(criteria, 1)
        If DT.Rows.Count = 0 Then
            Exit Sub
        End If
        txt_nota_pinjam.Text = DT.Rows(0).Item("no_pinjam")
        txt_nota.Text = DT.Rows(0).Item("no_pinjam")
        txt_pemb_before.EditValue = DT.Rows(0).Item("id_customer")
        txt_peminjam.Text = DT.Rows(0).Item("nama")
        txt_item_name.Text = DT.Rows(0).Item("item_name")
        txt_alamat.Text = DT.Rows(0).Item("address")
        txt_nominal.Text = FormatNumber(DT.Rows(0).Item("nominal"), 0)
        txt_nilai.Text = FormatNumber(DT.Rows(0).Item("nominal"), 0)
        txt_berat.Text = DT.Rows(0).Item("berat")
        txt_date.Value = DT.Rows(0).Item("date_trn")
        txt_tgl.Value = DT.Rows(0).Item("date_trn")
        txt_sisalunas.Text = FormatNumber(DT.Rows(0).Item("nominal"), 2)
        If DT.Rows(0).Item("flag_surat") = 1 Then
            cbo_surat.Text = "Dengan Surat"
        ElseIf DT.Rows(0).Item("flag_surat") = 0 Then
            cbo_surat.Text = "Tidak Ada Surat"
        End If
        btn_help.Enabled = True
        Button1.Enabled = True
        txt_nominal.Enabled = False
        txt_bunga.Text = FormatNumber(DT.Rows(0).Item("bunga"), 2)
        txt_bunga2.Text = FormatNumber(DT.Rows(0).Item("bunga"), 2)
        txt_jw.Text = FormatNumber(DT.Rows(0).Item("jangka_waktu"), 0)
        txt_tempo.Text = FormatNumber(DT.Rows(0).Item("jangka_waktu"), 0)
        For x As Integer = 0 To DT.Rows.Count - 1
            DataGridView3.Item(0, x).Value = DT.Rows(x).Item("no_asc")
            DataGridView3.Item(1, x).Value = DT.Rows(x).Item("id_item_det")
            DataGridView3.Item(2, x).Value = DT.Rows(x).Item("item_name_det")
            DataGridView3.Item(3, x).Value = FormatNumber(DT.Rows(x).Item("weight"), 2)
        Next


        Dim total_angsuran As Double
        DataGridView2.Rows.Clear()
        DT_Bayar = select_pinjam_bayar(criteria, 1)
        If DT_Bayar.Rows.Count > 0 Then
            For b As Integer = 0 To DT_Bayar.Rows.Count - 1
                DataGridView2.Rows.Add(1)
                DataGridView2.Item(0, b).Value = Format(DT_Bayar.Rows(b).Item("date_trn"), "dd-MM-yyyy")
                DataGridView2.Item(8, b).Value = Format(DT_Bayar.Rows(b).Item("date_trn"), "yyyy-MM-dd")
                DataGridView2.Item(1, b).Value = Format(DT_Bayar.Rows(b).Item("due_date"), "dd-MM-yyyy")
                DataGridView2.Item(9, b).Value = Format(DT_Bayar.Rows(b).Item("due_date"), "yyyy-MM-dd")
                DataGridView2.Item(2, b).Value = FormatNumber(DT_Bayar.Rows(b).Item("bunga"), 2)
                DataGridView2.Item(3, b).Value = FormatNumber(DT_Bayar.Rows(b).Item("nominal_bunga"), 0)
                'total_angsuran = total_angsuran + DT_Bayar.Rows(b).Item("nominal_bunga")
                DataGridView2.Rows(b).DefaultCellStyle.BackColor = Color.Gainsboro
                DataGridView2.Rows(b).Cells(10).ReadOnly = True
                DataGridView2.Item(4, b).Value = True
            Next
        End If

        Dim current_row As Integer
        current_row = DT_Bayar.Rows.Count

        Dim akan_bayar As Integer
        Dim tgl_akhir, tgl_jt As Date
        Dim var_bulan As String
        akan_bayar = select_akan_bayar(criteria)

        If jml_terbayar_koperasi(criteria) > 0 Then
            tgl_akhir = tgl_akhir_bayar(criteria)
            tgl_jt = tgl_pinjam(criteria)
        Else
            tgl_akhir = tgl_pinjam(criteria)
            tgl_jt = tgl_pinjam(criteria)
        End If

        Dim bulan_skrg, bulan_due, tahun_skrg, tahun_akhir_byr, tahun_due, day_due As Integer
        bulan_skrg = CInt(Format(tgl_akhir, "MM"))
        bulan_due = bulan_skrg

        Dim bulan_sebelumnya As Integer
        If akan_bayar > 0 Then
            bulan_sebelumnya = CInt(Format(CDate(DataGridView2.Item(9, current_row - 1).Value), "MM"))
        Else
            bulan_sebelumnya = bulan_skrg
        End If

        Dim akhir As Boolean
        'If akan_bayar > 0 Then
        If is_payoff(txt_nota.Text) = 0 Then
            lbl_lunas.Visible = False
            tahun_due = CInt(Format(txt_tgl.Value, "yyyy"))
            For i As Integer = 0 To DT.Rows(0).Item("jangka_waktu") - 1 - akan_bayar
                DataGridView2.Rows.Add(1)

                DataGridView2.Item(0, i + current_row).Value = Format(Now, "dd-MM-yyyy")

                DataGridView2.Item(8, i + current_row).Value = Format(Now, "yyyy-MM-dd")

                Dim due_date As Date


                day_due = CInt(Format(tgl_jt, "dd"))
                tahun_skrg = CInt(Format(Now, "yyyy"))
                tahun_akhir_byr = CInt(Format(tgl_akhir, "yyyy"))


                '  If tahun_skrg > tahun_akhir_byr Then
                'If bulan_due >= 12 Then
                '    tahun_due = tahun_due + 1
                'Else

                '  End If
                'Else
                'tahun_due = tahun_akhir_byr
                'End If


                If bulan_due >= 12 Then
                    bulan_due = 1
                    bulan_sebelumnya = 1
                    tahun_due = tahun_due + 1
                Else
                    bulan_due = bulan_sebelumnya + 1
                    bulan_sebelumnya = bulan_due
                End If


                Dim hari_hitung_progresif, lastrow As Integer
                Dim bunga_progresif As Double
                Dim bunga_perbulan As Double



                due_date = bulan_due & "-" & day_due & "-" & tahun_due
                DataGridView2.Item(1, i + current_row).Value = Format(due_date, "dd-MM-yyyy")
                DataGridView2.Item(9, i + current_row).Value = Format(due_date, "yyyy-MM-dd")
                DataGridView2.Item(2, i + current_row).Value = FormatNumber(DT.Rows(0).Item("bunga"), 2)
                '  If i = 0 And DataGridView2.Item(4, i).Value = False Then
                ' hari_hitung_progresif = CInt(Format(Now(), "dd")) - CInt(Format(txt_tgl.Value, "dd"))
                ' Else
                hari_hitung_progresif = CInt(Format(txt_tglbayar.Value, "dd")) - day_due
                'End If

                bunga_perbulan = Math.Round(Replace(txt_nilai.Text, ",", "") * DataGridView2.Item(2, DataGridView2.CurrentCell.RowIndex).Value / 100, 0)


                'If tahun_skrg > tahun_akhir_byr Then
                '    If i = 0 And DataGridView2.Item(4, i).Value = False Then
                '        bunga_progresif = (bunga_perbulan * ((12 - Math.Abs(bulan_skrg - CInt(Format(txt_tgl.Value, "MM")))))) + (bunga_perbulan / 30 * hari_hitung_progresif)
                '    Else
                '        bunga_progresif = (bunga_perbulan * ((12 - Math.Abs(bulan_skrg - bulan_due)))) + (bunga_perbulan / 30 * hari_hitung_progresif)
                '    End If
                'Else
                'If i = 0 And DataGridView2.Item(4, i).Value = False Then
                '    bunga_progresif = (bunga_perbulan * (Math.Abs(bulan_skrg - CInt(Format(txt_tgl.Value, "MM"))))) + (bunga_perbulan / 30 * hari_hitung_progresif)
                'Else
                '    bunga_progresif = (bunga_perbulan * (Math.Abs(bulan_skrg - bulan_due))) + (bunga_perbulan / 30 * hari_hitung_progresif)
                'End If

                ' If i = 0 And DataGridView2.Item(4, i).Value = False Then
                '    If bulan_skrg = bulan_due And tahun_skrg = tahun_due Then
                'bunga_progresif = bunga_perbulan
                'Else
                bunga_progresif = (bunga_perbulan / 30 * hari_hitung_progresif)
                ' End If
                ' Else
                ' bunga_progresif = (bunga_perbulan) + (bunga_perbulan / 30 * hari_hitung_progresif)
                ' End If
                '   End If

                If CDate(DataGridView2.Item(9, i + current_row).Value) < Now() Or i = 0 Then
                    If i = DT.Rows(0).Item("jangka_waktu") - 1 - akan_bayar Then
                        DataGridView2.Item(3, i + current_row).Value = FormatNumber(Math.Round(bunga_progresif, 0), 0)
                    ElseIf i < DT.Rows(0).Item("jangka_waktu") - 1 - akan_bayar Then
                        DataGridView2.Item(3, i + current_row).Value = FormatNumber(Math.Round(Replace(txt_nilai.Text, ",", "") * DataGridView2.Item(2, DataGridView2.CurrentCell.RowIndex).Value / 100, 0), 0)
                    End If
                    'akhir = False
                Else
                    'akhir = True
                End If




                ' total_angsuran = total_angsuran + DT_Bayar.Rows(i).Item("nominal_bunga")
                DataGridView2.Item(4, i + current_row).Value = False
            Next

            hitung_akhir_progresif()
            'ElseIf akan_bayar = 0 Then
            'For i As Integer = 0 To akan_bayar
            '    DataGridView2.Rows.Add(1)

            '    DataGridView2.Item(0, i + current_row).Value = Format(Now, "dd-MM-yyyy")
            '    DataGridView2.Item(8, i + current_row).Value = Format(Now, "yyyy-MM-dd")
            '    Dim bulan_skrg, bulan_due, tahun_skrg, tahun_akhir_byr, tahun_due, day_due As Integer
            '    Dim due_date As Date
            '    bulan_skrg = CInt(Format(tgl_akhir, "MM"))
            '    day_due = CInt(Format(tgl_jt, "dd"))
            '    tahun_skrg = CInt(Format(Now, "yyyy"))
            '    tahun_akhir_byr = CInt(Format(tgl_akhir, "yyyy"))
            '    If tahun_skrg > tahun_akhir_byr Then
            '        If bulan_due >= 12 Then
            '            tahun_due = CInt(Format(txt_tgl.Value, "yyyy")) + 1
            '        Else
            '            tahun_due = CInt(Format(txt_tgl.Value, "yyyy"))
            '        End If
            '    Else
            '        tahun_due = tahun_akhir_byr
            '    End If

            '    If bulan_due >= 12 Then
            '        bulan_due = 1
            '    Else
            '        bulan_due = bulan_skrg + i + 1
            '    End If

            '    Dim hari_hitung_progresif As Integer
            '    Dim bunga_progresif As Double
            '    Dim bunga_perbulan As Double


            '    due_date = bulan_due & "-" & day_due & "-" & tahun_due
            '    DataGridView2.Item(1, i + current_row).Value = Format(due_date, "dd-MM-yyyy")
            '    DataGridView2.Item(9, i + current_row).Value = Format(due_date, "yyyy-MM-dd")
            '    DataGridView2.Item(2, i + current_row).Value = FormatNumber(DT.Rows(0).Item("bunga"), 2)

            '    If i = 0 And DataGridView2.Item(4, i).Value = False Then
            '        hari_hitung_progresif = CInt(Format(Now(), "dd")) - CInt(Format(txt_tgl.Value, "dd"))
            '    Else
            '        hari_hitung_progresif = CInt(Format(Now(), "dd")) - day_due
            '    End If


            '    bunga_perbulan = Math.Round(Replace(txt_nilai.Text, ",", "") * DataGridView2.Item(2, DataGridView2.CurrentCell.RowIndex).Value / 100, 0)

            '    bunga_progresif = (bunga_perbulan / 30 * hari_hitung_progresif)

            '    '  If i = akan_bayar - 1 Then
            '    'DataGridView2.Item(3, i + current_row).Value = FormatNumber(Math.Round(bunga_progresif, 0), 0)
            '    'ElseIf i < akan_bayar - 1 Then
            '    DataGridView2.Item(3, i + current_row).Value = FormatNumber(Math.Round(Replace(txt_nilai.Text, ",", "") * DataGridView2.Item(2, DataGridView2.CurrentCell.RowIndex).Value / 100, 0), 0)
            '    'End If

            '    'If DataGridView2.CurrentCell.RowIndex = DataGridView2.Rows.Count - 1 Then
            '    '    DataGridView2.Item(3, i + current_row).Value = FormatNumber(Math.Round(bunga_progresif, 0), 0)
            '    'Else
            '    '    DataGridView2.Item(3, i + current_row).Value = FormatNumber(Math.Round(Replace(txt_nominal.Text, ",", "") * DataGridView2.Item(2, DataGridView2.CurrentCell.RowIndex).Value / 100, 0), 0)
            '    'End If
            '    ' total_angsuran = total_angsuran + DT_Bayar.Rows(i).Item("nominal_bunga")
            '    DataGridView2.Item(4, i + current_row).Value = False
            'Next

            'End If

            hitung_pelunasan_bunga()

            txt_belum_bayar.Text = FormatNumber(total_bunga_belum_bayar, 0)
            TextBox1.Text = FormatNumber(total_bunga_belum_bayar, 0)
            txt_lunas.Text = txt_sisalunas.Text

            For a As Integer = 0 To DataGridView2.Rows.Count - 1
                If DataGridView2.Item(4, a).Value = True Then
                    DataGridView2.Item(2, a).ReadOnly = True
                    'DataGridView2.Columns(5).TE = Color.White
                    'DataGridView2.Columns(5).DefaultCellStyle.ForeColor = Color.White
                Else
                    DataGridView2.Item(2, a).ReadOnly = False

                End If
            Next
        Else
            lbl_lunas.Visible = True
        End If
        tutup_akses_button()
        If username <> "admin" Then
            Button5.Visible = False
        End If
    End Sub

    Private Sub hitung_akhir_progresif()
        Dim akhir As Integer
        Dim bunga_progresif, bunga_perbulan, hari_hitung_progresif As Double
        For z As Integer = 0 To DataGridView2.Rows.Count - 1
            If DataGridView2.Item(3, z).Value = Nothing Then
                akhir = z - 1
                Exit For
            End If
        Next

        If akhir < 0 Then
            akhir = 0
        End If

        If akhir - 1 >= 0 Then
            If DataGridView2.Item(4, akhir - 1).Value = False Then
                hari_hitung_progresif = CInt(Format(Now(), "dd")) - CInt(Format(CDate(DataGridView2.Item(9, akhir).Value), "dd"))

                bunga_perbulan = Math.Round(Replace(txt_nilai.Text, ",", "") * DataGridView2.Item(2, akhir).Value / 100, 0)
                bunga_progresif = (bunga_perbulan / 30 * hari_hitung_progresif)
                DataGridView2.Item(3, i + akhir).Value = FormatNumber(Math.Round(bunga_progresif, 0) + bunga_perbulan, 0)
            End If
        Else
            If DataGridView2.Item(4, akhir).Value = False Then
                hari_hitung_progresif = CInt(Format(Now(), "dd")) - CInt(Format(CDate(DataGridView2.Item(9, akhir).Value), "dd"))

                bunga_perbulan = Math.Round(Replace(txt_nilai.Text, ",", "") * DataGridView2.Item(2, akhir).Value / 100, 0)
                bunga_progresif = (bunga_perbulan / 30 * hari_hitung_progresif)
                DataGridView2.Item(3, i + akhir).Value = FormatNumber(Math.Round(bunga_progresif, 0), 0)
            End If
        End If
    End Sub

    Private Sub detail(ByVal criteria As String)
        open_conn()
        Dim DT, DT_Bayar As DataTable
        DT = select_pinjam(criteria, 1)
        txt_nota_pinjam.Text = DT.Rows(0).Item("no_pinjam")
        txt_nota.Text = DT.Rows(0).Item("no_pinjam")
        txt_pemb_before.EditValue = DT.Rows(0).Item("id_customer")
        txt_peminjam.Text = DT.Rows(0).Item("nama")
        txt_item_name.Text = DT.Rows(0).Item("item_name")
        txt_alamat.Text = DT.Rows(0).Item("address")
        txt_nominal.Text = FormatNumber(DT.Rows(0).Item("nominal"), 0)
        txt_nilai.Text = FormatNumber(DT.Rows(0).Item("nominal"), 0)
        txt_berat.Text = DT.Rows(0).Item("berat")
        txt_date.Value = DT.Rows(0).Item("date_trn")
        txt_tgl.Value = DT.Rows(0).Item("date_trn")
        txt_sisalunas.Text = FormatNumber(DT.Rows(0).Item("nominal"), 2)
        If DT.Rows(0).Item("flag_surat") = 1 Then
            cbo_surat.Text = "Dengan Surat"
        ElseIf DT.Rows(0).Item("flag_surat") = 0 Then
            cbo_surat.Text = "Tidak Ada Surat"
        End If
        btn_help.Enabled = True
        Button1.Enabled = True
        txt_nominal.Enabled = False
        txt_bunga.Text = FormatNumber(DT.Rows(0).Item("bunga"), 2)
        txt_bunga2.Text = FormatNumber(DT.Rows(0).Item("bunga"), 2)
        txt_jw.Text = FormatNumber(DT.Rows(0).Item("jangka_waktu"), 0)

        For x As Integer = 0 To DT.Rows.Count - 1
            DataGridView3.Item(0, x).Value = DT.Rows(x).Item("no_asc")
            DataGridView3.Item(1, x).Value = DT.Rows(x).Item("id_item_det")
            DataGridView3.Item(2, x).Value = DT.Rows(x).Item("item_name_det")
            DataGridView3.Item(3, x).Value = FormatNumber(DT.Rows(x).Item("weight"), 2)
        Next


        'Dim total_angsuran As Double
        'DataGridView2.Rows.Clear()
        'DT_Bayar = select_pinjam_bayar(criteria, 1)
        'If DT_Bayar.Rows.Count > 0 Then
        '    For b As Integer = 0 To DT_Bayar.Rows.Count - 1
        '        DataGridView2.Rows.Add(1)
        '        DataGridView2.Item(0, b).Value = Format(DT_Bayar.Rows(b).Item("date_trn"), "dd-MM-yyyy")
        '        DataGridView2.Item(8, b).Value = Format(DT_Bayar.Rows(b).Item("date_trn"), "yyyy-MM-dd")
        '        DataGridView2.Item(1, b).Value = Format(DT_Bayar.Rows(b).Item("due_date"), "dd-MM-yyyy")
        '        DataGridView2.Item(9, b).Value = Format(DT_Bayar.Rows(b).Item("due_date"), "yyyy-MM-dd")
        '        DataGridView2.Item(2, b).Value = FormatNumber(DT_Bayar.Rows(b).Item("bunga"), 2)
        '        DataGridView2.Item(3, b).Value = FormatNumber(DT_Bayar.Rows(b).Item("nominal_bunga"), 2)
        '        'total_angsuran = total_angsuran + DT_Bayar.Rows(b).Item("nominal_bunga")
        '        DataGridView2.Item(4, b).Value = True
        '    Next
        'End If

        'Dim current_row As Integer
        'current_row = DT_Bayar.Rows.Count

        'Dim akan_bayar As Integer
        'Dim tgl_akhir As Date
        'Dim var_bulan As String
        'akan_bayar = select_akan_bayar(criteria)

        'If jml_terbayar_koperasi(criteria) > 0 Then
        '    tgl_akhir = tgl_akhir_bayar(criteria)
        'Else
        '    tgl_akhir = tgl_pinjam(criteria)
        'End If


        'If akan_bayar > 0 Then
        '    For i As Integer = 0 To akan_bayar - 1
        '        DataGridView2.Rows.Add(1)

        '        DataGridView2.Item(0, i + current_row).Value = Format(Now, "dd-MM-yyyy")

        '        DataGridView2.Item(8, i + current_row).Value = Format(Now, "yyyy-MM-dd")
        '        Dim bulan_skrg, bulan_due, tahun_skrg, tahun_akhir_byr, tahun_due, day_due As Integer
        '        Dim due_date As Date
        '        bulan_skrg = CInt(Format(tgl_akhir, "MM"))
        '        day_due = CInt(Format(tgl_akhir, "dd"))
        '        tahun_skrg = CInt(Format(Now, "yyyy"))
        '        tahun_akhir_byr = CInt(Format(tgl_akhir, "yyyy"))
        '        If bulan_due >= 12 Then
        '            bulan_due = 1
        '        Else
        '            bulan_due = bulan_skrg + i + 1
        '        End If
        '        If tahun_skrg > tahun_akhir_byr Then
        '            tahun_due = tahun_due + 1
        '        Else
        '            tahun_due = tahun_akhir_byr
        '        End If
        '        due_date = bulan_due & "-" & day_due & "-" & tahun_due
        '        DataGridView2.Item(1, i + current_row).Value = Format(due_date, "dd-MM-yyyy")
        '        DataGridView2.Item(9, i + current_row).Value = Format(due_date, "yyyy-MM-dd")
        '        DataGridView2.Item(2, i + current_row).Value = FormatNumber(DT.Rows(0).Item("bunga"), 2)
        '        DataGridView2.Item(3, i + current_row).Value = FormatNumber(Math.Round(Replace(txt_nominal.Text, ",", "") * DataGridView2.Item(2, DataGridView2.CurrentCell.RowIndex).Value / 100, 0), 0)
        '        ' total_angsuran = total_angsuran + DT_Bayar.Rows(i).Item("nominal_bunga")
        '        DataGridView2.Item(4, i + current_row).Value = False
        '    Next

        'ElseIf akan_bayar = 0 Then
        '    For i As Integer = 0 To akan_bayar
        '        DataGridView2.Rows.Add(1)

        '        DataGridView2.Item(0, i + current_row).Value = Format(Now, "dd-MM-yyyy")
        '        DataGridView2.Item(8, i + current_row).Value = Format(Now, "yyyy-MM-dd")
        '        Dim bulan_skrg, bulan_due, tahun_skrg, tahun_akhir_byr, tahun_due, day_due As Integer
        '        Dim due_date As Date
        '        bulan_skrg = CInt(Format(tgl_akhir, "MM"))
        '        day_due = CInt(Format(tgl_akhir, "dd"))
        '        tahun_skrg = CInt(Format(Now, "yyyy"))
        '        tahun_akhir_byr = CInt(Format(tgl_akhir, "yyyy"))
        '        If bulan_due >= 12 Then
        '            bulan_due = 1
        '        Else
        '            bulan_due = bulan_skrg + i + 1
        '        End If
        '        If tahun_skrg > tahun_akhir_byr Then
        '            tahun_due = tahun_due + 1
        '        Else
        '            tahun_due = tahun_akhir_byr
        '        End If
        '        due_date = bulan_due & "-" & day_due & "-" & tahun_due
        '        DataGridView2.Item(1, i + current_row).Value = Format(due_date, "dd-MM-yyyy")
        '        DataGridView2.Item(9, i + current_row).Value = Format(due_date, "yyyy-MM-dd")
        '        DataGridView2.Item(2, i + current_row).Value = FormatNumber(DT.Rows(0).Item("bunga"), 2)
        '        DataGridView2.Item(3, i + current_row).Value = FormatNumber(Math.Round(Replace(txt_nominal.Text, ",", "") * DataGridView2.Item(2, DataGridView2.CurrentCell.RowIndex).Value / 100, 0), 0)
        '        ' total_angsuran = total_angsuran + DT_Bayar.Rows(i).Item("nominal_bunga")
        '        DataGridView2.Item(4, i + current_row).Value = False
        '    Next

        'End If


        'txt_belum_bayar.Text = FormatNumber(total_angsuran, 2)
        'txt_lunas.Text = txt_sisalunas.Text

        'For a As Integer = 0 To DataGridView2.Rows.Count - 1
        '    If DataGridView2.Item(4, a).Value = True Then
        '        DataGridView2.Item(2, a).ReadOnly = True
        '        'DataGridView2.Columns(5).TE = Color.White
        '        'DataGridView2.Columns(5).DefaultCellStyle.ForeColor = Color.White
        '    Else
        '        DataGridView2.Item(2, a).ReadOnly = False

        '    End If
        'Next
        tutup_akses_button()
        If username <> "admin" Then
            Button5.Visible = False
        End If
    End Sub

    Private Sub txtket_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txt_item_name.KeyPress
        open_conn()
        If e.KeyChar = Chr(13) Then
            SendKeys.Send("{TAB}")
        End If
    End Sub

    Private Sub txtkode_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs)
        open_conn()
        If e.KeyChar = Chr(13) Then
            SendKeys.Send("{TAB}")
        End If
    End Sub

    Private Sub txtnama_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txt_nota_pinjam.KeyPress
        open_conn()
        If e.KeyChar = Chr(13) Then
            SendKeys.Send("{TAB}")
        End If
    End Sub

    Private Sub btn_reset_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_reset2.Click
        open_conn()
        clean()
    End Sub

    Private Sub DataGridView1_DoubleClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataGridView1.DoubleClick
        open_conn()
        insert = 0
        edit = 1
        i = DataGridView1.CurrentCell.RowIndex
        detail(DataGridView1.Item(0, i).Value)
        TabControl1.SelectedTab = TabInput
        btn_delete.Enabled = True
        txt_date.Enabled = False


    End Sub

    Private Sub TabControl1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TabControl1.SelectedIndexChanged
        open_conn()
        If TabControl1.SelectedTab Is TabList Then
            view_data_new()
        End If
        'Dim Total_Width_Column2 As Integer
        'Dim Width_Table2 As Integer
        'Dim selisih_col2 As Integer

        'With DataGridView1
        '    Total_Width_Column2 = .Columns(0).Width + .Columns(1).Width + .Columns(2).Width + .Columns(4).Width + .Columns(5).Width
        '    Width_Table2 = .Width
        '    selisih_col2 = Width_Table2 - Total_Width_Column2
        '    .Columns(4).Width = .Columns(4).Width + selisih_col2 + 400
        'End With
    End Sub

    'Private Sub btn_save_konversi_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
    '    open_conn()
    '    Dim rows As Integer
    '    Dim i As Integer
    '    rows = DataGridView2.Rows.Count - 1
    '    For i = 0 To rows
    '        If DataGridView2.Item(0, i).Value.ToString <> "" Then
    '            If DataGridView2.Item(0, i).Value <> DataGridView2.Item(3, i).Value Then
    '                Call update_setcurrency(DataGridView2.Item(0, i).Value, DataGridView2.Item(2, i).Value)
    '            End If
    '        End If
    '    Next
    '    If param_sukses = True Then
    '        MsgBox("Update Success", MsgBoxStyle.Information + MsgBoxStyle.OkOnly)
    '    End If
    'End Sub

    Private Sub txtnegara_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txt_alamat.KeyPress
        open_conn()
        If e.KeyChar = Chr(13) Then
            SendKeys.Send("{TAB}")
        End If
    End Sub

    Private Sub DataGridView1_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles DataGridView1.KeyDown
        open_conn()
        If e.KeyCode = Keys.Enter Then
            insert = 0
            edit = 1
            i = DataGridView1.CurrentCell.RowIndex
            detail(DataGridView1.Item(0, i).Value)
            TabControl1.SelectedTab = TabInput
            btn_delete.Enabled = True
            txt_date.Enabled = False
            Button1.Enabled = True
        End If
    End Sub

    Private Sub DataGridView1_CellContentClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView1.CellContentClick
        If DataGridView1.CurrentCell.ColumnIndex = 6 Then
            Dim DisplayNota As New NotaKoperasi
            NoFakturJual = Trim(DataGridView1.Item(0, DataGridView1.CurrentCell.RowIndex).Value)
            With DisplayNota
                .Show()
                '  .MdiParent = MainMenu
                .WindowState = FormWindowState.Maximized
            End With
        End If
    End Sub

    Private Sub txtnama_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txt_nota_pinjam.TextChanged

    End Sub

    Private Sub frmCurrency_SizeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.SizeChanged

    End Sub

    Private Sub TabConvert_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub NavBarControl9_Click(sender As System.Object, e As System.EventArgs) Handles NavBarControl9.Click

    End Sub

    Private Sub Button4_Click(sender As System.Object, e As System.EventArgs) Handles Button4.Click
        Me.Close()
    End Sub

    Private Sub DataGridView2_CellContentClick(sender As System.Object, e As System.Windows.Forms.DataGridViewCellEventArgs)

    End Sub

    Private Sub txt_pemb_before_EditValueChanged(sender As System.Object, e As System.EventArgs) Handles txt_pemb_before.EditValueChanged
        Dim id_customer, nama_customer, alamat As String
        Dim row As DataRowView
        Dim total_cost As Double
        row = TryCast(txt_pemb_before.Properties.GetRowByKeyValue(txt_pemb_before.EditValue), DataRowView)

        If txt_pemb_before.EditValue <> Nothing Then
            id_customer = row.Item("id_customer")
            nama_customer = row.Item("nama")
            alamat = row.Item("address")
            txt_alamat.Text = alamat
        End If
        ' txt_pemb_before.Text = id_customer
    End Sub

    Private Sub txt_berat_LostFocus(sender As Object, e As System.EventArgs) Handles txt_berat.LostFocus
        Dim berat As Double
        berat = Replace(txt_berat.Text, ",", "")
        txt_berat.Text = FormatNumber(berat, 2)
    End Sub

    Private Sub txt_nominal_LostFocus(sender As Object, e As System.EventArgs) Handles txt_nominal.LostFocus
        Dim nominal As Double
        nominal = Replace(txt_nominal.Text, ",", "")
        txt_nominal.Text = FormatNumber(nominal, 2)
    End Sub

    Private Sub Button1_Click(sender As System.Object, e As System.EventArgs) Handles Button1.Click
        Dim lastindex As Integer
        Dim bln_jt, bln_now As Integer
        Dim bln_jt_str As String
        Dim tgl_jt As Date
        bln_now = Month(server_datetime())
        bln_jt = bln_now + 1
        If Len(CStr(bln_now)) = 1 Then
            bln_jt_str = "0" & CStr(bln_now)
        Else
            bln_jt_str = CStr(bln_now)
        End If
        tgl_jt = bln_jt_str & "-" & Format(server_datetime(), "dd") & "-" & Format(server_datetime(), "yyyy")


        lastindex = DataGridView2.Rows.Count - 1
        DataGridView2.Rows.Add(1)
        DataGridView2.Item(0, lastindex + 1).Value = Format(Now, "dd-MM-yyyy")
        DataGridView2.Item(1, lastindex + 1).Value = Format(tgl_jt, "dd-MM-yyyy")
        DataGridView2.Item(8, lastindex + 1).Value = Format(Now, "yyyy-MM-dd")
        DataGridView2.Item(9, lastindex + 1).Value = Format(tgl_jt, "yyyy-MM-dd")

    End Sub

    'Dim generalRowIndex, generalColIndex As Integer
    Private Sub DataGridView2_CellContentClick_1(sender As System.Object, e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView2.CellContentClick
        Dim mRow, mCol As Integer
        mRow = DataGridView2.CurrentCell.RowIndex
        mCol = DataGridView2.CurrentCell.ColumnIndex
        ' generalRowIndex = DataGridView2.CurrentCell.RowIndex
        ' generalColIndex = DataGridView2.CurrentCell.ColumnIndex
        If DataGridView2.Item(4, mRow).Value = False Then
            If mCol = 6 Then
                DataGridView2.Rows.RemoveAt(mRow)
            ElseIf mCol = 5 Then
                ' insert_data_bayar()
            ElseIf mCol = 10 Then
                If DataGridView2.Item(10, mRow).Value = False Then

                    If check_urut_mark() = True Then
                        Dim checkbox_cell As DataGridViewCheckBoxCell = CType(DataGridView2.Rows(mRow).Cells(10), DataGridViewCheckBoxCell)
                        checkbox_cell.Value = False
                        'DataGridView2.Rows(mRow).Cells(mCol).ReadOnly = True

                        Dim info As AlertInfo = New AlertInfo("Validasi", "Pembayaran sebelumnya belum dipilih")
                        alertControl_warning.Show(MainMenu, info)
                        Exit Sub
                    End If


                    DataGridView2.Item(0, mRow).Value = Format(txt_tglbayar.Value, "dd-MM-yyyy")
                    DataGridView2.Item(8, mRow).Value = Format(txt_tglbayar.Value, "yyyy-MM-dd")

                    Dim tgl_jt, tgl_akhir As Date
                    If jml_terbayar_koperasi(txt_nota_pinjam.Text) > 0 Then
                        tgl_akhir = tgl_akhir_bayar(txt_nota_pinjam.Text)
                        tgl_jt = tgl_pinjam(txt_nota_pinjam.Text)
                    Else
                        tgl_akhir = tgl_pinjam(txt_nota_pinjam.Text)
                        tgl_jt = tgl_pinjam(txt_nota_pinjam.Text)
                    End If

                    Dim bunga_perbulan, day_due As Double
                    bunga_perbulan = Math.Round(Replace(txt_nilai.Text, ",", "") * DataGridView2.Item(2, mRow).Value / 100, 0)
                    Dim due_date As Date


                    day_due = CInt(Format(tgl_jt, "dd"))
                    Dim hari_hitung_progresif, lastrow As Integer
                    Dim bunga_progresif As Double

                    If i = 0 And DataGridView2.Item(4, i).Value = False Then
                        hari_hitung_progresif = CInt(Format(Now(), "dd")) - CInt(Format(txt_tgl.Value, "dd"))
                    Else
                        hari_hitung_progresif = CInt(Format(Now(), "dd")) - day_due
                    End If
                    bunga_progresif = (bunga_perbulan / 30 * hari_hitung_progresif)

                    hitung_pelunasan_bunga()

                    
                    'txt_belum_bayar.Text = FormatNumber(total_bunga_belum_bayar, 2)
                    TextBox1.Text = FormatNumber(total_bunga_belum_bayar, 0)

                    ' If Now() >= DataGridView2.Item(9, DataGridView2.CurrentCell.RowIndex).Value Then

                    'DataGridView2.Item(3, mRow).Value = FormatNumber(bunga_perbulan, 0)
                    'Else

                    ' End If
                Else
                    
                End If



            End If
        Else
            If mCol = 6 Then
                MsgBox("Data angsuran yang sudah masuk tidak dapat dihapus", MsgBoxStyle.Critical, "Warning")
            End If
        End If



    End Sub


    Private Function check_urut_mark()
        Dim not_checked As Integer
        For i As Integer = 0 To DataGridView2.CurrentCell.RowIndex - 1
            If DataGridView2.Item(4, i).Value = False And DataGridView2.Item(10, i).Value = False Then
                not_checked = not_checked + 1
            End If
        Next
        If not_checked > 0 Then
            Return True
        End If
    End Function



    Public Sub insert_data_bayar(ByVal rowIndex As integer)
        open_conn()
        Dim colIndex As Integer
        colIndex = DataGridView2.CurrentCell.ColumnIndex
        ' rowIndex = DataGridView2.CurrentCell.RowIndex
        Dim status_lunas As Integer = 0

        If Replace(DataGridView2.Item(2, rowIndex).Value, ",", "") = 0 Or Replace(DataGridView2.Item(2, rowIndex).Value, ",", "") = "" Then
            MsgBox("Masukkan Bunga", MsgBoxStyle.Critical, "Information")
            Exit Sub
        End If

        If Replace(DataGridView2.Item(3, rowIndex).Value, ",", "") = 0 Or Replace(DataGridView2.Item(3, rowIndex).Value, ",", "") = "" Then
            MsgBox("Masukkan Pembayaran", MsgBoxStyle.Critical, "Information")
            Exit Sub
        End If


        Call insert_no_trans("BAYAR_PINJAMAN", Month(DataGridView2.Item(8, rowIndex).Value), Year(DataGridView2.Item(8, rowIndex).Value))
        Call select_control_no("BAYAR_PINJAMAN", "TRANS")
        no_bayar = no_master

        If insert_bayar = 1 Then
            Call insert_bayarpinjam(no_bayar, txt_nota.Text, Replace(txt_nilai.Text, ",", ""), DataGridView2.Item(8, rowIndex).Value, Replace(0, ",", ""), "INSERT", Replace(DataGridView2.Item(3, rowIndex).Value, ",", ""), DataGridView2.Item(9, rowIndex).Value, status_lunas)
            If param_sukses = True Then
                ' MsgBox("Data Was Saved", MsgBoxStyle.Information + MsgBoxStyle.OkOnly, "Save Success")
                update_no_trans(txt_tglbayar.Value, "BAYAR_PINJAMAN")
                'clean()
                DataGridView2.Item(4, rowIndex).Value = True
                'Dim DisplayNota As New NotaBayarKoperasi
                ''NoFakturJual = Trim(txt_nota_pinjam.Text)
                'With DisplayNota
                '    .Show()
                '    '  .MdiParent = MainMenu
                '    .WindowState = FormWindowState.Maximized
                'End With

                'pesan = MsgBox("Print Pembayaran?", MsgBoxStyle.Question + MsgBoxStyle.YesNo, "Konfirmasi")
                'If pesan = vbYes Then
                '    Dim R As New ReportDocument
                '    Dim pathfilereport As String
                '    pathfilereport = Application.StartupPath & "\Report\KartuBayar.rpt"
                '    R.Load(pathfilereport)
                '    R.Refresh()
                '    R.RecordSelectionFormula = "{view_kartu_bayar1.no_bayar} ='" & Trim(no_bayar) & "'"
                '    R.PrintToPrinter(1, False, 1, 1)
                '    update_printstatus(no_bayar)
                'End If
            End If
        ElseIf edit_bayar = 1 Then
            Call update_bayarpinjam(DataGridView2.Item(6, rowIndex).Value, txt_nota.Text, Replace(txt_nilai.Text, ",", ""), DataGridView2.Item(7, rowIndex).Value, Replace(0, ",", ""), "UPDATE", Replace(DataGridView2.Item(2, rowIndex).Value, ",", ""), status_lunas)
            If param_sukses = True Then
                'MsgBox("Data Was Updated", MsgBoxStyle.Information + MsgBoxStyle.OkOnly, "Save Success")
                'clean()
                DataGridView2.Item(4, rowIndex).Value = True
            End If
        End If
    End Sub

    Public Sub insert_data_lunas(ByVal rowIndex As Integer)
        open_conn()
        Dim colIndex As Integer
        Dim status_lunas As Integer

        status_lunas = 1

        colIndex = DataGridView2.CurrentCell.ColumnIndex
        ' rowIndex = DataGridView2.CurrentCell.RowIndex

        If Replace(DataGridView2.Item(2, rowIndex).Value, ",", "") = 0 Or Replace(DataGridView2.Item(2, rowIndex).Value, ",", "") = "" Then
            MsgBox("Masukkan Bunga", MsgBoxStyle.Critical, "Information")
            Exit Sub
        End If

        If Replace(DataGridView2.Item(3, rowIndex).Value, ",", "") = 0 Or Replace(DataGridView2.Item(3, rowIndex).Value, ",", "") = "" Then
            MsgBox("Masukkan Pembayaran", MsgBoxStyle.Critical, "Information")
            Exit Sub
        End If


        Call insert_no_trans("BAYAR_PINJAMAN", Month(DataGridView2.Item(8, rowIndex).Value), Year(DataGridView2.Item(8, rowIndex).Value))
        Call select_control_no("BAYAR_PINJAMAN", "TRANS")
        no_bayar = no_master

        If insert_bayar = 1 Then
            Call insert_bayarpinjam(no_bayar, txt_nota.Text, Replace(txt_nilai.Text, ",", ""), DataGridView2.Item(8, rowIndex).Value, Replace(0, ",", ""), "INSERT", Replace(DataGridView2.Item(3, rowIndex).Value, ",", ""), DataGridView2.Item(9, rowIndex).Value, status_lunas)
            If param_sukses = True Then
                ' MsgBox("Data Was Saved", MsgBoxStyle.Information + MsgBoxStyle.OkOnly, "Save Success")
                update_no_trans(txt_tglbayar.Value, "BAYAR_PINJAMAN")
                'clean()
                DataGridView2.Item(4, rowIndex).Value = True
                'Dim DisplayNota As New NotaBayarKoperasi
                ''NoFakturJual = Trim(txt_nota_pinjam.Text)
                'With DisplayNota
                '    .Show()
                '    '  .MdiParent = MainMenu
                '    .WindowState = FormWindowState.Maximized
                'End With

                'pesan = MsgBox("Print Pembayaran?", MsgBoxStyle.Question + MsgBoxStyle.YesNo, "Konfirmasi")
                'If pesan = vbYes Then
                '    Dim R As New ReportDocument
                '    Dim pathfilereport As String
                '    pathfilereport = Application.StartupPath & "\Report\KartuBayar.rpt"
                '    R.Load(pathfilereport)
                '    R.Refresh()
                '    R.RecordSelectionFormula = "{view_kartu_bayar1.no_bayar} ='" & Trim(no_bayar) & "'"
                '    R.PrintToPrinter(1, False, 1, 1)
                '    update_printstatus(no_bayar)
                'End If
            End If
        ElseIf edit_bayar = 1 Then
            Call update_bayarpinjam(DataGridView2.Item(6, rowIndex).Value, txt_nota.Text, Replace(txt_nilai.Text, ",", ""), DataGridView2.Item(7, rowIndex).Value, Replace(0, ",", ""), "UPDATE", Replace(DataGridView2.Item(2, rowIndex).Value, ",", ""), status_lunas)
            If param_sukses = True Then
                'MsgBox("Data Was Updated", MsgBoxStyle.Information + MsgBoxStyle.OkOnly, "Save Success")
                'clean()
                DataGridView2.Item(4, rowIndex).Value = True
            End If
        End If
    End Sub

    Private Sub DataGridView2_CellDoubleClick(sender As Object, e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView2.CellDoubleClick

    End Sub


    Private Sub DataGridView2_CellEndEdit(sender As Object, e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView2.CellEndEdit
        Dim colIndex, rowIndex As Integer
        Dim nomPinjaman, total_tunggak, sisa_pokok As Double
        colIndex = DataGridView2.CurrentCell.ColumnIndex
        rowIndex = DataGridView2.CurrentCell.RowIndex

        'If colIndex = 10 Then
        '    DataGridView2.Item(10, generalRowIndex).Value = False
        '    DataGridView2.Item(0, generalRowIndex).Value = Nothing
        '    DataGridView2.Item(8, generalRowIndex).Value = Nothing
        '    DataGridView2.Item(3, generalRowIndex).Value = Nothing
        'End If

        If colIndex = 2 Then
            nomPinjaman = Replace(txt_nominal.Text, ",", "") * DataGridView2.Item(2, rowIndex).Value / 100
            DataGridView2.Item(2, rowIndex).Value = FormatNumber(DataGridView2.Item(2, rowIndex).Value, 2)
            DataGridView2.Item(3, rowIndex).Value = FormatNumber(nomPinjaman, 2)
        End If
        If colIndex = 3 Then
            DataGridView2.Item(3, rowIndex).Value = FormatNumber(DataGridView2.Item(3, rowIndex).Value, 0)
        End If
        For i As Integer = 0 To DataGridView2.Rows.Count - 1
            If DataGridView2.Item(4, i).Value = False Then
                total_tunggak = total_tunggak + Replace(DataGridView2.Item(3, i).Value, ",", "")
            End If
        Next
        sisa_pokok = Replace(txt_sisalunas.Text, ",", "")
        txt_belum_bayar.Text = FormatNumber(total_tunggak, 2)
        txt_lunas.Text = FormatNumber(sisa_pokok + total_tunggak, 2)

    End Sub

    Private Sub TabInput_Click(sender As System.Object, e As System.EventArgs) Handles TabInput.Click

    End Sub

    Private Sub Button2_Click(sender As System.Object, e As System.EventArgs) Handles Button2.Click
        edit_bayar = 1
        insert_bayar = 0
        If getTemplateAkses(username, "MN_BAYAR_PINJAMAN_EDIT") <> True Then
            DataGridView2.Columns(2).ReadOnly = True
        Else
            DataGridView2.Columns(2).ReadOnly = False
        End If


    End Sub

    Private Sub DataGridView2_CellPainting(sender As Object, e As System.Windows.Forms.DataGridViewCellPaintingEventArgs)

    End Sub

    Private Sub btn_help_Click(sender As System.Object, e As System.EventArgs) Handles btn_help.Click
        Dim DisplayNota As New NotaKoperasi
        NoFakturJual = Trim(txt_nota_pinjam.Text)
        With DisplayNota
            .Show()
            '  .MdiParent = MainMenu
            .WindowState = FormWindowState.Maximized
        End With
        'open_conn()
        'Dim R As New ReportDocument
        'Dim pathfilereport As String
        'pathfilereport = Application.StartupPath & "\Report\KartuPinjam.rpt"
        'R.Load(pathfilereport)
        'R.Refresh()
        'R.RecordSelectionFormula = "{trn_pinjam1.no_pinjam} ='" & Trim(txt_nota_pinjam.Text) & "'"
        'R.PrintToPrinter(1, False, 1, 1)
    End Sub

    Private Sub Button5_Click(sender As System.Object, e As System.EventArgs) Handles Button5.Click
        If Application.OpenForms().OfType(Of frmsetkode).Any Then
            frmsetkode.Activate()
        Else
            frmsetkode.Show()
        End If
    End Sub

    

    Private Sub Button6_Click(sender As System.Object, e As System.EventArgs) Handles Button6.Click, btn_keluar.Click
        'Me.Close()
        PanelControl3.Visible = False
        enableMain()
    End Sub

    Private Sub enableMain()
        GridControl.Enabled = True
        PanelControl5.Enabled = True
    End Sub

    Private Sub disableMain()
        GridControl.Enabled = False
        PanelControl5.Enabled = False
    End Sub

    Private Sub DataGridView3_KeyDown(sender As Object, e As System.Windows.Forms.KeyEventArgs) Handles DataGridView3.KeyDown
        open_conn()
        IndexRowDg = DataGridView3.CurrentCell.RowIndex
        Dim rows As Integer

        If e.KeyCode = Keys.Delete Then
            pesan = MessageBox.Show("Data ingin di hapus?", "Konfirmasi", MessageBoxButtons.YesNo)
            If pesan = vbYes Then
                DataGridView3.Rows.RemoveAt(IndexRowDg)
            End If
        End If
    End Sub

    Private Sub GridList_Customer_DoubleClick(sender As Object, e As System.EventArgs) Handles GridList_Customer.DoubleClick
        insert = 0
        edit = 1
        btn_delete.Enabled = True
        txt_date.Enabled = False
        detail(GridList_Customer.GetRowCellValue(GridList_Customer.FocusedRowHandle, "no_pinjam"))
        'TabControl1.SelectedTab = TabInput
        PanelControl3.Visible = True
    End Sub

    Private Sub DataGridView2_CellValueChanged(sender As Object, e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView2.CellValueChanged
        'If DataGridView2.Rows.Count > 0 Then
        '    Dim colIndex, rowIndex As Integer
        '    Dim nomPinjaman, total_tunggak, sisa_pokok As Double
        '    colIndex = DataGridView2.CurrentCell.ColumnIndex
        '    rowIndex = DataGridView2.CurrentCell.RowIndex
        '    If colIndex = 2 Then
        '        nomPinjaman = Replace(txt_nominal.Text, ",", "") * DataGridView2.Item(2, rowIndex).Value / 100
        '        DataGridView2.Item(2, rowIndex).Value = FormatNumber(DataGridView2.Item(2, rowIndex).Value, 2)
        '        DataGridView2.Item(3, rowIndex).Value = FormatNumber(nomPinjaman, 2)
        '    End If
        '    For i As Integer = 0 To DataGridView2.Rows.Count - 1
        '        If DataGridView2.Item(4, i).Value = False Then
        '            total_tunggak = total_tunggak + Replace(DataGridView2.Item(3, i).Value, ",", "")
        '        End If
        '    Next
        '    sisa_pokok = Replace(txt_sisalunas.Text, ",", "")
        '    txt_belum_bayar.Text = FormatNumber(total_tunggak, 2)
        '    txt_lunas.Text = FormatNumber(sisa_pokok + total_tunggak, 2)
        'End If
    End Sub

    Private Sub SimpleButton3_Click(sender As System.Object, e As System.EventArgs) Handles SimpleButton3.Click
        PanelControl3.Visible = True
        disableMain()
        insert = 1
    End Sub

    Private Sub Button8_Click(sender As System.Object, e As System.EventArgs) Handles Button8.Click
        PanelControl1.Visible = False
        enableMain()
        view_data_new()
    End Sub

    Private Sub SimpleButton4_Click(sender As System.Object, e As System.EventArgs) Handles SimpleButton4.Click
        Me.Close()
    End Sub

    Private Sub SimpleButton8_Click(sender As System.Object, e As System.EventArgs) Handles SimpleButton8.Click
        Try
            SplashScreenManager.ShowForm(Me, GetType(WaitForm1), True, True, False)
            SplashScreenManager.Default.SetWaitFormCaption("Please Wait")
            SplashScreenManager.Default.SetWaitFormDescription("Refresh Data . . .")
            Dim dtcust As DataTable
            dtcust = select_pinjam("", 0)
            GridControl.DataSource = dtcust
            GridList_Customer.RefreshData()
        Finally
            SplashScreenManager.CloseForm(False)
        End Try
    End Sub

    Private Sub Button9_Click(sender As System.Object, e As System.EventArgs) Handles Button9.Click
        For i As Integer = 0 To DataGridView2.Rows.Count - 1
            If DataGridView2.Item(4, i).Value = False And DataGridView2.Item(10, i).Value = True And DataGridView2.Item(0, i).Value <> Nothing And DataGridView2.Item(3, i).Value <> Nothing Then
                insert_data_bayar(i)
            End If
        Next
        If param_sukses = True Then
            Dim info2 As AlertInfo = New AlertInfo("Berhasil Simpan", "Pembayaran Berhasil")
            alertControl_success.Show(Me, info2)
        End If

    End Sub

    Private Sub TextBox1_TextChanged(sender As System.Object, e As System.EventArgs) Handles TextBox1.TextChanged

    End Sub

    Private Sub SimpleButton1_Click(sender As Object, e As System.EventArgs) Handles SimpleButton1.Click
        PanelControl1.Visible = True
        disableMain()
        detail_bayar(GridList_Customer.GetRowCellValue(GridList_Customer.FocusedRowHandle, "no_pinjam"))
        PanelControl1.Visible = True
    End Sub

    Private Sub Button3_Click(sender As System.Object, e As System.EventArgs) Handles Button3.Click
        For i As Integer = 0 To DataGridView2.Rows.Count - 1
            If DataGridView2.Item(4, i).Value = False And DataGridView2.Item(10, i).Value = True And DataGridView2.Item(0, i).Value <> Nothing And DataGridView2.Item(3, i).Value <> Nothing Then
                insert_data_lunas(i)
            End If
        Next
        If param_sukses = True Then
            Dim info2 As AlertInfo = New AlertInfo("Berhasil Simpan", "Pembayaran Berhasil")
            alertControl_success.Show(Me, info2)
        End If
    End Sub
End Class