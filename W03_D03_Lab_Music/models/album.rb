require_relative('../db/sql_runner')

class Album

  attr_accessor :title, :genera, :artist_id
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @genera = options['genera']
    @artist_id = options['artist_id']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO albums(
    title,
    genera,
    artist_id
    ) VALUES (
      $1, $2, $3
      ) RETURNING id;"
      values = [@title, @genera, @artist_id]
      @id = SqlRunner.run(sql, values)[0]['id'].to_i
    end


    def self.delete_all()
      sql = "DELETE FROM albums;"
      SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM albums;"
      albums = SqlRunner.run(sql)
      return albums.map { |album| Album.new(album) }
    end

    def artist()
      sql = "SELECT name FROM artists WHERE id = $1;"
      values = [@artist_id]
      results = SqlRunner.run(sql, values)[0]
      return Artist.new(results)
    end

    def update()
      sql = "UPDATE albums SET (
      title,
      genera,
      artist_id
      ) = (
        $1, $2, $3
        ) WHERE id = $4;"
        values = [@title, @genera, @artist_id, @id]
        SqlRunner.run(sql, values)
      end


      def delete
        sql = "DELETE FROM albums WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
      end

      def self.find(id)
        sql = "SELECT * FROM albums WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values)[0]
        album = Album.new(result)
        return album
      end


    end
