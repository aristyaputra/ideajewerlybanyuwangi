Imports MySql.Data.MySqlClient
Imports DevExpress.XtraBars.Alerter

Module mdlitem_View
    Dim SqlSelect As String
    Dim cmd_sqlselect As New MySqlCommand
    Dim mysql_select As MySqlDataReader
    Dim mysql_adapter As New MySqlDataAdapter
    Dim mysql_reader As MySqlDataReader

    Public Function select_jenis2(ByVal id_item As String) As DataTable
        Dim DT As New DataTable

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select * from mst_itemjenis a inner join mst_item b on b.id_jenis = a.mst_itemjenis_id where b.id_item = '" & id_item & "'"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT

        Catch ex As Exception
            Return DT
        End Try

    End Function

    Public Function select_temp_print_barcode() As DataTable
        Dim DT As New DataTable

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select * from temp_print_barcode"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT

        Catch ex As Exception
            Return DT
        End Try

    End Function

    Public Function select_category2(ByVal id_item As String) As DataTable
        Dim DT As New DataTable

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select * from mst_itemcat a inner join mst_item b on b.id_category = a.mst_itemcat_id where b.id_item = '" & id_item & "'"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT

        Catch ex As Exception
            Return DT
        End Try

    End Function

    Public Function getFieldName(ByVal table As String)
        Dim DT As New DataTable

        Try
            With cmd_sqlselect
                .Connection = conn
                If table = "mst_item" Then
                    .CommandText = "show columns from " & table & " where (`Null` = 'YES') and (`key` = '' or (`Field` in ('id_jenis','id_category','id_brand'))) and `Field` not in ('blob_image','min_qty_unit')"
                Else
                    .CommandText = "show columns from " & table & " where (`Null` = 'YES') and `key` = ''"
                End If

                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return DT
        End Try
    End Function

    Public Function GetCOGSDefAcc() As String
        Dim DT As New DataTable

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select id_account from i_set_account_def where acc_parameter ='acc_def_cogs'"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT.Rows(0).Item(0)

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return DT.Rows(0).Item(0)
        End Try

    End Function

    Public Function GetInventoryDefAcc() As String
        Dim DT As New DataTable

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select id_account from i_set_account_def where acc_parameter ='acc_def_inventory'"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT.Rows(0).Item(0)

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return DT.Rows(0).Item(0)
        End Try

    End Function

    Public Function select_def_accitem() As String
        Dim DT As New DataTable

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select case when id_account is null then '' else id_account end from i_set_account_def where acc_parameter='acc_def_inventory'"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT.Rows(0).Item(0)

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return ""
        End Try

    End Function

    Public Function select_def_accitemcogs() As String
        Dim DT As New DataTable

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select case when id_account is null then '' else id_account end from i_set_account_def where acc_parameter='acc_def_cogs'"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT.Rows(0).Item(0)

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return ""
        End Try

    End Function

    Public Function cek_itemjenis_id(ByVal criteria As String) As Integer
        Dim DT As New DataTable

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select count(mst_itemjenis_id) from mst_itemjenis where mst_itemjenis_nm='" & criteria & "'"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT.Rows(0).Item(0)

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return 0
        End Try

    End Function

    Public Function cek_itembrand_id(ByVal criteria As String) As Integer
        Dim DT As New DataTable

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select count(mst_itembrand_id) from mst_itembrand where mst_itembrand_nm='" & criteria & "'"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT.Rows(0).Item(0)

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return 0
        End Try

    End Function

    Public Function cek_itemjenis_nm(ByVal criteria As String) As Integer
        Dim DT As New DataTable

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select count(mst_itemjenis_nm) from mst_itemjenis where mst_itemjenis_id='" & criteria & "'"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT.Rows(0).Item(0)

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return 0
        End Try

    End Function

    Public Function cek_itembrand_nm(ByVal criteria As String) As Integer
        Dim DT As New DataTable

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select count(mst_itembrand_nm) from mst_itembrand where mst_itembrand_id='" & criteria & "'"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT.Rows(0).Item(0)

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return 0
        End Try

    End Function

    Public Function cek_itemcat_id(ByVal criteria As String) As Integer
        Dim DT As New DataTable

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select count(mst_itemcat_id) from mst_itemcat where mst_itemcat_nm='" & criteria & "'"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT.Rows(0).Item(0)

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return 0
        End Try

    End Function

    Public Function cek_itemcat_nm(ByVal criteria As String) As Integer
        Dim DT As New DataTable

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select count(mst_itemcat_nm) from mst_itemcat where mst_itemcat_id='" & criteria & "'"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT.Rows(0).Item(0)

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return 0
        End Try

    End Function

    Public Function select_itemjenis_id(ByVal criteria As String) As String
        Dim DT As New DataTable

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select case when mst_itemjenis_id is null then 'NA' else mst_itemjenis_id end from mst_itemjenis where mst_itemjenis_nm='" & criteria & "' limit 1"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT.Rows(0).Item(0)

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return "NA"
        End Try

    End Function

    Public Function select_itembrand_id(ByVal criteria As String) As String
        Dim DT As New DataTable

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select case when mst_itembrand_id is null then 'NA' else mst_itembrand_id end from mst_itembrand where mst_itembrand_nm='" & criteria & "' limit 1"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT.Rows(0).Item(0)

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return "NA"
        End Try

    End Function

    Public Function select_itemjenis_nm(ByVal criteria As String) As String
        Dim DT As New DataTable

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select case when mst_itemjenis_nm is null then 'NA' else mst_itemjenis_nm end from mst_itemjenis where mst_itemjenis_id='" & criteria & "' limit 1"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT.Rows(0).Item(0)

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return "NA"
        End Try

    End Function

    Public Function select_itemcat_id(ByVal criteria As String) As String
        Dim DT As New DataTable

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select case when mst_itemcat_id is null then 'NA' else mst_itemcat_id end from mst_itemcat where mst_itemcat_nm='" & criteria & "' limit 1"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT.Rows(0).Item(0)

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return "NA"
        End Try

    End Function

    Public Function select_itemcat_nm(ByVal criteria As String) As String
        Dim DT As New DataTable

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select case when mst_itemcat_nm is null then 'NA' else mst_itemcat_nm end from mst_itemcat where mst_itemcat_id='" & criteria & "' limit 1"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT.Rows(0).Item(0)

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return "NA"
        End Try

    End Function


    Public Function select_item(ByVal field As String, ByVal criteria As String) As DataTable
        Dim DT As New DataTable
        If field = "ID" Then
            field = "id_item"
        ElseIf field = "Name" Then
            field = "item_name"
        ElseIf field = "Barcode" Then
            field = "id_barcode"
        ElseIf field = "Berat" Then
            field = "weight"
        ElseIf field = "Kadar" Then
            field = "kadar"
        End If

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select * from view_list_item where " & field & " like '%" & criteria & "%'"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return DT
        End Try

    End Function

    Public Function select_detail_po(ByVal criteria As String) As DataTable
        Dim DT As New DataTable


        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select * from view_item_po_detail where no_purchase_order = '" & criteria & "'"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return DT
        End Try

    End Function

    Public Function select_detail_directpurch(ByVal criteria As String) As DataTable
        Dim DT As New DataTable


        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select * from view_item_directpurch_detail where no_purchase = '" & criteria & "'"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return DT
        End Try

    End Function

    Public Function select_item_all(ByVal field As String, ByVal criteria As String, ByVal field2 As String, ByVal criteria2 As String) As DataTable
        Dim DT As New DataTable
        If field = "ID" Then
            field = "id_item"
        ElseIf field = "Name" Then
            field = "item_name"
        ElseIf field = "Barcode" Then
            field = "id_barcode"
        ElseIf field = "Berat" Then
            field = "weight"
        ElseIf field = "Kadar" Then
            field = "kadar"
        End If

        If field2 = "ID" Then
            field2 = "id_item"
        ElseIf field2 = "Name" Then
            field2 = "item_name"
        ElseIf field2 = "Barcode" Then
            field2 = "id_barcode"
        ElseIf field2 = "Berat" Then
            field2 = "weight"
        ElseIf field2 = "Kadar" Then
            field2 = "kadar"
        End If

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select * from view_list_item where " & field & " like '%" & criteria & "%' and " & field2 & " like '%" & criteria2 & "%'"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return DT
        End Try

    End Function

    Public Function select_item_stok_aktif(ByVal field As String, ByVal criteria As String, ByVal field2 As String, ByVal criteria2 As String) As DataTable
        Dim DT As New DataTable
        If field = "ID" Then
            field = "id_item"
        ElseIf field = "Name" Then
            field = "item_name"
        ElseIf field = "Barcode" Then
            field = "id_barcode"
        ElseIf field = "Berat" Then
            field = "weight"
        ElseIf field = "Kadar" Then
            field = "kadar"
        End If

        If field2 = "ID" Then
            field2 = "id_item"
        ElseIf field2 = "Name" Then
            field2 = "item_name"
        ElseIf field2 = "Barcode" Then
            field2 = "id_barcode"
        ElseIf field2 = "Berat" Then
            field2 = "weight"
        ElseIf field2 = "Kadar" Then
            field2 = "kadar"
        End If

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select * from view_list_item_stokaktif where " & field & " like '%" & criteria & "%' and " & field2 & " like '%" & criteria2 & "%'"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return DT
        End Try

    End Function

    Public Function select_item2(ByVal field As String, ByVal criteria As String) As DataTable
        Dim DT As New DataTable
        If field = "ID Barang / Service" Then
            field = "id_item"
        ElseIf field = "Nama Barang / Service" Then
            field = "item_name"
        ElseIf field = "ID Barcode" Then
            field = "id_barcode"
        End If

        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select * from view_list_item where " & field & " = '" & criteria & "' limit 1"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return DT
        End Try

    End Function

    Public Function select_item_disc(ByVal id_item As String) As DataTable
        Dim DT As New DataTable
        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "select * from view_item_disc where id_item = '" & id_item & "'"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return DT
        End Try

    End Function

    Public Function brand_barang(ByVal var_criteria As String, ByVal detail As Integer) As DataTable
        Dim DT As New DataTable
        Try
            With cmd_sqlselect
                .Connection = conn
                .CommandText = "call select_itembrand('" & var_criteria & "'," & detail & ")"
                .CommandType = CommandType.Text
            End With
            mysql_adapter.SelectCommand = cmd_sqlselect
            mysql_adapter.Fill(DT)
            Return DT

        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            Return DT
        End Try
    End Function

End Module
