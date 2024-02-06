using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO.Ports;
using System.Windows.Forms.DataVisualization.Charting;

namespace ViXuLy
{
    public partial class Form1 : Form
    {
        List<double> xVals = new List<double>();
        List<double> yVals = new List<double>();

        //public Random rnd = new Random();
        double tick = 0.0;
        double tempe = 0.0;
        public Form1()
        {
            InitializeComponent();

            LineGraph graph1 = new LineGraph(chart1, 0, 10, 0.2, 0, 50, 5, 3, 0);
            //configStripline();
            /* chart1.ChartAreas["ChartArea1"].AxisX.Minimum = 0;
            chart1.ChartAreas["ChartArea1"].AxisX.Maximum = 5;
            chart1.ChartAreas["ChartArea1"].AxisY.Minimum = 10;
            chart1.ChartAreas["ChartArea1"].AxisY.Maximum = 20;
            chart1.ChartAreas["ChartArea1"].AxisY.Interval = 5;
            chart1.ChartAreas["ChartArea1"].AxisY.MinorGrid.Enabled = true;
            chart1.ChartAreas["ChartArea1"].AxisY.MinorGrid.LineDashStyle = ChartDashStyle.Dash;
            chart1.ChartAreas["ChartArea1"].AxisY.MinorGrid.LineColor = Color.DarkGray;
            chart1.ChartAreas["ChartArea1"].AxisY.MinorGrid.Interval = chart1.ChartAreas["ChartArea1"].AxisY.Interval / 2;

            chart1.Series["Temperature"].BorderWidth = 3;
            chart1.Series["Temperature"].Points.AddXY(0, 10);
            chart1.Series["Temperature"].Points.AddXY(1, 20);
            chart1.Series["Temperature"].ChartType = SeriesChartType.Line; */
        }

        int cnt1 = 0, cnt2 = 0, cnt3 = 0, cnt4 = 0, cnt5 = 0, cnt6 = 0, cnt7 = 0, cnt8 = 0;
        string[] listbaud = { "600", "1200", "2400", "4800", "9600", "14400", "19200", "38400", "56000", "115200" };
        string[] listtimer = { "500", "1000", "1500", "2000", "2500", "3000", "3500", "4000", "4500", "5000" };
        private void Form1_Load(object sender, EventArgs e)
        {
            string[] listcom = SerialPort.GetPortNames();
            boxcom.Items.AddRange(listcom);
            boxbau.Items.AddRange(listbaud);
            boxtimer.Items.AddRange(listtimer);
        }

