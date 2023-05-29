class MainController < ApplicationController
    def start
        @table_names = ActiveRecord::Base.connection.tables
        @selected_table = params[:table_name]
        if @selected_table
          # Внимание! Ниже приведен небезопасный код для демонстрации sql-инъекции.
          # Никогда не используйте такой подход в реальном приложении.
          @products = ActiveRecord::Base.connection.execute("SELECT * FROM #{@selected_table} LIMIT 200")
        end
    end
end
