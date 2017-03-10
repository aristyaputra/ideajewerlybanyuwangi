﻿Imports MySql.Data.MySqlClient
Imports DevExpress.XtraBars.Alerter

Module mdlSimpanPinjam_Delete
    Dim SqlDelete As String
    Dim cmd_sqldelete As New MySqlCommand
    Dim oTransaction As MySqlTransaction
    Dim var_photo_replace As String


    Public Sub delete_pinjam(ByVal var_no_pinjam As String, ByVal var_no_jual As String, ByVal var_id_item As String, ByVal var_item_name As String, ByVal var_nominal As Double, ByVal var_date_trn As Date, ByVal var_flag_surat As Integer, ByVal berat As Double, ByVal trnid As String, ByVal var_created_user As String, ByVal var_created_date As Date, ByVal var_modified_user As String, ByVal var_modified_date As Date, ByVal var_detail As Integer, ByVal var_no_asc As Double, ByVal var_id_item_detail As String, ByVal var_weight As Double)
        oTransaction = conn.BeginTransaction(IsolationLevel.ReadCommitted)
        With cmd_sqldelete
            .Connection = conn
            .CommandText = "call sp_pinjaman ('" & var_no_pinjam & "','" & var_no_jual & "','" & var_id_item & "','" & var_item_name & "'," & var_nominal & ",'" & Format(var_date_trn, "yyyy-MM-dd") & "'," & var_flag_surat & "," & berat & ",'DELETE','" & Format(var_created_date, "yyyy-MM-dd hh:mm:ss") & "','" & var_created_user & "','" & Format(var_modified_date, "yyyy-MM-dd hh:mm:ss") & "','" & var_modified_user & "'," & var_detail & "," & var_no_asc & ",'" & var_id_item_detail & "'," & var_weight & ",0,"",0)"
            .CommandType = CommandType.Text
            .Transaction = oTransaction
        End With
        Try
            cmd_sqldelete.ExecuteNonQuery()
            oTransaction.Commit()
            param_sukses = True
        Catch ex As Exception
            MsgBox(ex.Message)
            oTransaction.Rollback()
            param_sukses = False
        End Try
    End Sub

    Public Sub delete_bayarpinjam(ByVal var_no_bayar As String, ByVal var_no_pinjam As String, ByVal var_saldo_pinjaman As Double, ByVal var_date_trn As Date, ByVal var_nominal_bayar As Double, ByVal TRANSID As String)
        oTransaction = conn.BeginTransaction(IsolationLevel.ReadCommitted)
        With cmd_sqldelete
            .Connection = conn
            .CommandText = "call sp_bayar_pinjaman ('" & var_no_bayar & "','" & var_no_pinjam & "'," & var_saldo_pinjaman & ",'" & Format(var_date_trn, "yyyy-MM-dd") & "'," & var_nominal_bayar & ",'DELETE',0)"
            .CommandType = CommandType.Text
            .Transaction = oTransaction
        End With
        Try
            cmd_sqldelete.ExecuteNonQuery()
            oTransaction.Commit()
            param_sukses = True
        Catch ex As Exception
            MsgBox(ex.Message)
            oTransaction.Rollback()
            param_sukses = False
        End Try
    End Sub

End Module
