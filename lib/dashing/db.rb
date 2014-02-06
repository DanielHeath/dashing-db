require "dashing/db/version"

module Dashing
  module Db
    class History

      def initialize(connection)
        @connection = connection
        troubleshoot_connection
      end

      def [](key)
        v = table.where(:key => key).select(:value)
        return nil if v.nil?
        v[:value]
      end

      def []=(key, value)
        updated_count = table.where(:key => key).update(:value => value)
        if updated_count == 0
          table.insert(:key => key, :value => value)
        end
      end

      def all
        {}.tap do |all|
          table.each do |item|
            all[item[:key]] = item[:value]
          end
        end
      end

      def each(&block)
        all.each(&block)
      end
      include Enumerable

      private

      def table
        @connection[:items]
      end

      def troubleshoot_connection
        begin
          table.first
        rescue Exception => e
          setup_schema
        end
        table.first
      end

      def setup_schema
        @connection.create_table :items do
          String :key, :primary_key => true
          File :value
        end
      end

    end
  end
end
