<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmsetmarketing
    Inherits DevComponents.DotNetBar.Metro.MetroForm

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim DataGridViewCellStyle1 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle2 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle3 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle4 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmsetmarketing))
        Me.btn_prev = New System.Windows.Forms.Button()
        Me.btn_next = New System.Windows.Forms.Button()
        Me.dg_marketing = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn2 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.dg_employee = New System.Windows.Forms.DataGridView()
        Me.colkodejenis = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.coljenis = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.jabatan = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Departemen = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.GroupControl3 = New DevExpress.XtraEditors.GroupControl()
        Me.Panel2 = New System.Windows.Forms.Panel()
        Me.btn_keluar = New DevExpress.XtraEditors.SimpleButton()
        Me.GroupControl1 = New DevExpress.XtraEditors.GroupControl()
        CType(Me.dg_marketing, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.dg_employee, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GroupControl3, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupControl3.SuspendLayout()
        Me.Panel2.SuspendLayout()
        CType(Me.GroupControl1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupControl1.SuspendLayout()
        Me.SuspendLayout()
        '
        'btn_prev
        '
        Me.btn_prev.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btn_prev.BackColor = System.Drawing.Color.WhiteSmoke
        Me.btn_prev.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.btn_prev.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btn_prev.Image = Global.SMARTACCOUNTING.My.Resources.Resources.Previous_24x24
        Me.btn_prev.Location = New System.Drawing.Point(575, 205)
        Me.btn_prev.Name = "btn_prev"
        Me.btn_prev.Size = New System.Drawing.Size(49, 34)
        Me.btn_prev.TabIndex = 265
        Me.btn_prev.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btn_prev.UseVisualStyleBackColor = False
        '
        'btn_next
        '
        Me.btn_next.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btn_next.BackColor = System.Drawing.Color.WhiteSmoke
        Me.btn_next.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.btn_next.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btn_next.Image = Global.SMARTACCOUNTING.My.Resources.Resources.Next_24x24
        Me.btn_next.Location = New System.Drawing.Point(575, 165)
        Me.btn_next.Name = "btn_next"
        Me.btn_next.Size = New System.Drawing.Size(49, 34)
        Me.btn_next.TabIndex = 264
        Me.btn_next.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btn_next.UseVisualStyleBackColor = False
        '
        'dg_marketing
        '
        Me.dg_marketing.AllowUserToAddRows = False
        Me.dg_marketing.AllowUserToDeleteRows = False
        Me.dg_marketing.AllowUserToOrderColumns = True
        Me.dg_marketing.BackgroundColor = System.Drawing.Color.Gainsboro
        Me.dg_marketing.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.[Single]
        DataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle1.BackColor = System.Drawing.Color.CornflowerBlue
        DataGridViewCellStyle1.Font = New System.Drawing.Font("Trebuchet MS", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle1.ForeColor = System.Drawing.Color.White
        DataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.dg_marketing.ColumnHeadersDefaultCellStyle = DataGridViewCellStyle1
        Me.dg_marketing.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dg_marketing.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn2})
        Me.dg_marketing.Dock = System.Windows.Forms.DockStyle.Fill
        Me.dg_marketing.Location = New System.Drawing.Point(2, 21)
        Me.dg_marketing.Name = "dg_marketing"
        Me.dg_marketing.ReadOnly = True
        Me.dg_marketing.RowHeadersVisible = False
        Me.dg_marketing.Size = New System.Drawing.Size(372, 581)
        Me.dg_marketing.TabIndex = 9
        '
        'DataGridViewTextBoxColumn1
        '
        DataGridViewCellStyle2.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.DataGridViewTextBoxColumn1.DefaultCellStyle = DataGridViewCellStyle2
        Me.DataGridViewTextBoxColumn1.HeaderText = "Kode"
        Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
        Me.DataGridViewTextBoxColumn1.ReadOnly = True
        Me.DataGridViewTextBoxColumn1.Width = 125
        '
        'DataGridViewTextBoxColumn2
        '
        Me.DataGridViewTextBoxColumn2.HeaderText = "Nama"
        Me.DataGridViewTextBoxColumn2.Name = "DataGridViewTextBoxColumn2"
        Me.DataGridViewTextBoxColumn2.ReadOnly = True
        Me.DataGridViewTextBoxColumn2.Width = 240
        '
        'dg_employee
        '
        Me.dg_employee.AllowUserToAddRows = False
        Me.dg_employee.AllowUserToDeleteRows = False
        Me.dg_employee.AllowUserToOrderColumns = True
        Me.dg_employee.BackgroundColor = System.Drawing.Color.Gainsboro
        Me.dg_employee.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.[Single]
        DataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle3.BackColor = System.Drawing.Color.CornflowerBlue
        DataGridViewCellStyle3.Font = New System.Drawing.Font("Trebuchet MS", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle3.ForeColor = System.Drawing.Color.White
        DataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.dg_employee.ColumnHeadersDefaultCellStyle = DataGridViewCellStyle3
        Me.dg_employee.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dg_employee.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.colkodejenis, Me.coljenis, Me.jabatan, Me.Departemen})
        Me.dg_employee.Dock = System.Windows.Forms.DockStyle.Fill
        Me.dg_employee.Location = New System.Drawing.Point(2, 21)
        Me.dg_employee.Name = "dg_employee"
        Me.dg_employee.ReadOnly = True
        Me.dg_employee.RowHeadersVisible = False
        Me.dg_employee.Size = New System.Drawing.Size(552, 581)
        Me.dg_employee.TabIndex = 9
        '
        'colkodejenis
        '
        DataGridViewCellStyle4.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.colkodejenis.DefaultCellStyle = DataGridViewCellStyle4
        Me.colkodejenis.HeaderText = "Kode"
        Me.colkodejenis.Name = "colkodejenis"
        Me.colkodejenis.ReadOnly = True
        Me.colkodejenis.Width = 125
        '
        'coljenis
        '
        Me.coljenis.HeaderText = "Nama"
        Me.coljenis.Name = "coljenis"
        Me.coljenis.ReadOnly = True
        Me.coljenis.Width = 240
        '
        'jabatan
        '
        Me.jabatan.HeaderText = "Jabatan"
        Me.jabatan.Name = "jabatan"
        Me.jabatan.ReadOnly = True
        Me.jabatan.Width = 160
        '
        'Departemen
        '
        Me.Departemen.HeaderText = "Departemen"
        Me.Departemen.Name = "Departemen"
        Me.Departemen.ReadOnly = True
        Me.Departemen.Width = 125
        '
        'GroupControl3
        '
        Me.GroupControl3.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.GroupControl3.Appearance.BackColor = System.Drawing.Color.WhiteSmoke
        Me.GroupControl3.Appearance.Font = New System.Drawing.Font("Trebuchet MS", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupControl3.Appearance.ForeColor = System.Drawing.Color.Black
        Me.GroupControl3.Appearance.Options.UseBackColor = True
        Me.GroupControl3.Appearance.Options.UseFont = True
        Me.GroupControl3.Appearance.Options.UseForeColor = True
        Me.GroupControl3.Controls.Add(Me.dg_employee)
        Me.GroupControl3.Location = New System.Drawing.Point(12, 6)
        Me.GroupControl3.LookAndFeel.SkinName = "Office 2010 Silver"
        Me.GroupControl3.LookAndFeel.UseDefaultLookAndFeel = False
        Me.GroupControl3.Name = "GroupControl3"
        Me.GroupControl3.Size = New System.Drawing.Size(556, 604)
        Me.GroupControl3.TabIndex = 283
        Me.GroupControl3.Text = "DAFTAR KARYAWAN"
        '
        'Panel2
        '
        Me.Panel2.Controls.Add(Me.btn_keluar)
        Me.Panel2.Controls.Add(Me.btn_prev)
        Me.Panel2.Controls.Add(Me.GroupControl1)
        Me.Panel2.Controls.Add(Me.btn_next)
        Me.Panel2.Controls.Add(Me.GroupControl3)
        Me.Panel2.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Panel2.Font = New System.Drawing.Font("Trebuchet MS", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Panel2.Location = New System.Drawing.Point(0, 0)
        Me.Panel2.Name = "Panel2"
        Me.Panel2.Size = New System.Drawing.Size(1018, 672)
        Me.Panel2.TabIndex = 284
        '
        'btn_keluar
        '
        Me.btn_keluar.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btn_keluar.Appearance.Font = New System.Drawing.Font("Calibri", 11.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btn_keluar.Appearance.Options.UseFont = True
        Me.btn_keluar.Image = Global.SMARTACCOUNTING.My.Resources.Resources.Actions_session_exit_icon__3_
        Me.btn_keluar.Location = New System.Drawing.Point(917, 619)
        Me.btn_keluar.LookAndFeel.SkinName = "Office 2010 Blue"
        Me.btn_keluar.LookAndFeel.UseDefaultLookAndFeel = False
        Me.btn_keluar.Margin = New System.Windows.Forms.Padding(3, 6, 3, 6)
        Me.btn_keluar.Name = "btn_keluar"
        Me.btn_keluar.Size = New System.Drawing.Size(87, 36)
        Me.btn_keluar.TabIndex = 286
        Me.btn_keluar.Text = "TUTUP"
        '
        'GroupControl1
        '
        Me.GroupControl1.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.GroupControl1.Appearance.BackColor = System.Drawing.Color.WhiteSmoke
        Me.GroupControl1.Appearance.Font = New System.Drawing.Font("Trebuchet MS", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupControl1.Appearance.ForeColor = System.Drawing.Color.Black
        Me.GroupControl1.Appearance.Options.UseBackColor = True
        Me.GroupControl1.Appearance.Options.UseFont = True
        Me.GroupControl1.Appearance.Options.UseForeColor = True
        Me.GroupControl1.Controls.Add(Me.dg_marketing)
        Me.GroupControl1.Location = New System.Drawing.Point(630, 6)
        Me.GroupControl1.LookAndFeel.SkinName = "Office 2010 Silver"
        Me.GroupControl1.LookAndFeel.UseDefaultLookAndFeel = False
        Me.GroupControl1.Name = "GroupControl1"
        Me.GroupControl1.Size = New System.Drawing.Size(376, 604)
        Me.GroupControl1.TabIndex = 285
        Me.GroupControl1.Text = "DAFTAR MARKETING"
        '
        'frmsetmarketing
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.WhiteSmoke
        Me.ClientSize = New System.Drawing.Size(1018, 672)
        Me.Controls.Add(Me.Panel2)
        Me.DoubleBuffered = True
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "frmsetmarketing"
        Me.ShowInTaskbar = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Setting Marketing"
        CType(Me.dg_marketing, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.dg_employee, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GroupControl3, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupControl3.ResumeLayout(False)
        Me.Panel2.ResumeLayout(False)
        CType(Me.GroupControl1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupControl1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents dg_marketing As System.Windows.Forms.DataGridView
    Friend WithEvents dg_employee As System.Windows.Forms.DataGridView
    Friend WithEvents btn_next As System.Windows.Forms.Button
    Friend WithEvents btn_prev As System.Windows.Forms.Button
    Friend WithEvents DataGridViewTextBoxColumn1 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents GroupControl3 As DevExpress.XtraEditors.GroupControl
    Friend WithEvents Panel2 As System.Windows.Forms.Panel
    Friend WithEvents GroupControl1 As DevExpress.XtraEditors.GroupControl
    Friend WithEvents colkodejenis As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents coljenis As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents jabatan As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Departemen As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents btn_keluar As DevExpress.XtraEditors.SimpleButton
End Class
