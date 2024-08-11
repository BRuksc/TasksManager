using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TasksManagerCmd.Interfaces;
using TasksManagerCmd.Options;

namespace TasksManagerCmd.DbTools
{
    public class ConnectionStringBuilder<T> : IConnectionStringBuild where T : BaseOptions
    {
        private readonly T _options;

        public ConnectionStringBuilder(T options) => _options = options;

        public string ConnectionStringWithDbName()
        {
            bool isIntegrated = false;
            bool.TryParse(_options.IsIntegrated, out isIntegrated);

            var connectionStringBuilder = new SqlConnectionStringBuilder()
            {
                DataSource = _options.ServerName,
                IntegratedSecurity = isIntegrated,
                UserID = _options.AdminLogin,
                Password = _options.AdminPwd,
                TrustServerCertificate = true,
                InitialCatalog = _options.DbName
            };

            return connectionStringBuilder.ConnectionString;
        }

        public string ConnectionStringWithMaster()
        {
            bool isIntegrated = false;
            bool.TryParse(_options.IsIntegrated, out isIntegrated);

            var connectionStringBuilder = new SqlConnectionStringBuilder()
            {
                DataSource = _options.ServerName,
                IntegratedSecurity = isIntegrated,
                UserID = _options.AdminLogin,
                Password = _options.AdminPwd,
                InitialCatalog = "master"
            };

            return connectionStringBuilder.ConnectionString;
        }
    }
}
