using CommandLine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TasksManagerCmd.Options
{
    [Verb(CommandsNames.AddDbDirectory, isDefault: true, null, HelpText = "Verb for adding db directory path")]
    public class AddDbDirectoryOptions : BaseOptions
    {
        [Option('h', "Path", Required = true)]
        public string DirectoryPath { get; set; }
    }
}
