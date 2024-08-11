using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TasksManagerCmd
{
    public static class DbObjects
    {
        public static readonly IEnumerable<string> Types = new List<string>()
        {
            "Tables",
            "Procedures",
            "Triggers",
            "Constraints",
            "Functions",
            "FK"
        };
    }
}
