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
    public partial class calisanlar : Form
    {
        public calisanlar()
        {
            InitializeComponent();
        }
        NpgsqlConnection baglanti = new NpgsqlConnection("server=localHost; port=5432;Database=P5; user ID =postgres; password=4020813Sa");
        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            string sorgu = "select DISTINCT (calisan_id),(adi),(soy_adi),(adres),(telefon_numara),(sehir),(ulke) from calisanlar " +
                "INNER join adres using (adres_id)"+
                "inner join sehir using (sehir_id)"+
                "inner join ulke USING(ulke_id)";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void BtnEkle_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut1 = new NpgsqlCommand("insert into calisanlar (adi ,soy_adi , adres_id) values (@p1 , @p2 , @p3)", baglanti);
            komut1.Parameters.AddWithValue("@p1", adTextBox.Text);
            komut1.Parameters.AddWithValue("@p2", soyAdtextBox.Text);
            komut1.Parameters.AddWithValue("@p3", int.Parse(adresIdTextBox.Text));
            komut1.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Eklendi");
        }

        private void silButtun_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut1 = new NpgsqlCommand("DELETE FROM calisanlar WHERE calisan_id = @p1 ", baglanti);
            komut1.Parameters.AddWithValue("@p1", int.Parse(calisanIdTextBox.Text));
            komut1.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("silindi");
        }
    }
}
