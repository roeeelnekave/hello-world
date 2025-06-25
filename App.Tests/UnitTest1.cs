using System;
using System.IO; //for StringWriter
using Xunit;

namespace App.Tests
{
    public class ProgramTests
    {
        [Fact]
        public void HelloWorld_ReturnCorrectMessage()
        {
            var result = Program.HelloWorld();

            Assert.Equal("Hello World!", result);
        }

        [Fact]
        public void GetHelloWorld_NotReturnNull()
        {
            var result = Program.HelloWorld();

            Assert.NotNull(result);
        }

        [Fact]
        public void HelloWorld_NotReturnEmpty()
        {
            var result = Program.HelloWorld();

            Assert.NotEmpty(result);
        }

        [Fact]
        public void Main_PrintToConsole()
        {
            var originalOut = Console.Out;
            using var stringWriter = new StringWriter();
            Console.SetOut(stringWriter);

            try
            {
                Program.Main(new string[] { });

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