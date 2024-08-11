using CommandLine;
using TasksManagerCmd;
using TasksManagerCmd.Interfaces;
using TasksManagerCmd.Options;

namespace TaskManagerCmd
{
    public class Program
    {
        public static int Main(string[] args)
        {
            ICommandsExecute commandsExecutor = new CommandsExecutor();

            return Parser.Default.ParseArguments<DbInitializationOptions, DbExecProcedureOptions>(args)
                .MapResult(
                    (DbInitializationOptions options) => commandsExecutor.RunDbInitialization(options),
                    (DbExecProcedureOptions options) => commandsExecutor.RunExecProcedure(options),
                    errors => 1
                );
        }

    }
}