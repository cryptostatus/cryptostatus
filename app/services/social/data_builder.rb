module Social
  class DataBuilder
    FILE = 'base.jpg'

    def self.call
      growth_info = ReportQuery.new.call
      growth = growth_info[:max_growth]
      drop = growth_info[:max_drop]

      { path: FILE,
        font_size: 85,
        font_family: 'Helvetica',
        text_coords: {"#{drop[:name]}": ['130, 380', '#fff'],
                      "#{drop[:price].round(5)}$": ['530, 380', '#b01e1f'],
                      "#{growth[:name]}": ['130, 220', '#fff'],
                      "#{growth[:price].round(5)}$": ['530, 220', '#2ace42']
                     } }
    end
  end
end
