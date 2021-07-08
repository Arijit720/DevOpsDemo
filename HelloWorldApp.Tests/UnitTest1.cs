using NUnit.Framework;
using HelloWorldApp.Web;

public class MathOperationsTests
{
    [Test()]
    public void AddTest()
    {
        MathOperations bm = new MathOperations();
        double res = bm.Add(10, 10);
        Assert.AreEqual(res, 20);
    }

    [Test()]
    public void SubtractTest()
    {
        MathOperations bm = new MathOperations();
        double res = bm.Subtract(10, 10);
        Assert.AreEqual(res, 0);
    }

    [Test()]
    public void DivideTest()
    {
        MathOperations bm = new MathOperations();
        double res = bm.Divide(10, 5);
        Assert.AreEqual(res, 2);
    }

    [Test()]
    public void MultiplyTest()
    {
        MathOperations bm = new MathOperations();
        double res = bm.Multiply(10, 5);
        Assert.AreEqual(res, 50);
    }
}
