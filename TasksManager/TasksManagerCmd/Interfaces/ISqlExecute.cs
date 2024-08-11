using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TasksManagerCmd.Interfaces
{
    public interface ISqlExecute
    {
        public void ExecuteScript(string path);
        public void ExecuteCommand(string cmd);
        public void ExecuteAllScriptsInDirectory(string directory);
    }
}
