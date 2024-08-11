using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TasksManagerCmd.Options;

namespace TasksManagerCmd.Interfaces
{
    public interface ICommandsExecute
    {
        public int RunDbInitialization(DbInitializationOptions options);
        public int RunExecProcedure(DbExecProcedureOptions options);
    }
}
