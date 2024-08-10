using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TasksManagerCmd.Interfaces;
using TasksManagerCmd.Options;

namespace TasksManagerCmd
{
    public static class CommandsExecutor
    {
        public static int RunDbInitialization(DbInitializationOptions options)
        {
            Console.WriteLine("Test");

            return 0;
        }
    }
}
