using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TasksManagerCmd.Interfaces
{
    public interface IDbManage
    {
        public void Initialize(string dbName);
    }
}
