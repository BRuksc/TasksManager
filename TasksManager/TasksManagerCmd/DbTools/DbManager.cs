using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TasksManagerCmd.Interfaces;

namespace TasksManagerCmd.DbTools
{
    public class DbManager : IDbManage
    {
        private readonly IConnectionStringBuild _connectionStringBuilder;
        private ISqlExecute _sqlExecutor;

        public DbManager(IConnectionStringBuild connectionStringBuilder)
        {
            _connectionStringBuilder = connectionStringBuilder;
            _sqlExecutor = new SqlExecutor(connectionStringBuilder.ConnectionStringWithMaster());
        }

        public void Initialize(string dbName)
        {
            _sqlExecutor.ExecuteCommand("CREATE DATABASE " + dbName);

            _sqlExecutor = new SqlExecutor(_connectionStringBuilder.ConnectionStringWithDbName());

            string projectCmdRoot = AppDomain.CurrentDomain.BaseDirectory;
            string projectDbPath = String.Empty;

#if DEBUG 
            projectDbPath = Path.GetFullPath(Path.Combine(projectCmdRoot, @"..\..\..\..\TasksManager.Database\bin\Debug\Tables"));

#else
            projectDbPath = Path.GetFullPath(Path.Combine(projectCmdRoot, @"..\..\..\..\TasksManager.Database\bin\Release\Tables"));
#endif

            ExecuteAllScriptsInDirectory(projectDbPath);
        }

        private void ExecuteAllScriptsInDirectory(string directoryPath)
        {
            if (Directory.Exists(directoryPath))
            {
                string[] fileNames = Directory.GetFiles(directoryPath);

                foreach (var fileName in fileNames)
                {
                    _sqlExecutor.ExecuteScript(fileName);
                }
            }
        }
    }
}
