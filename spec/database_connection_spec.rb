require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database, through PG' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

      DatabaseConnection.setup('bookmark_manager_test')
      # why on earth....
    end

    it 'this connection is persistent' do
      #the self.setup method should return a connection,
      connection = DatabaseConnection.setup('bookmark_manager_test')
      # and when we look for it, it should still be there.
      expect(DatabaseConnection.connection).to eq(connection)
    end
  end
  describe '.query' do    
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")

      #why do we need this line
      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end
