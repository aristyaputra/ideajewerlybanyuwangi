﻿Imports MySql.Data.MySqlClient
Imports DevExpress.XtraBars.Alerter

Module mdlPenerimaanKas_Delete
    Dim SqlDelete As String
    Dim cmd_sqldelete As New MySqlCommand
    Dim oTransaction As MySqlTransaction
    Dim var_photo_replace As String

    Public Sub delete_ReceiptMoney(ByVal var_cashbank_no As String, ByVal var_cash_account As String, ByVal var_date_trn As Date, ByVal var_total As Double, ByVal var_notes As String, ByVal var_flag_trans As String, ByVal var_created_user As String, ByVal var_created_date As Date, ByVal var_modified_user As String, ByVal var_modified_date As Date, ByVal var_id_account As String, ByVal var_notes_detail As String, ByVal var_amount As Double, ByVal var_detail As Integer, ByVal varloop As Integer, ByVal var_nobukti As String)

        oTransaction = conn.BeginTransaction(IsolationLevel.ReadCommitted)

        With cmd_sqldelete
            .Connection = conn
            .CommandText = "call sp_cash_bank ('" & var_cashbank_no & "','" & var_cash_account & "','" & Format(var_date_trn, "yyyy-MM-dd") & "'," & var_total & ",'" & var_notes & "','" & var_flag_trans & "','" & var_created_user & "','" & Format(var_created_date, "yyyy-MM-dd") & "','" & var_modified_user & "','" & Format(var_modified_date, "yyyy-MM-dd") & "','" & var_id_account & "','" & var_notes_detail & "'," & var_amount & "," & var_detail & "," & varloop & ",'DELETE','" & var_nobukti & "','IDR',1)"
            .CommandType = CommandType.Text
            .Transaction = oTransaction
        End With
        Try
            cmd_sqldelete.ExecuteNonQuery()
            oTransaction.Commit()
            param_sukses = True
        Catch ex As Exception
            Dim info As AlertInfo = New AlertInfo("Error", ex.Message)
            alertControl_error.Show(MainMenu, info)
            oTransaction.Rollback()
            param_sukses = False
        End Try
    End Sub

End Module