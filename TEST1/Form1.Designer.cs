namespace TEST1
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.urunAdiTextBox = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.BtnEkle = new System.Windows.Forms.Button();
            this.BtnSil = new System.Windows.Forms.Button();
            this.fiyatTextBox = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.button2 = new System.Windows.Forms.Button();
            this.magazaTextBox = new System.Windows.Forms.TextBox();
            this.magazaLabel = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.urunIdTextBox = new System.Windows.Forms.TextBox();
            this.BtnAra = new System.Windows.Forms.Button();
            this.stokTextBox = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.button3 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(2, 1);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 26;
            this.dataGridView1.Size = new System.Drawing.Size(961, 348);
            this.dataGridView1.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(1005, 103);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(59, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "Urun adi";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // urunAdiTextBox
            // 
            this.urunAdiTextBox.Location = new System.Drawing.Point(1070, 100);
            this.urunAdiTextBox.Name = "urunAdiTextBox";
            this.urunAdiTextBox.Size = new System.Drawing.Size(172, 24);
            this.urunAdiTextBox.TabIndex = 2;
            this.urunAdiTextBox.TextChanged += new System.EventHandler(this.urunAdiTextBox_TextChanged);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(1081, 242);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(0, 0);
            this.button1.TabIndex = 3;
            this.button1.Text = "button1";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // BtnEkle
            // 
            this.BtnEkle.Location = new System.Drawing.Point(1081, 308);
            this.BtnEkle.Name = "BtnEkle";
            this.BtnEkle.Size = new System.Drawing.Size(125, 36);
            this.BtnEkle.TabIndex = 4;
            this.BtnEkle.Text = "Ekle";
            this.BtnEkle.UseVisualStyleBackColor = true;
            this.BtnEkle.Click += new System.EventHandler(this.button2_Click);
            // 
            // BtnSil
            // 
            this.BtnSil.Location = new System.Drawing.Point(1081, 350);
            this.BtnSil.Name = "BtnSil";
            this.BtnSil.Size = new System.Drawing.Size(125, 36);
            this.BtnSil.TabIndex = 5;
            this.BtnSil.Text = "Sil";
            this.BtnSil.UseVisualStyleBackColor = true;
            this.BtnSil.Click += new System.EventHandler(this.button3_Click);
            // 
            // fiyatTextBox
            // 
            this.fiyatTextBox.Location = new System.Drawing.Point(1070, 130);
            this.fiyatTextBox.Name = "fiyatTextBox";
            this.fiyatTextBox.Size = new System.Drawing.Size(172, 24);
            this.fiyatTextBox.TabIndex = 7;
            this.fiyatTextBox.TextChanged += new System.EventHandler(this.fiyatTextBox_TextChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(1005, 133);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(34, 17);
            this.label2.TabIndex = 6;
            this.label2.Text = "fiyat";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(1081, 255);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(125, 36);
            this.button2.TabIndex = 12;
            this.button2.Text = "goster";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click_1);
            // 
            // magazaTextBox
            // 
            this.magazaTextBox.Location = new System.Drawing.Point(1070, 70);
            this.magazaTextBox.Name = "magazaTextBox";
            this.magazaTextBox.Size = new System.Drawing.Size(172, 24);
            this.magazaTextBox.TabIndex = 13;
            this.magazaTextBox.TextChanged += new System.EventHandler(this.magazaTextBox_TextChanged);
            // 
            // magazaLabel
            // 
            this.magazaLabel.AutoSize = true;
            this.magazaLabel.Location = new System.Drawing.Point(1005, 77);
            this.magazaLabel.Name = "magazaLabel";
            this.magazaLabel.Size = new System.Drawing.Size(69, 17);
            this.magazaLabel.TabIndex = 14;
            this.magazaLabel.Text = "magaza id";
            this.magazaLabel.TextAlign = System.Drawing.ContentAlignment.BottomRight;
            this.magazaLabel.Click += new System.EventHandler(this.magazaLabel_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(1005, 47);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(51, 17);
            this.label3.TabIndex = 16;
            this.label3.Text = "urunID";
            this.label3.TextAlign = System.Drawing.ContentAlignment.BottomRight;
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // urunIdTextBox
            // 
            this.urunIdTextBox.Location = new System.Drawing.Point(1070, 40);
            this.urunIdTextBox.Name = "urunIdTextBox";
            this.urunIdTextBox.Size = new System.Drawing.Size(172, 24);
            this.urunIdTextBox.TabIndex = 15;
            this.urunIdTextBox.TextChanged += new System.EventHandler(this.urunIdTextBox_TextChanged);
            // 
            // BtnAra
            // 
            this.BtnAra.Location = new System.Drawing.Point(1081, 213);
            this.BtnAra.Name = "BtnAra";
            this.BtnAra.Size = new System.Drawing.Size(125, 36);
            this.BtnAra.TabIndex = 17;
            this.BtnAra.Text = "ara";
            this.BtnAra.UseVisualStyleBackColor = true;
            this.BtnAra.Click += new System.EventHandler(this.BtnAra_Click);
            // 
            // stokTextBox
            // 
            this.stokTextBox.Location = new System.Drawing.Point(1070, 160);
            this.stokTextBox.Name = "stokTextBox";
            this.stokTextBox.Size = new System.Drawing.Size(172, 24);
            this.stokTextBox.TabIndex = 18;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(1005, 160);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(34, 17);
            this.label4.TabIndex = 19;
            this.label4.Text = "stok";
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(1081, 392);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(125, 36);
            this.button3.TabIndex = 20;
            this.button3.Text = "guncelleme";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click_1);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1291, 441);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.stokTextBox);
            this.Controls.Add(this.BtnAra);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.urunIdTextBox);
            this.Controls.Add(this.magazaLabel);
            this.Controls.Add(this.magazaTextBox);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.fiyatTextBox);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.BtnSil);
            this.Controls.Add(this.BtnEkle);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.urunAdiTextBox);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridView1);
            this.Name = "Form1";
            this.Text = "c";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox urunAdiTextBox;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button BtnEkle;
        private System.Windows.Forms.Button BtnSil;
        private System.Windows.Forms.TextBox fiyatTextBox;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.TextBox magazaTextBox;
        private System.Windows.Forms.Label magazaLabel;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox urunIdTextBox;
        private System.Windows.Forms.Button BtnAra;
        private System.Windows.Forms.TextBox stokTextBox;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button button3;
    }
}

