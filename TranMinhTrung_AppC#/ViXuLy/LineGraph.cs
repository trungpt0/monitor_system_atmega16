using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;
using System.Windows.Forms.DataVisualization.Charting;

namespace ViXuLy
{
    public class LineGraph
    {
        #region Properties
        public double xAxisMax {  get; set; }
        public double xAxisMin { get; set; }
        public double xAxisInterval { get; set; }
        public double yAxisMax { get; set; }
        public double yAxisMin { get; set; }
        public double yAxisInterval { get; set; }
        public int LineWidth { get; set; }
        public Color linecolor { get; set; }
        public double yMinorInt { get; set; }
        #endregion

        #region Constructor
        public LineGraph(Chart chart1, double xAxisMin, double xAxisMax, double xAxisInterval,
            double yAxisMin,double yAxisMax, double yAxisInterval, int lineWidth, int numMinorYGrid)
        {
            //this.xAxisInterval = xAxisInterval;
            this.yAxisMin = yAxisMin;
            this.yAxisMax = yAxisMax;
            this.yAxisInterval = yAxisInterval;
            this.LineWidth = lineWidth;
            //this.yMinorInt = yAxisInterval / (1.0 + numMinorYGrid);

            chart1.Series["Temperature"].ChartType = SeriesChartType.Line;

            chart1.ChartAreas["ChartArea1"].AxisX.Minimum = xAxisMin;
            chart1.ChartAreas["ChartArea1"].AxisX.Maximum = xAxisMax;
            //chart1.ChartAreas["ChartArea1"].AxisX.Interval = xAxisInterval;
            chart1.ChartAreas["ChartArea1"].AxisY.Minimum = yAxisMin;
            chart1.ChartAreas["ChartArea1"].AxisY.Maximum = yAxisMax;
            chart1.ChartAreas["ChartArea1"].AxisY.Interval = yAxisInterval;

            chart1.Series["Temperature"].BorderWidth = lineWidth;
            //chart1.Legends.Clear();

        }
        #endregion
    }
}
