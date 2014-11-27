module ActiveRecord
  module Tasks
    class PostgreSQLDatabaseTasks
      def drop
        establish_master_connection
        connection.select_all "select pg_terminate_backend(pg_stat_activity.procpid) from pg_stat_activity where datname='#{configuration['database']}';"
        connection.drop_database configuration['database']
      end
    end
  end
end