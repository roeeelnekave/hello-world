using System;

namespace App
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var message = HelloWorld();
            Console.WriteLine(message);
        }
        public static string HelloWorld()
        {
            return "Hello World!";
        }
    }
}