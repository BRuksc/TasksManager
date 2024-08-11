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
            string[] testArr = new string[]
            {
                "DbInitialization",
                "-itrue",
                "-ladmin",
                "-pQwerty123",
                "-nKINGA",
                "-dtest"
            };

            ICommandsExecute commandsExecutor = new CommandsExecutor();

            return
                Parser.Default.ParseArguments<DbInitializationOptions>(testArr)
                .MapResult(
                       (DbInitializationOptions options) =>
                           commandsExecutor.RunDbInitialization(options),
                       errors => 1
                );
        }

    }
}