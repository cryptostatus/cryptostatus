module Social
  class DataBuilder
    FILE = 'base.jpg'

    def self.call
      growth = ReportQuery.max_growth
      drop = ReportQuery.max_drop

      { path: FILE,
        font_size: 85,
        font_family: 'Helvetica',
        text_coords: {"#{drop.name}": ['205, 380', '#fff'],
                      "#{drop.price.round}$": ['600, 380', '#2ace42'],
                      "#{growth.name}": ['205, 220', '#fff'],
                      "#{growth.price.round}$": ['600, 220', '#b01e1f']
                     } }
    end
  end
end
