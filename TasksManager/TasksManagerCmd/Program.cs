using CommandLine;
using TasksManagerCmd;
using TasksManagerCmd.Interfaces;
using TasksManagerCmd.Options;

namespace TaskManagerCmd
{
    public class Program
    {
        public static int Main(string[] args) =>
                Parser.Default.ParseArguments<DbInitializationOptions>(args)
               .MapResult(
                       (DbInitializationOptions options) =>
                           CommandsExecutor.RunDbInitialization(options),
                       errors => 1
                );
    }
}