        private void label1_Click(object sender, EventArgs e)
        {
            
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public void button1_Click_1(object sender, EventArgs e)
        {
            if (boxcom.Text == "")
            {
                MessageBox.Show("You have not selected a COM port!");
            }

            if (boxbau.Text == "")
            {
                MessageBox.Show("You have not selected a Baudrate!");
            }

            if (serialPort1.IsOpen == true)
            {
                serialPort1.Close();
                button_com.Text = "Connect";
            } 
            else
            {
                serialPort1.PortName = boxcom.Text;
                serialPort1.BaudRate = int.Parse(boxbau.Text);
                serialPort1.Open();
                button_com.Text = "Disconnect";
            }


        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void button_led3_Click(object sender, EventArgs e)
        {
            if (boxcom.Text == "" || boxbau.Text == "")
            {
                MessageBox.Show("Please connect UART!");
            }
            cnt3++;
            serialPort1.Write("c");
            if (cnt3 % 2 == 1)
            {
                button_led3.Text = "LED3 OFF";
                button_led3.BackColor = Color.Red;
            }
            else
            {
                button_led3.Text = "LED3 ON";
                button_led3.BackColor = Color.Lime;
            }
        }

        private void button_led4_Click(object sender, EventArgs e)
        {
            if (boxcom.Text == "" || boxbau.Text == "")
            {
                MessageBox.Show("Please connect UART!");
            }
            cnt4++;
            serialPort1.Write("d");
            if (cnt4 % 2 == 1)
            {
                button_led4.Text = "LED4 OFF";
                button_led4.BackColor = Color.Red;
            }
            else
            {
                button_led4.Text = "LED4 ON";
                button_led4.BackColor = Color.Lime;
            }
        }

        private void button_led5_Click(object sender, EventArgs e)
        {
            if (boxcom.Text == "" || boxbau.Text == "")
            {
                MessageBox.Show("Please connect UART!");
            }
            cnt5++;
            serialPort1.Write("e");
            if (cnt5 % 2 == 1)
            {
                button_led5.Text = "LED5 OFF";
                button_led5.BackColor = Color.Red;
            }
            else
            {
                button_led5.Text = "LED5 ON";
                button_led5.BackColor = Color.Lime;
            }
        }

        private void button_led6_Click(object sender, EventArgs e)
        {
            if (boxcom.Text == "" || boxbau.Text == "")
            {
                MessageBox.Show("Please connect UART!");
            }
            cnt6++;
            serialPort1.Write("f");
            if (cnt6 % 2 == 1)
            {
                button_led6.Text = "LED6 OFF";
                button_led6.BackColor = Color.Red;
            }
            else
            {
                button_led6.Text = "LED6 ON";
                button_led6.BackColor = Color.Lime;
            }
        }

        private void button_led7_Click(object sender, EventArgs e)
        {
            if (boxcom.Text == "" || boxbau.Text == "")
            {
                MessageBox.Show("Please connect UART!");
            }
            cnt7++;
            serialPort1.Write("g");
            if (cnt7 % 2 == 1)
            {
                button_led7.Text = "LED7 OFF";
                button_led7.BackColor = Color.Red;
            }
            else
            {
                button_led7.Text = "LED7 ON";
                button_led7.BackColor = Color.Lime;
            }
        }

        private void button_led8_Click(object sender, EventArgs e)
        {
            if (boxcom.Text == "" || boxbau.Text == "")
            {
                MessageBox.Show("Please connect UART!");
            }
            cnt8++;
            serialPort1.Write("h");
            if (cnt8 % 2 == 1)
            {
                button_led8.Text = "LED8 OFF";
                button_led8.BackColor = Color.Red;
            }
            else
            {
                button_led8.Text = "LED8 ON";
                button_led8.BackColor = Color.Lime;
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            
        }
        string data_receive = "";
        private void serialPort1_DataReceived(object sender, SerialDataReceivedEventArgs e)
        {
            data_receive = serialPort1.ReadLine();
            if (double.TryParse(data_receive, out double chainChar))
            {
                tempe = chainChar;
            } else
            {
                if (textBox1.IsHandleCreated)
                {
                    this.Invoke((MethodInvoker)delegate
                    {
                        textBox1.Text += data_receive;
                        textBox1.SelectionStart = textBox1.TextLength;
                        textBox1.ScrollToCaret();
                    }
                    );

                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            switch (boxtimer.Text)
            {
                case "500":
                    serialPort1.Write("F0BD");
                    break;
                case "1000":
                    serialPort1.Write("E17B");
                    break;
                case "1500":
                    serialPort1.Write("D239");
                    break;
                case "2000":
                    serialPort1.Write("C2F6");
                    break;
                case "2500":
                    serialPort1.Write("B3B4");
                    break;
                case "3000":
                    serialPort1.Write("A472");
                    break;
                case "3500":
                    serialPort1.Write("9530");
                    break;
                case "4000":
                    serialPort1.Write("85ED");
                    break;
                case "4500":
                    serialPort1.Write("76AB");
                    break;
                case "5000":
                    serialPort1.Write("6769");
                    break;
            }
        }
            
        private void label17_Click(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }
        string send_data = "";
        private void button1_Click_2(object sender, EventArgs e)
        {
            switch (textBox2.Text)
            {
                case "500":
                    serialPort1.Write("F0BD");
                    break;
                case "1000":
                    serialPort1.Write("E17B");
                    break;
                case "1500":
                    serialPort1.Write("D239");
                    break;
                case "2000":
                    serialPort1.Write("C2F6");
                    break;
                case "2500":
                    serialPort1.Write("B3B4");
                    break;
                case "3000":
                    serialPort1.Write("A472");
                    break;
                case "3500":
                    serialPort1.Write("9530");
                    break;
                case "4000":
                    serialPort1.Write("85ED");
                    break;
                case "4500":
                    serialPort1.Write("76AB");
                    break;
                case "5000":
                    serialPort1.Write("6769");
                    break;
            }
        }

        private void boxtimer_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void chart1_Click(object sender, EventArgs e)
        {

        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (serialPort1.IsOpen == true)
            {
                xVals.Add(tick);
                yVals.Add(tempe);
                //yVals.Add(10.0 * rnd.NextDouble());

                if (tick > 1)
                {
                    xVals.RemoveAt(0);
                    yVals.RemoveAt(0);
                }

                chart1.ChartAreas["ChartArea1"].AxisX.Minimum = xVals[0];
                chart1.ChartAreas["ChartArea1"].AxisX.Maximum = tick;

                chart1.Series["Temperature"].Points.DataBindXY(xVals, yVals);
                tick = tick + 0.2;
            }
        }

        private void label21_Click(object sender, EventArgs e)
        {

        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void label11_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (boxcom.Text == "" || boxbau.Text == "")
            {
                MessageBox.Show("Please connect UART!");
            }
            cnt2++;
            serialPort1.Write("b");
            if (cnt2 % 2 == 1)
            {
                button_led2.Text = "LED2 OFF";
                button_led2.BackColor = Color.Red;
            }
            else
            {
                button_led2.Text = "LED2 ON";
                button_led2.BackColor = Color.Lime;
            }
        }

        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label15_Click(object sender, EventArgs e)
        {

        }

        private void label16_Click(object sender, EventArgs e)
        {
         
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (boxcom.Text == "" || boxbau.Text == "")
            {
                MessageBox.Show("Please connect UART!");
            }
            cnt1++;
            serialPort1.Write("a");
            if (cnt1 % 2 == 1)
            {
                button_led1.Text = "LED1 OFF";
                button_led1.BackColor = Color.Red;
            }
            else
            {
                button_led1.Text = "LED1 ON";
                button_led1.BackColor = Color.Lime;
            }
        }

        /*
        public void configStripline()
        {
            StripLine stripLine1 = new StripLine();
            stripLine1.StripWidth = 5;
            stripLine1.Interval = 0;
            stripLine1.IntervalOffset = 3.5;
            stripLine1.BackColor = Color.FromArgb(120, Color.Red);

            chart1.ChartAreas["ChartArea1"].AxisY.StripLines.Add(stripLine1);
        }
        */
    }
}
