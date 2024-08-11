using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TasksManagerCmd.Interfaces
{
    public interface IConnectionStringBuild
    {
        public string ConnectionStringWithMaster();
        public string ConnectionStringWithDbName();
    }
}
