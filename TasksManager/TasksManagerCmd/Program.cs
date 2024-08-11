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

            if (args.Contains(CommandsNames.DbInitialization))
            {
                return Parser.Default.ParseArguments<DbInitializationOptions>(args)
                    .MapResult(
                        options => commandsExecutor.RunDbInitialization(options),
                        errors => 1
                    );
            }
            else if (args.Contains(CommandsNames.DbExec))
            {
                return Parser.Default.ParseArguments<DbExecProcedureOptions>(args)
                    .MapResult(
                        options => commandsExecutor.RunExecProcedure(options),
                        errors => 1
                    );
            }
            else
            {
                Console.WriteLine("Unknown command.");
                return 1;
            }
        }

    }
}