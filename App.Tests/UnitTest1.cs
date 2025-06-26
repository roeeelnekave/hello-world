using System;
using System.IO;
using Xunit;

namespace App.Tests
{
    public class ProgramTests
    {
        [Fact]
        public void HelloWorld_ShouldReturnHelloWorld()
        {
            var result = Program.HelloWorld();
            Assert.Equal("Hello World!", result);
        }

        [Fact]
        public void Main_ShouldPrintHelloWorldToConsole()
        {
            var originalOut = Console.Out;
            using var stringWriter = new StringWriter();
            Console.SetOut(stringWriter);

            try
            {
                Program.Main(Array.Empty<string>());

                var output = stringWriter.ToString().Trim();
                Assert.Equal("Hello World!", output);
            }
            finally
            {
                Console.SetOut(originalOut);
            }
        }
    }
}
