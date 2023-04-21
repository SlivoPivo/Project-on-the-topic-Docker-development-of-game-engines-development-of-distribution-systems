using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

// подключение пространств имен
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Http;
using ClassLibrary1; // общая сборка

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        Class1 remote; // переменная, которая представляет удаленный доступ

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // 4. Вызвать метод CalcEquation() из серверной части для вычисления квадратного уравнения
            double a, b, c;
            double x1, x2;
            bool f;
            a = Double.Parse(textBox1.Text);
            b = Double.Parse(textBox2.Text);
            c = Double.Parse(textBox3.Text);

            // вызов удаленного метода
            f = remote.CalcEquation(a, b, c, out x1, out x2);

             // вывод результата
             if (f)
                 label4.Text = "Результат: x1 = " + x1.ToString() + "; x2 = " + x2.ToString();
             else
                 label4.Text = "Уравнение не имеет корней.";
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // Выполнение действий на стороне клиента
            // 1. Создать канал между клиентом и сервером
            HttpChannel ch = new HttpChannel(); // номер порта не нужен

             // 2. Зарегистрировать канал
             ChannelServices.RegisterChannel(ch, false);

             // 3. Создать объект удаленного доступа к серверу
             remote =  (Class1)Activator.GetObject(
              typeof(Class1),
               "http://localhost:5000/MathFunctions.soap"); // localhost - временное имя нашего компьютера
        }
    }
}
