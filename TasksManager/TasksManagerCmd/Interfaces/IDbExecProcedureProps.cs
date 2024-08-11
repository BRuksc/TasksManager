using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TasksManagerCmd.Interfaces
{
    public interface IDbExecProcedureProps : IBaseOptionsProps
    {
        public string ProcName { get; set; }
        public string ProcParameters { get; set; }
    }
}
