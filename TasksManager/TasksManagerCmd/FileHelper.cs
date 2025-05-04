using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Threading.Tasks;
using TasksManagerCmd.Interfaces;

namespace TasksManagerCmd
{
    public class FileHelper : IFileHelp
    {
        private string _errorLog = String.Empty;

        public string ErrorLog => _errorLog;

        public int SaveOrCreateAndSave(string path, IEnumerable<string> lines)
        {
            try
            {
                using (StreamWriter sw = File.Exists(path) ? new StreamWriter(path, true) : File.CreateText(path))
                {
                    foreach (string line in lines)
                    {
                        sw.WriteLine(line);
                    }
                }

                return 0;
            }

            catch (Exception ex)
            {
                _errorLog = ex.Message;
                return -1;
            }
        }
    }
}
