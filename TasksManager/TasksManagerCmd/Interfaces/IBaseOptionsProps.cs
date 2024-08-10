using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TasksManagerCmd.Interfaces
{
    public interface IBaseOptionsProps
    {
        public string ServerName { get; set; }
        public string IsIntegrated { get; set; }
        public string AdminLogin { get; set; }
        public string AdminPwd { get; set; }
    }
}
