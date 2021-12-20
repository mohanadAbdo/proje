using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Npgsql;

namespace TEST1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        NpgsqlConnection baglanti = new NpgsqlConnection("server=localHost; port=5432;Database=P5; user ID =postgres; password=4020813Sa");
        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut1 = new NpgsqlCommand("DELETE FROM urunleri WHERE urun_id = @p1 ",baglanti);
            komut1.Parameters.AddWithValue("@p1", int.Parse(urunIdTextBox.Text));
            komut1.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("silindi");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut1 = new NpgsqlCommand("insert into urunleri (magaza_id,fiyat,urun_adi,stok) Values(@p1,@p2,@p3,@p4)", baglanti);
            komut1.Parameters.AddWithValue("@p1", int.Parse( magazaTextBox.Text));
            komut1.Parameters.AddWithValue("@p2", int.Parse( fiyatTextBox.Text));
            komut1.Parameters.AddWithValue("@p3", urunAdiTextBox.Text);
            komut1.Parameters.AddWithValue("@p4", int.Parse(stokTextBox.Text));
            komut1.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Eklendi");
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            string sorgu = "SELECT * FROM urunleri ";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void BtnAra_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand cmd = new NpgsqlCommand("select * from urun_arama( '%" + urunAdiTextBox.Text + "%')", baglanti);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            baglanti.Close();
        }
        private void button3_Click_1(object sender, EventArgs e)
        {

            baglanti.Open();
            NpgsqlCommand komut1 = new NpgsqlCommand("UPDATE urunleri SET urun_adi=@p1, fiyat=@p2 , stok=@p3 WHERE urun_id =@p4", baglanti);
            komut1.Parameters.AddWithValue("@p1", urunAdiTextBox.Text);
            komut1.Parameters.AddWithValue("@p2", double.Parse(fiyatTextBox.Text));
            komut1.Parameters.AddWithValue("@p3", int.Parse(stokTextBox.Text));
            komut1.Parameters.AddWithValue("@p4", int.Parse(urunIdTextBox.Text));
            komut1.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("guncellendi");
        }

        private void urunIdTextBox_TextChanged(object sender, EventArgs e)
        {

        }
        private void magazaLabel_Click(object sender, EventArgs e)
        {

        }
        private void magazaTextBox_TextChanged(object sender, EventArgs e)
        {

        }
        private void label3_Click(object sender, EventArgs e)
        {

        }
        private void fiyatTextBox_TextChanged(object sender, EventArgs e)
        {

        }
        private void label2_Click(object sender, EventArgs e)
        {

        }
        private void button1_Click(object sender, EventArgs e)
        {

        }
        private void urunAdiTextBox_TextChanged(object sender, EventArgs e)
        {

        }

    }
}
