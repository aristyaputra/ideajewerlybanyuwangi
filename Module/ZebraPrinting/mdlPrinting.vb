Imports 

<StructLayout(LayoutKind.Sequential, CharSet:=CharSet.Ansi)> _
Public Class DOCINFOA
    <MarshalAs(UnmanagedType.LPStr)> _
    Public pDocName As String
    <MarshalAs(UnmanagedType.LPStr)> _
    Public pOutputFile As String
    <MarshalAs(UnmanagedType.LPStr)> _
    Public pDataType As String
End Class
<DllImport("winspool.Drv", EntryPoint:="OpenPrinterA", SetLastError:=True, CharSet:=CharSet.Ansi, ExactSpelling:=True, CallingConvention:=CallingConvention.StdCall)> _
Public Shared Function OpenPrinter(<MarshalAs(UnmanagedType.LPStr)> szPrinter As String, ByRef hPrinter As IntPtr, pd As IntPtr) As Boolean
End Function

<DllImport("winspool.Drv", EntryPoint:="ClosePrinter", SetLastError:=True, ExactSpelling:=True, CallingConvention:=CallingConvention.StdCall)> _
Public Shared Function ClosePrinter(hPrinter As IntPtr) As Boolean
End Function

<DllImport("winspool.Drv", EntryPoint:="StartDocPrinterA", SetLastError:=True, CharSet:=CharSet.Ansi, ExactSpelling:=True, CallingConvention:=CallingConvention.StdCall)> _
Public Shared Function StartDocPrinter(hPrinter As IntPtr, level As Int32, <[In](), MarshalAs(UnmanagedType.LPStruct)> di As DOCINFOA) As Boolean
End Function

<DllImport("winspool.Drv", EntryPoint:="EndDocPrinter", SetLastError:=True, ExactSpelling:=True, CallingConvention:=CallingConvention.StdCall)> _
Public Shared Function EndDocPrinter(hPrinter As IntPtr) As Boolean
End Function

<DllImport("winspool.Drv", EntryPoint:="StartPagePrinter", SetLastError:=True, ExactSpelling:=True, CallingConvention:=CallingConvention.StdCall)> _
Public Shared Function StartPagePrinter(hPrinter As IntPtr) As Boolean
End Function

<DllImport("winspool.Drv", EntryPoint:="EndPagePrinter", SetLastError:=True, ExactSpelling:=True, CallingConvention:=CallingConvention.StdCall)> _
Public Shared Function EndPagePrinter(hPrinter As IntPtr) As Boolean
End Function

<DllImport("winspool.Drv", EntryPoint:="WritePrinter", SetLastError:=True, ExactSpelling:=True, CallingConvention:=CallingConvention.StdCall)> _
Public Shared Function WritePrinter(hPrinter As IntPtr, pBytes As IntPtr, dwCount As Int32, ByRef dwWritten As Int32) As Boolean
End Function


Public Shared Function SendStringToPrinter(printerName As [String], dataString As [String]) As Boolean
    Dim dwCount As Integer = (dataString.Length + 1) * Marshal.SystemMaxDBCSCharSize

    ' Assume that the printer is expecting ANSI text, and then convert
    ' the string to ANSI text.
    Dim pBytes As IntPtr = Marshal.StringToCoTaskMemAnsi(dataString)
    ' Send the converted ANSI string to the printer.
    SendPBytesToPrinter(printerName, pBytes, dwCount)
    Marshal.FreeCoTaskMem(pBytes)
    Return True
End Function


Public Shared Function SendPBytesToPrinter(szPrinterName As [String], pBytes As IntPtr, dwCount As Int32) As Boolean
    Dim dwError As Int32 = 0, dwWritten As Int32 = 0
    Dim hPrinter As New IntPtr(0)
    Dim di As New DOCINFOA()
    Dim bSuccess As Boolean = False
    ' Assume failure unless you specifically succeed.
    di.pDocName = "My C#.NET RAW Document"
    di.pDataType = "RAW"

    ' Open the printer.
    If OpenPrinter(szPrinterName.Normalize(), hPrinter, IntPtr.Zero) Then
        ' Start a document.
        If StartDocPrinter(hPrinter, 1, di) Then
            ' Start a page.
            If StartPagePrinter(hPrinter) Then
                ' Write your bytes.
                bSuccess = WritePrinter(hPrinter, pBytes, dwCount, dwWritten)
                EndPagePrinter(hPrinter)
            End If
            EndDocPrinter(hPrinter)
        End If
        ClosePrinter(hPrinter)
    End If

    If bSuccess = False Then
        'TODO: log error code
        dwError = Marshal.GetLastWin32Error()
    End If
    Return bSuccess
End Function

'=======================================================
'Service provided by Telerik (www.telerik.com)
'Conversion powered by NRefactory.
'Twitter: @telerik
'Facebook: facebook.com/telerik
'=======================================================
