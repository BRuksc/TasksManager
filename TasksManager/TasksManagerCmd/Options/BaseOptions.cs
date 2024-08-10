using CommandLine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TasksManagerCmd.Interfaces;

namespace TasksManagerCmd.Options
{
    public abstract class BaseOptions : IBaseOptionsProps
    {
        [Option('h', "help", HelpText = "Display this help screen.")]
        public bool Help { get; set; }

        [Option('i', "IsIntegrated", Required = true)]
        public string IsIntegrated { get; set; }

        [Option('l', "AdminLogin", Required = true)]
        public string AdminLogin { get; set; }

        [Option('p', "AdminPwd", Required = true)]
        public string AdminPwd { get; set; }

        [Option('n', "ServerName", Required = true)]
        public string ServerName { get; set; }
    }
}
