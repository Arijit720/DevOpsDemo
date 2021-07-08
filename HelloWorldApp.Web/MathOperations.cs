using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HelloWorldApp.Web
{
    public class MathOperations
    {
        public double Add(double num1, double num2)
        {
            return num1 + num2;
        }
        public double Subtract(double num1, double num2)
        {
            return num1 - num2;
        }
        public double Divide(double num1, double num2)
        {
            return num1 / num2;
        }
        public double Multiply(double num1, double num2)
        {
            // To trace error while testing, writing + operator instead of * operator.  
            return num1 + num2;
        }
    }
}
