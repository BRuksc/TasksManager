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

        public void ExecProcedure(string procName, string parameters) =>
            _sqlExecutor.ExecuteCommand("EXEC dbo." + procName + " " + parameters);

        public void Initialize(string dbName)
        {
            _sqlExecutor.ExecuteCommand("CREATE DATABASE " + dbName);

            _sqlExecutor = new SqlExecutor(_connectionStringBuilder.ConnectionStringWithDbName());

            foreach (var type in DbObjects.Types)
            {
                _sqlExecutor.ExecuteAllScriptsInDirectory(type);
            }
        }
    }
}
