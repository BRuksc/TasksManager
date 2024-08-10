using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TasksManagerCmd.Interfaces
{
    public interface IDbInitializeProps : IBaseOptionsProps
    {
        public string DbName { get; set; }
    }
}