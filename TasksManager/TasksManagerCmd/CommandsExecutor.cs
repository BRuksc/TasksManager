using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
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

        public int RunAddDbDirectory(AddDbDirectoryOptions options)
        {
            string projectCmdRoot = AppDomain.CurrentDomain.BaseDirectory;
            string jSonDirectoryPath = String.Empty;

#if DEBUG 
            jSonDirectoryPath = Path.GetFullPath(Path.Combine(projectCmdRoot, @"..\..\..\..\TasksManager\bin\Debug\jSonFiles\DbDirectory.json"));
#else
            jSonDirectoryPath = Path.GetFullPath(Path.Combine(projectCmdRoot, @"..\..\..\..\TasksManager\bin\Debug\jSonFiles\DbDirectory.json"));
#endif
            IEnumerable<string> lines = new List<string>
            {
                "{",
                "   path: " + jSonDirectoryPath,
                "}"
            };

            var fileHelper = new FileHelper();
            fileHelper.SaveOrCreateAndSave(jSonDirectoryPath, lines);

            return 0;
        }

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
