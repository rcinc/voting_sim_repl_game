
class Campaign
  attr_accessor :votes_republican, :votes_democrat, :candidates, :voters

  def initialize(candidates, voters)
    @votes_republican = 0
    @votes_democrat = 0
    @candidates = candidates
    @voters = voters
  end


  def voter_choice
    @voters.each do |v|
      case v.politics
      when "Libertarian"
        if rand(1..100) <= 90
         v.vote_for = "Republican"
        else
          v.vote_for = "Democrat"
        end
      when "Conservative"
        if rand(1..100) <= 75
          v.vote_for = "Republican"
        else
          v.vote_for = "Democrat"
        end
      when "Independent"
        if rand(1..100) <= 50
          v.vote_for = "Republican"
        else
          v.vote_for = "Democrat"
        end
      when "Progressive"
        if rand(1..100) <= 25
          v.vote_for = "Republican"
        else
          v.vote_for = "Democrat"
        end
      when "Massachusetts Democrat"
        if rand(1..100) <= 10
          v.vote_for = "Republican"
        else
          v.vote_for = "Democrat"
        end
      end
    end
  end

  def tally_votes
    @voters.each do |v|
      if v.vote_for == "Republican"
        @votes_republican += 1
      else
        @votes_democrat += 1
      end

    end
  end

  def election_winner
    if @votes_republican > @votes_democrat
      puts "Republicans win"
    else
      puts "Democrats win"
    end
  end
end
