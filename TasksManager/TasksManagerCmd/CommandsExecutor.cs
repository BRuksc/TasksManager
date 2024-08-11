using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TasksManagerCmd.DbTools;
using TasksManagerCmd.Interfaces;
using TasksManagerCmd.Options;

namespace TasksManagerCmd
{
    public class CommandsExecutor : ICommandsExecute
    {
        private IConnectionStringBuild _connectionStringBuilder;

        public int RunDbInitialization(DbInitializationOptions options)
        {
            _connectionStringBuilder = 
                new ConnectionStringBuilder<DbInitializationOptions>(options);

            IDbManage dbManager = new DbManager(_connectionStringBuilder);

            dbManager.Initialize(options.DbName);

            return 0;
        }

        public int RunExecProcedure(DbExecProcedureOptions options)
        {
            _connectionStringBuilder =
                new ConnectionStringBuilder<DbExecProcedureOptions>(options);

            IDbManage dbManager = new DbManager(_connectionStringBuilder);

            dbManager.ExecProcedure(options.ProcName, options.ProcParameters);

            return 0;
        }
    }
}
