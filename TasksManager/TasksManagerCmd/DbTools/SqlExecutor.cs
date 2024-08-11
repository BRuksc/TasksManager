using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TasksManagerCmd.Interfaces;

namespace TasksManagerCmd.DbTools
{
    public class SqlExecutor : ISqlExecute
    {
        private readonly string _connectionString;

        public SqlExecutor(string connectionString) =>
            _connectionString = connectionString;

        public void ExecuteCommand(string cmd)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                try
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand(cmd, connection))
                    {
                        command.ExecuteNonQuery();
                    }
                }

                catch (Exception ex)
                {
                    Console.WriteLine("An error occured: " + ex.Message);
                }

                finally
                {
                    connection.Close();
                }
            }
        }

        public void ExecuteScript(string path)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                try
                {
                    connection.Open();

                    var scriptText = File.ReadAllText(path);

                    using (SqlCommand command = new SqlCommand(scriptText, connection))
                    {
                        command.ExecuteNonQuery();
                    }
                }

                catch (Exception ex)
                {
                    Console.WriteLine("An error occured: " + ex.Message);
                }

                finally
                {
                    connection.Close();
                }
            }
        }

        public void ExecuteAllScriptsInDirectory(string directory)
        {
            string projectCmdRoot = AppDomain.CurrentDomain.BaseDirectory;
            string projectDbPath = String.Empty;

#if DEBUG 
            projectDbPath = Path.GetFullPath(Path.Combine(projectCmdRoot, @"..\..\..\..\TasksManager.Database\bin\Debug\" + directory));

#else
            projectDbPath = Path.GetFullPath(Path.Combine(projectCmdRoot, @"..\..\..\..\TasksManager.Database\bin\Release\" + directory));
#endif

            if (Directory.Exists(projectDbPath))
            {
                string[] fileNames = Directory.GetFiles(projectDbPath);

                foreach (var fileName in fileNames)
                {
                    ExecuteScript(fileName);
                }
            }
        }
    }
}
