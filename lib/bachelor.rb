require 'pry'
def get_first_name_of_season_winner(data, season)
  first_name = []
  data.each do |season_number, stats|
    if season == season_number
      stats.each do |identifiers|
        identifiers.each do |questions, details|
          if details == "Winner"
            first_name = identifiers["name"].split
          end
        end
      end
    end
  end
  first_name[0]
end

def get_contestant_name(data, occupation)
  data.each do |season_number, stats|
    stats.each do |bachelorette_stats|
      if bachelorette_stats["occupation"] == occupation
        return bachelorette_stats["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  bachelorette_hometown = []
  data.each do |season_number, stats|
    stats.each do |bachelorette_stats|
      if bachelorette_stats["hometown"] == hometown
        bachelorette_hometown << bachelorette_stats["hometown"]
      end
    end
  end
  bachelorette_hometown.length
end

def get_occupation(data, hometown)
  data.each do |season_number, stats|
    stats.each do |bachelorette_stats|
      if bachelorette_stats["hometown"] == hometown
        return bachelorette_stats["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  season_age =[]
  data.each do |season_number, stats|
    if season_number == season      
    stats.each do |bachelorette_stats|
      season_age << bachelorette_stats["age"].to_i
    end
  end
end
season_sum = season_age.reduce{|sum, num|sum + num}
season_avg = season_sum.to_f/season_age.length
season_avg.round
# binding.pry
end
