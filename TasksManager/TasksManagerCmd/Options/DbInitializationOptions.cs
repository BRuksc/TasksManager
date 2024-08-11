using CommandLine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TasksManagerCmd.Interfaces;

namespace TasksManagerCmd.Options
{
    [Verb("DbInitialization", isDefault: true, null, HelpText = "Verb for initialization database command")]
    public class DbInitializationOptions : BaseOptions
    {

    }
}
