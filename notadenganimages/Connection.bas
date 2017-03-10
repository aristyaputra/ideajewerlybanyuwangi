Attribute VB_Name = "Connection"
Public cn As ADODB.Connection
Public mSQL As String
Public ConnString As String
Public db_name As String
Public db_server As String
Public db_port As String
Public db_user As String
Public db_pass As String
Public conn As New ADODB.Connection



Public Sub koneksiMySQL()
If conn.State = adStateOpen Then
  conn.Close
End If
Set conn = Nothing
db_server = "localhost" 'ganti jika server anda ada di komputer lain

db_port = "3309"    'default port is 3306
db_user = "root"    'sebaiknya pakai username lain.
db_pass = "L1v326110711"
'db_name = ""
'/buat connection string
db_name = "smarterp_tokoemas"
ConnString = "DRIVER={MySQL ODBC 5.1 Driver};SERVER=" & db_server & ";DATABASE=" & db_name & ";UID=" & db_user & ";PWD=" & db_pass & ";PORT=" & db_port & ";OPTION=3"
'/buka koneksi
With conn
    .ConnectionString = ConnString
    .CursorLocation = adUseClient
    .Open
End With
End Sub
