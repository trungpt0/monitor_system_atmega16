namespace ViXuLy
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea1 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Legend legend1 = new System.Windows.Forms.DataVisualization.Charting.Legend();
            System.Windows.Forms.DataVisualization.Charting.Series series1 = new System.Windows.Forms.DataVisualization.Charting.Series();
            System.Windows.Forms.DataVisualization.Charting.Title title1 = new System.Windows.Forms.DataVisualization.Charting.Title();
            this.boxcom = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.boxbau = new System.Windows.Forms.ComboBox();
            this.button_com = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.button_led1 = new System.Windows.Forms.Button();
            this.button_led2 = new System.Windows.Forms.Button();
            this.button_led3 = new System.Windows.Forms.Button();
            this.button_led4 = new System.Windows.Forms.Button();
            this.button_led5 = new System.Windows.Forms.Button();
            this.button_led6 = new System.Windows.Forms.Button();
            this.button_led7 = new System.Windows.Forms.Button();
            this.button_led8 = new System.Windows.Forms.Button();
            this.listView1 = new System.Windows.Forms.ListView();
            this.listView2 = new System.Windows.Forms.ListView();
            this.label13 = new System.Windows.Forms.Label();
            this.listView3 = new System.Windows.Forms.ListView();
            this.label14 = new System.Windows.Forms.Label();
            this.boxtimer = new System.Windows.Forms.ComboBox();
            this.label15 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label16 = new System.Windows.Forms.Label();
            this.chart1 = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.serialPort1 = new System.IO.Ports.SerialPort(this.components);
            this.button_timer1 = new System.Windows.Forms.Button();
            this.label17 = new System.Windows.Forms.Label();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.label18 = new System.Windows.Forms.Label();
            this.label19 = new System.Windows.Forms.Label();
            this.label20 = new System.Windows.Forms.Label();
            this.label21 = new System.Windows.Forms.Label();
            this.label22 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.chart1)).BeginInit();
            this.SuspendLayout();
            // 
            // boxcom
            // 
            this.boxcom.FormattingEnabled = true;
            resources.ApplyResources(this.boxcom, "boxcom");
            this.boxcom.Name = "boxcom";
            this.boxcom.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label1.ForeColor = System.Drawing.SystemColors.ControlText;
            resources.ApplyResources(this.label1, "label1");
            this.label1.Name = "label1";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // label2
            // 
            resources.ApplyResources(this.label2, "label2");
            this.label2.Name = "label2";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // label3
            // 
            this.label3.BackColor = System.Drawing.SystemColors.ControlLightLight;
            resources.ApplyResources(this.label3, "label3");
            this.label3.Name = "label3";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // boxbau
            // 
            this.boxbau.FormattingEnabled = true;
            resources.ApplyResources(this.boxbau, "boxbau");
            this.boxbau.Name = "boxbau";
            this.boxbau.SelectedIndexChanged += new System.EventHandler(this.comboBox2_SelectedIndexChanged);
            // 
            // button_com
            // 
            this.button_com.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            resources.ApplyResources(this.button_com, "button_com");
            this.button_com.Name = "button_com";
            this.button_com.UseVisualStyleBackColor = false;
            this.button_com.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // label4
            // 
            resources.ApplyResources(this.label4, "label4");
            this.label4.Name = "label4";
            // 
            // label5
            // 
            this.label5.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label5.ForeColor = System.Drawing.SystemColors.ControlText;
            resources.ApplyResources(this.label5, "label5");
            this.label5.Name = "label5";
            // 
            // label6
            // 
            this.label6.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label6.ForeColor = System.Drawing.SystemColors.ControlText;
            resources.ApplyResources(this.label6, "label6");
            this.label6.Name = "label6";
            this.label6.Click += new System.EventHandler(this.label6_Click);
            // 
            // label7
            // 
            this.label7.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label7.ForeColor = System.Drawing.SystemColors.ControlText;
            resources.ApplyResources(this.label7, "label7");
            this.label7.Name = "label7";
            this.label7.Click += new System.EventHandler(this.label7_Click);
            // 
            // label8
            // 
            this.label8.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label8.ForeColor = System.Drawing.SystemColors.ControlText;
            resources.ApplyResources(this.label8, "label8");
            this.label8.Name = "label8";
            // 
            // label9
            // 
            this.label9.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label9.ForeColor = System.Drawing.SystemColors.ControlText;
            resources.ApplyResources(this.label9, "label9");
            this.label9.Name = "label9";
            this.label9.Click += new System.EventHandler(this.label9_Click);
            // 
            // label10
            // 
            this.label10.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label10.ForeColor = System.Drawing.SystemColors.ControlText;
            resources.ApplyResources(this.label10, "label10");
            this.label10.Name = "label10";
            // 
            // label11
            // 
            this.label11.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label11.ForeColor = System.Drawing.SystemColors.ControlText;
            resources.ApplyResources(this.label11, "label11");
            this.label11.Name = "label11";
            this.label11.Click += new System.EventHandler(this.label11_Click);
            // 
            // label12
            // 
            this.label12.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label12.ForeColor = System.Drawing.SystemColors.ControlText;
            resources.ApplyResources(this.label12, "label12");
            this.label12.Name = "label12";
            // 
            // button_led1
            // 
            this.button_led1.BackColor = System.Drawing.Color.Lime;
            resources.ApplyResources(this.button_led1, "button_led1");
            this.button_led1.Name = "button_led1";
            this.button_led1.UseVisualStyleBackColor = false;
            this.button_led1.Click += new System.EventHandler(this.button2_Click);
            // 
            // button_led2
            // 
            this.button_led2.BackColor = System.Drawing.Color.Lime;
            resources.ApplyResources(this.button_led2, "button_led2");
            this.button_led2.Name = "button_led2";
            this.button_led2.UseVisualStyleBackColor = false;
            this.button_led2.Click += new System.EventHandler(this.button3_Click);
            // 
            // button_led3
            // 
            this.button_led3.BackColor = System.Drawing.Color.Lime;
            resources.ApplyResources(this.button_led3, "button_led3");
            this.button_led3.Name = "button_led3";
            this.button_led3.UseVisualStyleBackColor = false;
            this.button_led3.Click += new System.EventHandler(this.button_led3_Click);
            // 
            // button_led4
            // 
            this.button_led4.BackColor = System.Drawing.Color.Lime;
            resources.ApplyResources(this.button_led4, "button_led4");
            this.button_led4.Name = "button_led4";
            this.button_led4.UseVisualStyleBackColor = false;
            this.button_led4.Click += new System.EventHandler(this.button_led4_Click);
            // 
            // button_led5
            // 
            this.button_led5.BackColor = System.Drawing.Color.Lime;
            resources.ApplyResources(this.button_led5, "button_led5");
            this.button_led5.Name = "button_led5";
            this.button_led5.UseVisualStyleBackColor = false;
            this.button_led5.Click += new System.EventHandler(this.button_led5_Click);
            // 
            // button_led6
            // 
            this.button_led6.BackColor = System.Drawing.Color.Lime;
            resources.ApplyResources(this.button_led6, "button_led6");
            this.button_led6.Name = "button_led6";
            this.button_led6.UseVisualStyleBackColor = false;
            this.button_led6.Click += new System.EventHandler(this.button_led6_Click);
            // 
            // button_led7
            // 
            this.button_led7.BackColor = System.Drawing.Color.Lime;
            resources.ApplyResources(this.button_led7, "button_led7");
            this.button_led7.Name = "button_led7";
            this.button_led7.UseVisualStyleBackColor = false;
            this.button_led7.Click += new System.EventHandler(this.button_led7_Click);
            // 
            // button_led8
            // 
            this.button_led8.BackColor = System.Drawing.Color.Lime;
            resources.ApplyResources(this.button_led8, "button_led8");
            this.button_led8.Name = "button_led8";
            this.button_led8.UseVisualStyleBackColor = false;
            this.button_led8.Click += new System.EventHandler(this.button_led8_Click);
            // 
            // listView1
            // 
            this.listView1.BackColor = System.Drawing.Color.White;
            this.listView1.HideSelection = false;
            resources.ApplyResources(this.listView1, "listView1");
            this.listView1.Name = "listView1";
            this.listView1.UseCompatibleStateImageBehavior = false;
            this.listView1.SelectedIndexChanged += new System.EventHandler(this.listView1_SelectedIndexChanged);
            // 
            // listView2
            // 
            this.listView2.HideSelection = false;
            resources.ApplyResources(this.listView2, "listView2");
            this.listView2.Name = "listView2";
            this.listView2.UseCompatibleStateImageBehavior = false;
            // 
            // label13
            // 
            resources.ApplyResources(this.label13, "label13");
            this.label13.Name = "label13";
            // 
            // listView3
            // 
            this.listView3.HideSelection = false;
            resources.ApplyResources(this.listView3, "listView3");
            this.listView3.Name = "listView3";
            this.listView3.UseCompatibleStateImageBehavior = false;
            // 
            // label14
            // 
            this.label14.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label14.ForeColor = System.Drawing.SystemColors.ControlText;
            resources.ApplyResources(this.label14, "label14");
            this.label14.Name = "label14";
            // 
            // boxtimer
            // 
            this.boxtimer.FormattingEnabled = true;
            resources.ApplyResources(this.boxtimer, "boxtimer");
            this.boxtimer.Name = "boxtimer";
            this.boxtimer.SelectedIndexChanged += new System.EventHandler(this.boxtimer_SelectedIndexChanged);
            // 
            // label15
            // 
            resources.ApplyResources(this.label15, "label15");
            this.label15.Name = "label15";
            this.label15.Click += new System.EventHandler(this.label15_Click);
            // 
            // textBox1
            // 
            resources.ApplyResources(this.textBox1, "textBox1");
            this.textBox1.Name = "textBox1";
            this.textBox1.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // label16
            // 
            resources.ApplyResources(this.label16, "label16");
            this.label16.Name = "label16";
            this.label16.Click += new System.EventHandler(this.label16_Click);
            // 
            // chart1
            // 
            chartArea1.Name = "ChartArea1";
            this.chart1.ChartAreas.Add(chartArea1);
            legend1.Name = "Legend1";
            this.chart1.Legends.Add(legend1);
            resources.ApplyResources(this.chart1, "chart1");
            this.chart1.Name = "chart1";
            series1.ChartArea = "ChartArea1";
            series1.ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Line;
            series1.Legend = "Legend1";
            series1.Name = "Temperature";
            this.chart1.Series.Add(series1);
            title1.BackColor = System.Drawing.Color.White;
            title1.Name = "Title1";
            title1.Text = "Temperature Chart";
            this.chart1.Titles.Add(title1);
            this.chart1.Click += new System.EventHandler(this.chart1_Click);
            // 
            // timer1
            // 
            this.timer1.Enabled = true;
            this.timer1.Interval = 200;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // serialPort1
            // 
            this.serialPort1.DataReceived += new System.IO.Ports.SerialDataReceivedEventHandler(this.serialPort1_DataReceived);
            // 
            // button_timer1
            // 
            this.button_timer1.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            resources.ApplyResources(this.button_timer1, "button_timer1");
            this.button_timer1.Name = "button_timer1";
            this.button_timer1.UseVisualStyleBackColor = false;
            this.button_timer1.Click += new System.EventHandler(this.button1_Click);
            // 
            // label17
            // 
            resources.ApplyResources(this.label17, "label17");
            this.label17.Name = "label17";
            this.label17.Click += new System.EventHandler(this.label17_Click);
            // 
            // textBox2
            // 
            resources.ApplyResources(this.textBox2, "textBox2");
            this.textBox2.Name = "textBox2";
            this.textBox2.TextChanged += new System.EventHandler(this.textBox2_TextChanged);
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            resources.ApplyResources(this.button1, "button1");
            this.button1.Name = "button1";
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click_2);
            // 
            // label18
            // 
            this.label18.BackColor = System.Drawing.Color.White;
            resources.ApplyResources(this.label18, "label18");
            this.label18.Name = "label18";
            // 
            // label19
            // 
            resources.ApplyResources(this.label19, "label19");
            this.label19.BackColor = System.Drawing.Color.White;
            this.label19.Name = "label19";
            // 
            // label20
            // 
            resources.ApplyResources(this.label20, "label20");
            this.label20.Name = "label20";
            // 
            // label21
            // 
            resources.ApplyResources(this.label21, "label21");
            this.label21.Name = "label21";
            this.label21.Click += new System.EventHandler(this.label21_Click);
            // 
            // label22
            // 
            resources.ApplyResources(this.label22, "label22");
            this.label22.Name = "label22";
            // 
            // Form1
            // 
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Coral;
            this.Controls.Add(this.label22);
            this.Controls.Add(this.label21);
            this.Controls.Add(this.label20);
            this.Controls.Add(this.label19);
            this.Controls.Add(this.label18);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.label17);
            this.Controls.Add(this.button_timer1);
            this.Controls.Add(this.chart1);
            this.Controls.Add(this.label16);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label15);
            this.Controls.Add(this.boxtimer);
            this.Controls.Add(this.label14);
            this.Controls.Add(this.listView3);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.button_led8);
            this.Controls.Add(this.button_led7);
            this.Controls.Add(this.button_led6);
            this.Controls.Add(this.button_led5);
            this.Controls.Add(this.button_led4);
            this.Controls.Add(this.button_led3);
            this.Controls.Add(this.button_led2);
            this.Controls.Add(this.button_led1);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.button_com);
            this.Controls.Add(this.boxbau);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.boxcom);
            this.Controls.Add(this.listView1);
            this.Controls.Add(this.listView2);
            this.Cursor = System.Windows.Forms.Cursors.Default;
            this.ForeColor = System.Drawing.SystemColors.ControlText;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Name = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.chart1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.ComboBox boxcom;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox boxbau;
        private System.Windows.Forms.Button button_com;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Button button_led1;
        private System.Windows.Forms.Button button_led2;
        private System.Windows.Forms.Button button_led3;
        private System.Windows.Forms.Button button_led4;
        private System.Windows.Forms.Button button_led5;
        private System.Windows.Forms.Button button_led6;
        private System.Windows.Forms.Button button_led7;
        private System.Windows.Forms.Button button_led8;
        private System.Windows.Forms.ListView listView1;
        private System.Windows.Forms.ListView listView2;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.ListView listView3;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.ComboBox boxtimer;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.DataVisualization.Charting.Chart chart1;
        private System.Windows.Forms.Timer timer1;
        private System.IO.Ports.SerialPort serialPort1;
        private System.Windows.Forms.Button button_timer1;
        private System.Windows.Forms.Label label17;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label18;
        private System.Windows.Forms.Label label19;
        private System.Windows.Forms.Label label20;
        private System.Windows.Forms.Label label21;
        private System.Windows.Forms.Label label22;
    }
}

