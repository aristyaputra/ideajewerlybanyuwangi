Imports MySql.Data.MySqlClient
Imports DevExpress.XtraBars.Alerter

Module mdlCucian_Insert

    Dim SqlInsert As String
    Dim cmd_sqlinsert As New MySqlCommand
    Dim oTransaction As MySqlTransaction
    Dim var_photo_replace As String

   


    Public Sub insert_stock_cucian(ByVal var_no_purchase As String, ByVal var_date_trn As Date, ByVal var_id_item As String, ByVal var_qty As Integer, ByVal var_id_unit As String, ByVal var_price As Double, ByVal transid As String)
        oTransaction = conn.BeginTransaction(IsolationLevel.ReadCommitted)

        With cmd_sqlinsert
            .Connection = conn
            .CommandText = "call sp_cucianinstok ('" & var_no_purchase & "','" & Format(var_date_trn, "yyyy-MM-dd") & "','" & _
                                              var_id_item & "'," & var_qty & ",'" & var_id_unit & "'," & var_price & ",'INSERT')"
            .CommandType = CommandType.Text
            .Transaction = oTransaction
        End With
        Try
            cmd_sqlinsert.ExecuteNonQuery()
            oTransaction.Commit()
            param_sukses = True
            'If param_sukses = True Then
            '    With cmd_sqlinsert
            '        .Connection = conn
            '        .CommandText = "update control_no_master set nourut = (select func_update_nomor('MASTER CUSTOMER')) where form = 'MASTER CUSTOMER'"
            '        .CommandType = CommandType.Text
            '    End With
            '    cmd_sqlinsert.ExecuteNonQuery()
            'End If
        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            oTransaction.Rollback()
            param_sukses = False
        End Try
    End Sub



End Module
