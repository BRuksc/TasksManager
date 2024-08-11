using CommandLine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TasksManagerCmd.Interfaces;

namespace TasksManagerCmd.Options
{
    [Verb("DbExec", isDefault: true, null, HelpText = "Verb for executing procedure command")]
    public class DbExecProcedureOptions : BaseOptions, IDbExecProcedureProps
    {
        [Option('c', "ProcName", Required = true)]
        public string ProcName { get; set; }

        [Option('a', "ProcParams", Required = true)]
        public string ProcParameters { get; set; }
    }
}
